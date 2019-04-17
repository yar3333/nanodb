package generator;

import orm.Db;
import php.Global;
import php.Syntax;
import php.TypedArray;
using php.StringToolsNative;

class OrmGenerator
{
	var srcPath : String;
	
	public function new(srcPath:String)
    {
		this.srcPath = srcPath != "" ? srcPath.replace("\\", "/").rtrim("\\/") + "/" : "";
	}
	
	public function generate(db:Db, autogenPackage:String, customPackage:String, ignoreTables:TypedArray<String>, noInstantiateManagers:TypedArray<String>, positions:OrmPositions)
	{
		var autogenOrmClassName = autogenPackage + ".Orm";
		var customOrmClassName = customPackage + ".Orm";
		
		var tables = new TypedArray<OrmTable>();
		
		Syntax.foreach(db.connection.getTables(), function(_, tableName:String)
        {
			if (!ignoreTables.hasValue(tableName))
			{
				var table = new OrmTable(tableName, autogenPackage, customPackage);
				new OrmModelGenerator().make(db, table, customOrmClassName, srcPath, positions);
				new OrmManagerGenerator().make(db, table, customOrmClassName, srcPath, positions);
				tables.push(table);
			}
        });
		
		Log.start("MANAGERS => " + customOrmClassName);
		makeAutogenOrm(tables, autogenOrmClassName, customOrmClassName, noInstantiateManagers);
		makeCustomOrm(customOrmClassName, autogenOrmClassName);
		Log.finishSuccess();
    }
	
	
	function makeAutogenOrm(tables:TypedArray<OrmTable>, autogenOrmClassName:String, customOrmClassName:String, noInstantiateManagers:TypedArray<String>)
	{
		var autogenOrm = getAutogenOrm(tables, autogenOrmClassName, noInstantiateManagers);
		var destFileName = srcPath + autogenOrmClassName.replace(".", "/") + ".hx";
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(
			 destFileName
			,"// This is autogenerated file. Do not edit!\n\n" + autogenOrm.toString()
		);
	}
	
	function makeCustomOrm(customOrmClassName:String, autogenOrmClassName:String)
	{
		if (!Global.file_exists(srcPath + "/" + customOrmClassName.replace(".", "/") + ".hx"))
		{
			var customOrm = getCustomOrm(customOrmClassName, autogenOrmClassName);
			var destFileName = srcPath + customOrmClassName.replace(".", "/") + ".hx";
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName, customOrm.toString());
		}
	}
	
	function getAutogenOrm(tables:TypedArray<OrmTable>, fullClassName:String, noInstantiateManagers:TypedArray<String>) : PhpClass
	{
		var clas = new PhpClass(fullClassName);
		
		Syntax.foreach(tables, function(_, t:OrmTable)
		{
			clas.addVar( { haxeName:t.varName, haxeType:t.customManagerClassName, haxeDefVal:null }, false, false, true);
		});
		
		clas.addMethod(
			  "new"
			, Syntax.arrayDecl(
				{ haxeName:"db", haxeType:"orm.Db", haxeDefVal:null } 
			  )
			, "Void"
			, tables
				.filter(function(t) return !noInstantiateManagers.hasValue(t.tableName))
				.map(function(t) return "this." + t.varName + " = new " + t.customManagerClassName + "(db, cast this);")
				.join("\n")
		);
        
		return clas;
	}
	
	function getCustomOrm(fullClassName:String, autogenOrmClassName:String) : PhpClass
	{
		return new PhpClass(fullClassName, autogenOrmClassName);
	}
}
