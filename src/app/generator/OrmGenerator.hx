package generator;

import orm.Db;
import php.Global;
import php.Syntax;
import php.TypedArray;
using php.StringToolsNative;

class OrmGenerator
{
	var outPath : String;
	
	public function new(outPath:String)
    {
		this.outPath = outPath != "" ? outPath.replace("\\", "/").rtrim("\\/") + "/" : "";
	}
	
	public function generate(db:Db, autogeneratedNamespace:String, customNamespace:String, ignoreTables:TypedArray<String>, noInstantiateManagers:TypedArray<String>, positions:OrmPositions)
	{
		var autogenOrmClassName = autogeneratedNamespace + ".Orm";
		var customOrmClassName = customNamespace + ".Orm";
		var autogenOrmEntityClassName = autogeneratedNamespace + ".OrmEntity";
		var customOrmEntityClassName = customNamespace + ".OrmEntity";
		
		var tables = new TypedArray<OrmTable>();
		
		Syntax.foreach(db.connection.getTables(), function(_, tableName:String)
        {
			if (!ignoreTables.hasValue(tableName))
			{
				var table = new OrmTable(tableName, autogeneratedNamespace, customNamespace);
				new OrmModelGenerator().make(db, table, customOrmClassName, outPath, positions, customOrmEntityClassName);
				new OrmManagerGenerator().make(db, table, customOrmClassName, outPath, positions);
				new OrmQueryGenerator().make(db, table, outPath, positions);
				tables.push(table);
			}
        });
		
		Log.start("ORM => " + customOrmClassName);
		makeAutogenOrm(tables, autogenOrmClassName, customOrmClassName, noInstantiateManagers);
		makeCustomOrm(customOrmClassName, autogenOrmClassName);
		Log.finishSuccess();
		
		Log.start("ENTITY => " + customOrmEntityClassName);
		makeAutogenOrmEntity(autogenOrmEntityClassName, customOrmClassName);
		makeCustomOrmEntity(customOrmEntityClassName, autogenOrmEntityClassName);
		Log.finishSuccess();
    }
	
	
	function makeAutogenOrm(tables:TypedArray<OrmTable>, autogenOrmClassName:String, customOrmClassName:String, noInstantiateManagers:TypedArray<String>)
	{
		var autogenOrm = getAutogenOrm(tables, autogenOrmClassName, noInstantiateManagers, customOrmClassName);
		var destFileName = outPath + autogenOrmClassName.replace(".", "/") + ".php";
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(destFileName ,autogenOrm.toString());
	}
	
	function makeCustomOrm(customOrmClassName:String, autogenOrmClassName:String)
	{
		if (!Global.file_exists(outPath + "/" + customOrmClassName.replace(".", "/") + ".php"))
		{
			var customOrm = getCustomOrm(customOrmClassName, autogenOrmClassName);
			var destFileName = outPath + customOrmClassName.replace(".", "/") + ".php";
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName,customOrm.toString());
		}
	}
	
	function makeAutogenOrmEntity(autogenEntityClassName:String, customOrmClassName:String)
	{
		if (!Global.file_exists(outPath + "/" + autogenEntityClassName.replace(".", "/") + ".php"))
		{
			var customOrm = getAutogenOrmEntity(autogenEntityClassName, customOrmClassName);
			var destFileName = outPath + autogenEntityClassName.replace(".", "/") + ".php";
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName,customOrm.toString());
		}
	}
	
	function makeCustomOrmEntity(customEntityClassName:String, autogenEntityClassName:String)
	{
		if (!Global.file_exists(outPath + "/" + customEntityClassName.replace(".", "/") + ".php"))
		{
			var customOrm = getCustomOrmEntity(customEntityClassName, autogenEntityClassName);
			var destFileName = outPath + customEntityClassName.replace(".", "/") + ".php";
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName,customOrm.toString());
		}
	}
	
	function getAutogenOrm(tables:TypedArray<OrmTable>, fullClassName:String, noInstantiateManagers:TypedArray<String>, customOrmClassName:String) : PhpClass
	{
		var klass = new PhpClass(fullClassName);
		
		klass.addComment("// This file is autogenerated. Do not edit!");
		
		Syntax.foreach(tables, function(_, t:OrmTable)
		{
			klass.addVar(new PhpVar(t.varName, Tools.toPhpType(t.customManagerClassName)));
		});
		
		klass.addMethod(
			  "__construct"
			, Syntax.arrayDecl(new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")))
			, null
			, tables
				.filter(function(t) return !noInstantiateManagers.hasValue(t.tableName))
				.map(function(t) {
					return "/** @var " + Tools.toPhpType(customOrmClassName) +" $this */\n"
					     + "$this->" + t.varName + " = new " + Tools.toPhpType(t.customManagerClassName) + "($db, $this);";
				})
				.join("\n")
		);
        
		return klass;
	}
	
	function getCustomOrm(fullClassName:String, autogenOrmClassName:String) : PhpClass
	{
		return new PhpClass(fullClassName, autogenOrmClassName);
	}
	
	function getAutogenOrmEntity(fullClassName:String, customOrmClassName:String) : PhpClass
	{
		var klass = new PhpClass(fullClassName, 'nanodb.orm.Entity');
		
		klass.addComment("// This file is autogenerated. Do not edit!");
		
		klass.addVar(new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")), "protected");
		klass.addMethod("db__fromDb", Syntax.arrayDecl(), "void", "", "protected");
		klass.addMethod("db__toDb", Syntax.arrayDecl(), "void", "", "protected");
		klass.addMethod("db__fromJson", Syntax.arrayDecl(), "void", "", "protected");
		klass.addMethod("db__toJson", Syntax.arrayDecl(), "void", "", "protected");
		
		klass.addVar(new PhpVar("orm", Tools.toPhpType(customOrmClassName)), "protected");
		klass.addMethod("orm__fromDb", Syntax.arrayDecl(), "void", "", "protected");
		klass.addMethod("orm__toDb", Syntax.arrayDecl(), "void", "", "protected");
		klass.addMethod("orm__fromJson", Syntax.arrayDecl(), "void", "", "protected");
		klass.addMethod("orm__toJson", Syntax.arrayDecl(), "void", "", "protected");
		
		return klass;
	}
	
	function getCustomOrmEntity(fullClassName:String, autogenOrmEntityClassName:String) : PhpClass
	{
		return new PhpClass(fullClassName, autogenOrmEntityClassName);
	}
}
