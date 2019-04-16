package generator;

import orm.Db;
import haxe.io.Path;
import php.Syntax;
import sys.FileSystem;
import sys.io.File;
import php.TypedArray;
using php.StringToolsNative;

class OrmGenerator
{
	var srcPath : String;
	
	public function new(srcPath:String)
    {
		this.srcPath = Path.removeTrailingSlashes(srcPath.replace("\\", "/")) + "/";
	}
	
	public function generate(db:Db, autogenPackage:String, customPackage:String, ignoreTables:TypedArray<String>, noInstantiateManagers:TypedArray<String>, positions:OrmPositions)
	{
		var autogenOrmClassName = autogenPackage + ".Orm";
		var customOrmClassName = customPackage + ".Orm";
		
		var tables = new TypedArray<OrmTable>();
		
		Syntax.foreach(db.connection.getTables(), function(i, tableName)
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
		FileSystem.createDirectory(Path.directory(destFileName));
		File.saveContent(
			 destFileName
			,"// This is autogenerated file. Do not edit!\n\n" + autogenOrm.toString()
		);
	}
	
	function makeCustomOrm(customOrmClassName:String, autogenOrmClassName:String)
	{
		if (!FileSystem.exists(srcPath + "/" + customOrmClassName.replace(".", "/") + ".hx"))
		{
			var customOrm = getCustomOrm(customOrmClassName, autogenOrmClassName);
			var destFileName = srcPath + customOrmClassName.replace(".", "/") + ".hx";
			FileSystem.createDirectory(Path.directory(destFileName));
			File.saveContent(destFileName, customOrm.toString());
		}
	}
	
	function getAutogenOrm(tables:TypedArray<OrmTable>, fullClassName:String, noInstantiateManagers:TypedArray<String>) : HaxeClass
	{
		var clas = new HaxeClass(fullClassName);
		
		for (t in tables)
		{
			clas.addVar( { haxeName:t.varName, haxeType:t.customManagerClassName, haxeDefVal:null }, false, false, true);
		}
		
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
	
	function getCustomOrm(fullClassName:String, autogenOrmClassName:String) : HaxeClass
	{
		return new HaxeClass(fullClassName, autogenOrmClassName);
	}
}
