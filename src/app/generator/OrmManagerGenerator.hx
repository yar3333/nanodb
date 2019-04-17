package generator;

import orm.Db;
import php.Global;
import php.Syntax;
import php.TypedArray;
using php.StringToolsNative;

class OrmManagerGenerator 
{
	public function new() {}
	
	public function make(db:Db, table:OrmTable, customOrmClassName:String, srcPath:String, positions:OrmPositions) : Void
	{
		Log.start(table.tableName + " => " + table.customManagerClassName);
		
		var vars = OrmTools.fields2vars(table.tableName, db.connection.getFields(table.tableName), positions);
		
		var autoGeneratedManager = getAutogenManager(db, table.tableName, vars, table.customModelClassName, table.autogenManagerClassName, customOrmClassName, table.queryClassName, positions);
		var destFileName = srcPath + table.autogenManagerClassName.replace('.', '/') + '.php';
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(
			 destFileName
			,"<?php\n// This file is autogenerated. Do not edit!\n\n" + autoGeneratedManager.toString()
		);
		
		if (!Global.file_exists(srcPath + "/" + table.customManagerClassName.replace('.', '/') + '.php'))
		{
			var customManager = getCustomManager(table.tableName, vars, table.customModelClassName, table.customManagerClassName, table.autogenManagerClassName);
			var destFileName = srcPath + table.customManagerClassName.replace('.', '/') + '.php';
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName, customManager.toString());
		}
		
		Log.finishSuccess();
	}
	
	function getAutogenManager(db:Db, table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, autogenManagerClassName:String, customOrmClassName:String, queryClassName:String, positions:OrmPositions) : PhpClass
	{
		var model = new PhpClass(autogenManagerClassName);
		
		model.addVar(new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")), "protected");
		model.addVar(new PhpVar("orm", Tools.toPhpType(customOrmClassName)), "protected");
		
		model.addMethod
		(
			"query",
			new TypedArray<PhpVar>(),
			Tools.toPhpType(queryClassName),
			"return new " + Tools.toPhpType(queryClassName) + "($this->db, $this);"
		);
		
		model.addMethod
		(
			  "__construct"
			, Syntax.arrayDecl( 
				 new PhpVar("db", Tools.toPhpType("nanodb.orm.Db")),
				 new PhpVar("orm", Tools.toPhpType(customOrmClassName))
			  )
			, "void"
			, "$this->db = $db;\n$this->orm = $orm;"
		);
        
        model.addMethod
		(
			'newModelFromParams',
			cast vars,
			Tools.toPhpType(modelClassName),
			  "$_obj = new " + Tools.toPhpType(modelClassName) + "($this->db, $this->orm);\n"
			+ vars.map(function(x) return "$_obj->" + x.haxeName + " = $" + x.haxeName + ";").join('\n') + "\n"
			+ "return $_obj;",
			true
		);
		
		model.addMethod
		(
			'newModelFromAssoc',
			Syntax.arrayDecl(new PhpVar('row', "array")),
			Tools.toPhpType(modelClassName),
			  "$_obj = new " + Tools.toPhpType(modelClassName) + "($this->db, $this->orm);\n"
			+ vars.map(function(x) return "$_obj->" + x.haxeName + " = $row['" + x.haxeName + "'];").join('\n') + "\n"
			+ "return _obj;"
			, true
		);
		
		model.addMethod
		(
			'where',
			Syntax.arrayDecl(new PhpVar('field', 'string'), new PhpVar('op', 'string'), new PhpVar('value', null)),
			Tools.toPhpType(queryClassName),
			"return $this->query()->where($field, $op, $value);"
		);
		
		var getVars = vars.filter(function(x) return x.isKey);
		if (getVars.length > 0)
		{
			model.addMethod
			(
				'get',
				cast getVars,
				Tools.toPhpType(modelClassName),
				"return getBySqlOne('SELECT * FROM `" + table + "`" + getWhereSql(getVars) + ");"
			);
		}
		
		var createVars = vars.filter(function(x) return !x.isAutoInc);
		
		model.addMethod
		(
			'create',
			cast createVars,
			Tools.toPhpType(modelClassName),
			createVars.filter(positions.is).map
			(
				function(x) return 
				  "if ($" + x.haxeName + " == null)\n"
				+ "{\n"
				+ "\tposition = db.query('SELECT MAX(`" + x.name + "`) FROM `" + table + "`" 
					+ getWhereSql(getForeignKeyVars(db, table, vars))
					+ ").getIntResult(0) + 1;\n"
				+ "}\n\n"
			).join("")
			+"$this->db->query('INSERT INTO `" + table + "`("
				+ createVars.map(function(x) return "`" + x.name + "`").join(", ")
			+") VALUES (' . "
				+ createVars.map(function(x) return "$this->db->quote($" + x.haxeName + ")").join(" . ', ' . ")
			+" . ')');\n"
			+"return self::newModelFromParams(" + vars.map(function(x) return x.isAutoInc ? "$this->db->lastInsertId()" : "$" + x.haxeName).join(", ") + ");"
		);
		
		/*model.addMethod
		(
			'createNamed',
			Syntax.arrayDecl(OrmTools.createVar("data", "{ " + createVars.map(function(x) return x.haxeName + ":" + x.haxeType).join(", ") + " }")),
			modelClassName,
			createVars.filter(function(x) return positions.is(x)).map
			(
				function(x) return 
				"if ($data->" + x.haxeName + " == null)\n"
				+ "{\n"
				+ "\t$data->" + x.haxeName + " = $db->query('SELECT MAX(`" + x.name + "`) FROM `" + table + "`" 
					+ getWhereSql(getForeignKeyVars(db, table, vars))
					+ ").getIntResult(0) + 1;\n"
				+ "}\n\n"
			).join("")
			+"db.query('INSERT INTO `" + table + "`("
				+ createVars.map(function(x) return "`" + x.name + "`").join(", ")
			+") VALUES (' + "
				+ createVars.map(function(x) return "db.quote(data." + x.haxeName + ")").join(" + ', ' + ")
			+" + ')');\n"
			+"return newModelFromParams(" + vars.map(function(x) return x.isAutoInc ? 'db.lastInsertId()' : "data." + x.haxeName).join(", ") + ");"
		);*/
		
		//var dataVars: TypedArray<PhpVar> = Syntax.arrayDecl(OrmTools.createVar("data", "{ " + createVars.map(function(x) return (x.isKey ? "" : "?") + x.haxeName + ":" + x.haxeType).join(", ") + " }"));
		
		/*if (vars.exists(function(x) return x.isKey))
		{
			model.addMethod
			(
				'createOptional',
				dataVars,
				modelClassName,
				 "createOptionalNoReturn(data);\n"
				+"return get(" + getVars.map(function(x) return x.isAutoInc ? 'db.lastInsertId()' : "data." + x.haxeName).join(", ") + ");"
			);
		}*/
		
		/*model.addMethod
		(
			'createOptionalNoReturn',
			dataVars,
			"void",
			createVars.filter(function(x) return positions.is(x)).map
			(
				function(x) return 
				"if ($data->" + x.haxeName + " == null)\n"
				+ "{\n"
				+ "\t$data->" + x.haxeName + " = $db->query('SELECT MAX(`" + x.name + "`) FROM `" + table + "`" 
					+ getWhereSql(getForeignKeyVars(db, table, vars))
					+ ").getIntResult(0) + 1;\n"
				+ "}\n\n"
			).join("")
			+"$fields = [];\n"
			+"$values = [];\n"
			+createVars.map
			(
				function(x) return 
				x.isKey
					? "array_push($fields, '`" + x.name + "`'); array_push($values, $db->quote($data->" + x.haxeName + "));\n"
					: "if (isset($data->, " + x.haxeName + ")) { array_push($fields, '`" + x.name + "`'); array_push($values, $db->quote($data->" + x.haxeName + ")); }\n"
			).join("")
			+"$db->query('INSERT INTO `" + table + "`(' + implode(\", \", $fields) + ') VALUES (' + implode(\", \", $values) + ')');\n"
		);*/
		
		var deleteVars = vars.filter(function(x) return x.isKey);
		if (deleteVars.length == 0) deleteVars = vars;
		model.addMethod
		(
			'delete',
			cast deleteVars,
			'void',
			"$db->query('DELETE FROM `" + table + "`" + getWhereSql(deleteVars) + " . ' LIMIT 1');"
		);
		
		model.addMethod
		(
			'getAll',
			Syntax.arrayDecl(new PhpVar('_order', 'string', getOrderDefVal(vars, positions))),
			Tools.toPhpType(modelClassName) + '[]',
			"return $this->getBySqlMany('SELECT * FROM `" + table + "`' . ($_order != null ? ' ORDER BY ' . $_order : ''));"
		);
		
		model.addMethod
		(
			'getBySqlOne',
			Syntax.arrayDecl(new PhpVar('sql', 'string')),
			Tools.toPhpType(modelClassName),
			 "$rows = db.query($sql . ' LIMIT 1');\n"
			+"if ($rows->length == 0) return null;\n"
			+"return self::newModelFromAssoc($rows->next());"
		);
		
		model.addMethod
		(
			'getBySqlMany',
			Syntax.arrayDecl(new PhpVar('sql', 'string')),
			Tools.toPhpType(modelClassName) + '[]',
			 "$rows = $db->query($sql);\n"
			+"$r = [];\n"
			+"foreach ($rows as $row)\n"
			+"{\n"
			+"	array_push($r, self::newModelFromAssoc($row));\n"
			+"}\n"
			+"return $r;"
		);
		
        Syntax.foreach(db.connection.getUniques(table), function(_, fields:TypedArray<String>)
		{
            var vs = vars.filter(function(x) return fields.hasValue(x.name));
			createGetByMethodOne(table, vars, modelClassName, vs, model);
		});
		
        Syntax.foreach(getForeignKeyVars(db, table, vars), function(_, v:OrmPhpVar)
        {
            createGetByMethodMany(table, vars, modelClassName, Syntax.arrayDecl(v), model, positions);
        });
		
		return model;
	}
	
	function getCustomManager(table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, fullClassName:String, baseClassName:String=null) : PhpClass
	{
		var model = new PhpClass(fullClassName, baseClassName);
		
		model.addImport(modelClassName);
		
		return model;
	}
	
	function createGetByMethodOne(table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, whereVars:TypedArray<OrmPhpVar>, model:PhpClass) : Void
	{
		if (whereVars == null || whereVars.length == 0) return;
        
        model.addMethod
		(
			'getBy' + whereVars.map(function(x) return Tools.fieldAsFunctionNamePart(x.haxeName)).join('And'),
			cast whereVars, 
			Tools.toPhpType(modelClassName),
			"return getBySqlOne('SELECT * FROM `" + table + "`" + getWhereSql(whereVars) + ");"
		);
	}
	
	function createGetByMethodMany(table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, whereVars:TypedArray<OrmPhpVar>, model:PhpClass, positions:OrmPositions) : Void
	{
		if (whereVars == null || whereVars.length == 0) return;

		model.addMethod
		(
			'getBy' + whereVars.map(function(v) return Tools.fieldAsFunctionNamePart(v.haxeName)).join('And'),
			(cast whereVars:TypedArray<PhpVar>).concat(Syntax.arrayDecl(new PhpVar('_order', 'string', getOrderDefVal(vars, positions)))), 
			Tools.toPhpType(modelClassName) + '[]',
			"return getBySqlMany('SELECT * FROM `" + table + "`" + getWhereSql(whereVars) + " . ($_order != null ? ' ORDER BY ' . $_order : ''));"
		);
	}
	
	function getOrderDefVal(vars:TypedArray<OrmPhpVar>, positions:OrmPositions) : String
	{
		var positionVar = vars.filter(function(x) return positions.is(x));
		return positionVar.length == 0 ? "null" : "'" + positionVar.map(function(x) return "$" + x.name).join(", ") + "'";
	}
    
    function getWhereSql(vars:TypedArray<OrmPhpVar>) : String
    {
        return vars.length > 0
            ? " WHERE " + vars.map(function(v) return "`" + v.name + "` = ' . $db->quote($" + v.haxeName + ")").join(". ' AND ")
            : "'";
    }
    
    function getForeignKeyVars(db:Db, table:String, vars:TypedArray<OrmPhpVar>) : TypedArray<OrmPhpVar>
    {
        var foreignKeys = db.connection.getForeignKeys(table);
        var foreignKeyVars = vars.filter(function(v)
		{
            return foreignKeys.exists(function(fk) return fk.key == v.name);
        });
        return foreignKeyVars;
    }

}