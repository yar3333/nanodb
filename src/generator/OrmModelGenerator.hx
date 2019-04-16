package generator;

import haxe.io.Path;
import orm.Db;
import php.Lib;
import sys.FileSystem;
import sys.io.File;
import php.TypedArray;
import php.TypedAssoc;
using StringTools;

class OrmModelGenerator 
{
	public function new() {}
	
	public function make(db:Db, table:OrmTable, customOrmClassName:String, srcPath:String, positions:OrmPositions) : Void
	{
		Log.start(table.tableName + " => " + table.customModelClassName);
		
		var vars = OrmTools.fields2vars(table.tableName, db.connection.getFields(table.tableName), positions);
		
		var autogenModel = getAutogenModel(table.tableName, vars, table.autogenModelClassName, customOrmClassName);
		var destFileName = srcPath + table.autogenModelClassName.replace(".", "/") + ".hx";
		FileSystem.createDirectory(Path.directory(destFileName));
		File.saveContent(
			  destFileName
			, "// This is autogenerated file. Do not edit!\n\n" + autogenModel.toString()
		);
		
		if (!FileSystem.exists(srcPath + "/" + table.customModelClassName.replace(".", "/") + ".hx")) 
		{
			var customModel = getCustomModel(table.customModelClassName, table.autogenModelClassName);
			var destFileName = srcPath + table.customModelClassName.replace(".", "/") + ".hx";
			FileSystem.createDirectory(Path.directory(destFileName));
			File.saveContent(destFileName, customModel.toString());
		}
		
		Log.finishSuccess();
	}
	
	function getAutogenModel(table:String, vars:TypedArray<OrmHaxeVar>, modelClassName:String, customOrmClassName:String) : HaxeClass
	{
		var model = new HaxeClass(modelClassName);
		
		model.addVar({ haxeName:"db", haxeType:"orm.Db", haxeDefVal:null }, true);
		model.addVar({ haxeName:"orm", haxeType:customOrmClassName, haxeDefVal:null }, true);
		
		for (v in vars)
		{
			model.addVar(v);
		}
		
		model.addMethod(
			  "new"
			, Lib.toPhpArray([
				  { haxeName:"db", haxeType:"orm.Db", haxeDefVal:null }
				, { haxeName:"orm", haxeType:customOrmClassName, haxeDefVal:null } 
			  ])
			, "Void"
			, "this.db = db;\nthis.orm = orm;"
		);
        
        if (vars.exists(function(v) return v.isKey) && vars.exists(function(v) return !v.isKey))
		{
			var settedVars = vars.filter(function(v) return !v.isKey && !v.isAutoInc);
			if (settedVars.length > 0)
			{
				model.addMethod("set", settedVars, "Void",
					settedVars.map(function(v) return "this." + v.haxeName + " = " + v.haxeName + ";").join("\n")
				);
			}
			
			var savedVars = vars.filter(function(v) return !v.isKey);
			var whereVars = vars.filter(function(v) return v.isKey);
			model.addMethod("save", new TypedArray<OrmHaxeVar>(), "Void",
				  "db.query(\n"
				    + "\t 'UPDATE `" + table + "` SET '\n"
					+ "\t\t+  '" + savedVars.map(function(v) return "`" + v.name + "` = ' + db.quote(" + v.haxeName + ")").join("\n\t\t+', ")
					+ "\n\t+' WHERE " 
					+ whereVars.map(function(v) return "`" + v.name + "` = ' + db.quote(" + v.haxeName + ")").join("+' AND ")
					+ "\n\t+' LIMIT 1'"
				+ "\n);"
			);
		}
		
		return model;
	}

	function getCustomModel(customModelClassName:String, autogenModelClassName:String) : HaxeClass
	{
		return new HaxeClass(customModelClassName, autogenModelClassName);
	}
}