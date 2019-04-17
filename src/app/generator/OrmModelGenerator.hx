package generator;

import orm.Db;
import php.Global;
import php.TypedArray;
import php.Syntax;
using php.StringToolsNative;

class OrmModelGenerator 
{
	public function new() {}
	
	public function make(db:Db, table:OrmTable, customOrmClassName:String, outPath:String, positions:OrmPositions) : Void
	{
		Log.start(table.tableName + " => " + table.customModelClassName);
		
		var vars = OrmTools.fields2vars(table.tableName, db.connection.getFields(table.tableName), positions);
		
		var autogenModel = getAutogenModel(table.tableName, vars, table.autogenModelClassName, customOrmClassName);
		var destFileName = outPath + table.autogenModelClassName.replace(".", "/") + ".php";
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(
			  destFileName
			, "<?php\n// This file is autogenerated. Do not edit!\n\n" + autogenModel.toString()
		);
		
		if (!Global.file_exists(outPath + "/" + table.customModelClassName.replace(".", "/") + ".php")) 
		{
			var customModel = getCustomModel(table.customModelClassName, table.autogenModelClassName);
			var destFileName = outPath + table.customModelClassName.replace(".", "/") + ".php";
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName, customModel.toString());
		}
		
		Log.finishSuccess();
	}
	
	function getAutogenModel(table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, customOrmClassName:String) : PhpClass
	{
		var model = new PhpClass(modelClassName);
		
		model.addVar(new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")), "protected");
		model.addVar(new PhpVar("orm", Tools.toPhpType(customOrmClassName)), "protected");
		
		Syntax.foreach(vars, function(_, v:OrmPhpVar)
		{
			model.addVar(v);
		});
		
		model.addMethod(
			  "__construct"
			, Syntax.arrayDecl(
				new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")),
				new PhpVar("orm", Tools.toPhpType(customOrmClassName)) 
			  )
			, "void"
			, "$this->db = $db;\n$this->orm = $orm;"
		);
        
        if (vars.exists(function(v) return v.isKey) && vars.exists(function(v) return !v.isKey))
		{
			var settedVars = vars.filter(function(v) return !v.isKey && !v.isAutoInc);
			if (settedVars.length > 0)
			{
				model.addMethod(
					"set",
					cast settedVars,
					"void",
					settedVars.map(function(v) return "$this->" + v.haxeName + " = $" + v.haxeName + ";").join("\n")
				);
			}
			
			var savedVars = vars.filter(function(v) return !v.isKey);
			var whereVars = vars.filter(function(v) return v.isKey);
			model.addMethod(
				"save",
				Syntax.arrayDecl(),
				"void",
				"db.query(\n"
				    + "\t 'UPDATE `" + table + "` SET '\n"
					+ "\t\t.  '" + savedVars.map(function(v) return "`" + v.name + "` = ' . $this->db->quote($this->" + v.haxeName + ")").join("\n\t\t.', ")
					+ "\n\t.' WHERE " 
					+ whereVars.map(function(v) return "`" + v.name + "` = ' . $this->db->quote($this->" + v.haxeName + ")").join(".' AND ")
					+ "\n\t.' LIMIT 1'"
				+ "\n);"
			);
		}
		
		return model;
	}

	function getCustomModel(customModelClassName:String, autogenModelClassName:String) : PhpClass
	{
		return new PhpClass(customModelClassName, autogenModelClassName);
	}
}