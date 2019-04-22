package generator;

import orm.Db;
import php.Global;
import php.Syntax;
import php.TypedArray;
using php.StringToolsNative;

class OrmManagerGenerator 
{
	public function new() {}
	
	public function make(db:Db, table:OrmTable, customOrmClassName:String, outPath:String, positions:OrmPositions) : Void
	{
		Log.start(table.tableName + " => " + table.customManagerClassName);
		
		var vars = OrmTools.fields2vars(table.tableName, db.connection.getFields(table.tableName), positions);
		
		var autoGeneratedManager = getAutogenManager(db, table.tableName, vars, table.customModelClassName, table.autogeneratedManagerClassName, customOrmClassName, table.queryClassName, positions);
		var destFileName = outPath + table.autogeneratedManagerClassName.replace('.', '/') + '.php';
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(
			 destFileName
			,"<?php\n// This file is autogenerated. Do not edit!\n\n" + autoGeneratedManager.toString()
		);
		
		if (!Global.file_exists(outPath + "/" + table.customManagerClassName.replace('.', '/') + '.php'))
		{
			var customManager = getCustomManager(table.tableName, vars, table.customModelClassName, table.customManagerClassName, table.autogeneratedManagerClassName);
			var destFileName = outPath + table.customManagerClassName.replace('.', '/') + '.php';
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName, "<?php\n\n" + customManager.toString());
		}
		
		Log.finishSuccess();
	}
	
	function getAutogenManager(db:Db, table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, autogeneratedManagerClassName:String, customOrmClassName:String, queryClassName:String, positions:OrmPositions) : PhpClass
	{
		var model = new PhpClass(autogeneratedManagerClassName);
		
		var dbPhpVar = new PhpVar("db", Tools.toPhpType("nanodb.orm.Db"));
		var ormPhpVar = new PhpVar("orm", Tools.toPhpType(customOrmClassName));
		
		model.addVar(dbPhpVar, "protected");
		model.addVar(ormPhpVar, "protected");
		
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
			, Syntax.arrayDecl(dbPhpVar, ormPhpVar)
			, null
			, "$this->db = $db;\n$this->orm = $orm;"
		);
        
		model.addMethod
		(
			'newModelFromParams',
			cast vars,
			Tools.toPhpType(modelClassName),
			  "$_obj = new " + Tools.toPhpType(modelClassName) + "($this->db, $this->orm);\n"
			+ vars.map(function(x) return "$_obj->" + x.haxeName + " = $" + x.haxeName + ";").join('\n') + "\n"
			+ "return $_obj;"
		);
		
		model.addMethod
		(
			'newModelFromRow',
			Syntax.arrayDecl(new PhpVar("row", "array")),
			Tools.toPhpType(modelClassName),
			   "$_obj = new " + Tools.toPhpType(modelClassName) + "($this->db, $this->orm);\n"
			 + "$_obj->dbDeserialize($row);\n"
			 + "return $_obj;"
		);
		
		model.addMethod
		(
			'whereField',
			Syntax.arrayDecl(new PhpVar('field', 'string'), new PhpVar('op', 'string'), new PhpVar('value', null)),
			Tools.toPhpType(queryClassName),
			"return $this->query()->whereField($field, $op, $value);"
		);
		
		model.addMethod
		(
			'where',
			Syntax.arrayDecl(new PhpVar('rawSqlText', 'string')),
			Tools.toPhpType(queryClassName),
			"return $this->query()->where($rawSqlText);"
		);
		
		var getVars = vars.filter(function(x) return x.isKey);
		if (getVars.length > 0)
		{
			model.addMethod
			(
				'get',
				cast getVars,
				"?" + Tools.toPhpType(modelClassName),
				"return $this->getOne('SELECT * FROM `" + table + "`" + getWhereSql(getVars) + ");"
			);
		}
		
		var createVars = vars.filter(function(x) return !x.isAutoInc);
		var autoIncVars = vars.filter(function(x) return x.isAutoInc);
		
		model.addMethod
		(
			'create',
			cast createVars,
			Tools.toPhpType(modelClassName),
			createVars.filter(function(x) return positions.is(x.table, x.name)).map
			(
				function(x) return 
				  "if ($" + x.haxeName + " == null)\n"
				+ "{\n"
				+ "\tposition = $this->db->query('SELECT MAX(`" + x.name + "`) FROM `" + table + "`" 
					+ getWhereSql(getForeignKeyVars(db, table, vars))
					+ ").getIntResult(0) + 1;\n"
				+ "}\n\n"
			).join("")
			+"$obj = $this->newModelFromParams(" + vars.map(function(x) return x.isAutoInc ? "0" : "$" + x.haxeName).join(", ") + ");\n"
			+"$data = $this->dbSerialize([ " + createVars.map(function(x) return "'" + x.name + "'").join(", ") + " ]);\n"
			+"$fields = [];\n"
			+"$values = [];\n"
			+"foreach ($data as $k => $v) { $fields[] = \"`$k`\"; $values[] = $this->db->quote($v); }\n"
			+"$this->db->query('INSERT INTO `" + table + "`(' . implode(', ', $fields) . ') VALUES (' . implode(', ', $values) . ')');\n"
			+autoIncVars.map(function(v) return "$obj->" + v.haxeName + " = $this->db->lastInsertId();\n").join("")
			+"return $obj;"
		);
		
		var deleteVars = vars.filter(function(x) return x.isKey);
		if (deleteVars.length == 0) deleteVars = vars;
		model.addMethod
		(
			'delete',
			cast deleteVars,
			'void',
			"$this->db->query('DELETE FROM `" + table + "`" + getWhereSql(deleteVars) + " . ' LIMIT 1');"
		);
		
		model.addMethod
		(
			'getAll',
			Syntax.arrayDecl(new PhpVar('_order', 'string', getOrderDefVal(vars, positions))),
			Tools.toPhpType(modelClassName) + '[]',
			"return $this->getMany('SELECT * FROM `" + table + "`' . ($_order != null ? ' ORDER BY ' . $_order : ''));"
		);
		
		model.addMethod
		(
			'getOne',
			Syntax.arrayDecl(new PhpVar('sql', 'string')),
			"?" + Tools.toPhpType(modelClassName),
			 "$rows = $this->db->query($sql . ' LIMIT 1');\n"
			+"if ($rows->length == 0) return null;\n"
			+"return $this->newModelFromRow($rows->next());"
		);
		
		model.addMethod
		(
			'getMany',
			Syntax.arrayDecl(new PhpVar('sql', 'string')),
			Tools.toPhpType(modelClassName) + '[]',
			 "$resultSet = $this->db->query($sql);\n"
			+"$r = [];\n"
			+"while ($row = $resultSet->next())\n"
			+"{\n"
			+"	array_push($r, $this->newModelFromRow($row));\n"
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
			"?" + Tools.toPhpType(modelClassName),
			"return $this->getOne('SELECT * FROM `" + table + "`" + getWhereSql(whereVars) + ");"
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
			"return $this->getMany('SELECT * FROM `" + table + "`" + getWhereSql(whereVars) + " . ($_order != null ? ' ORDER BY ' . $_order : ''));"
		);
	}
	
	function getOrderDefVal(vars:TypedArray<OrmPhpVar>, positions:OrmPositions) : String
	{
		var positionVar = vars.filter(function(x) return positions.is(x.table, x.name));
		return positionVar.length == 0 ? "null" : "'" + positionVar.map(function(x) return "$" + x.name).join(", ") + "'";
	}
    
    function getWhereSql(vars:TypedArray<OrmPhpVar>) : String
    {
        return vars.length > 0
            ? " WHERE " + vars.map(function(v) return "`" + v.name + "` = ' . $this->db->quote($" + v.haxeName + ")").join(". ' AND ")
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