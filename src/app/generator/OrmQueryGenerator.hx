package generator;

import orm.Db;
import php.Global;
import php.TypedArray;
import php.Syntax;
using php.StringToolsNative;

class OrmQueryGenerator 
{
	public function new() {}
	
	public function make(db:Db, table:OrmTable, outPath:String, positions:OrmPositions) : Void
	{
		Log.start(table.tableName + " => " + table.queryClassName);
		
		var vars = OrmTools.fields2vars(table.tableName, db.connection.getFields(table.tableName), positions);
		
		var klass = getQueryClass(table.tableName, vars, table.queryClassName, table.customModelClassName, table.customManagerClassName);
		var destFileName = outPath + table.queryClassName.replace(".", "/") + ".php";
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(destFileName, klass.toString());
		
		Log.finishSuccess();
	}
	
	function getQueryClass(table:String, vars:TypedArray<OrmPhpVar>, queryClassName:String, customModelClassName:String, customManagerClassName:String) : PhpClass
	{
		var klass = new PhpClass(queryClassName, "nanodb.orm.SqlQuery");
		
		klass.addComment("// This file is autogenerated. Do not edit!");
		
		// function new(table:String, db:Db, manager:Manager<T>)
		klass.addMethod(
			  "__construct"
			, Syntax.arrayDecl(
				new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")),
				new PhpVar("manager", Tools.toPhpType(customManagerClassName))
			  )
			, null
			, "parent::__construct('" + table + "', $db, $manager);"
		);
		
		// function whereField(field:String, op:String, value:Dynamic) : SqlQuery<T>
		klass.addMethod(
			"whereField",
			Syntax.arrayDecl(
				new PhpVar("field", "string"),
				new PhpVar("op", "string"),
				new PhpVar("value", null)
			),
			Tools.toPhpType(queryClassName),
			"parent::whereField($field, $op, $value);\nreturn $this;"
		);
		
		// function where(rawSqlText:String) : SqlQuery<T>
		klass.addMethod(
			"where",
			Syntax.arrayDecl(
				new PhpVar("rawSqlText", "string")
			),
			Tools.toPhpType(queryClassName),
			"parent::where($rawSqlText);\nreturn $this;"
		);
		
		//function orderAsc(value:Dynamic) : SqlQuery<T>
		klass.addMethod(
			"orderAsc",
			Syntax.arrayDecl(
				new PhpVar("value", null)
			),
			Tools.toPhpType(queryClassName),
			"parent::orderAsc($value);\nreturn $this;"
		);
		
		//function orderDesc(value:Dynamic) : SqlQuery<T>
		klass.addMethod(
			"orderDesc",
			Syntax.arrayDecl(
				new PhpVar("value", null)
			),
			Tools.toPhpType(queryClassName),
			"parent::orderDesc($value);\nreturn $this;"
		);
		
		//function findMany(?limit:Int, ?offset:Int) : TypedArray<T>
		klass.addMethod(
			"findMany",
			Syntax.arrayDecl(
				new PhpVar("limit", "int", "null"),
				new PhpVar("offset", "int", "null")
			),
			Tools.toPhpType(customModelClassName) + "[]",
			"return parent::findMany($limit, $offset);"
		);

		//function findOne() : T
		klass.addMethod(
			"findOne",
			Syntax.arrayDecl(),
			"?" + Tools.toPhpType(customModelClassName),
			"return parent::findOne();"
		);
		
		return klass;
	}
}