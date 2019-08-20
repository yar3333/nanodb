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
		
		var autoGeneratedManager = getAutogenManager(db, table.tableName, vars, table.customModelClassName, table.autogeneratedManagerClassName, customOrmClassName, table.customManagerClassName, table.queryClassName, positions);
		var destFileName = outPath + table.autogeneratedManagerClassName.replace('.', '/') + '.php';
		Tools.mkdir(Global.dirname(destFileName));
		Global.file_put_contents(destFileName, autoGeneratedManager.toString());
		
		if (!Global.file_exists(outPath + "/" + table.customManagerClassName.replace('.', '/') + '.php'))
		{
			var customManager = getCustomManager(vars, table.customModelClassName, table.customManagerClassName, table.autogeneratedManagerClassName);
			var destFileName = outPath + table.customManagerClassName.replace('.', '/') + '.php';
			Tools.mkdir(Global.dirname(destFileName));
			Global.file_put_contents(destFileName, customManager.toString());
		}
		
		Log.finishSuccess();
	}
	
	function getAutogenManager(db:Db, table:String, vars:TypedArray<OrmPhpVar>, modelClassName:String, autogeneratedManagerClassName:String, customOrmClassName:String, customManagerClassName:String, queryClassName:String, positions:OrmPositions) : PhpClass
	{
		var klass = new PhpClass(autogeneratedManagerClassName, queryClassName);
		
		klass.addGlobalComment("// This file is autogenerated. Do not edit!");
		
		var dbPhpVar = new PhpVar("db", Tools.toPhpType("nanodb.orm.Db"));
		var ormPhpVar = new PhpVar("orm", Tools.toPhpType(customOrmClassName));
		var serializerPhpVar = new PhpVar("serializer", Tools.toPhpType("nanodb.orm.ISerializer"));
		
		klass.addVar(ormPhpVar, "protected");
		
		klass.addMethod
		(
			  "__construct"
			, Syntax.arrayDecl(dbPhpVar, ormPhpVar, serializerPhpVar)
			, null
			, "parent::__construct($db, $serializer);\n" +
			  "$this->orm = $orm;"
		);
        
		var getVars = vars.filter(function(x) return x.isKey);
		if (getVars.length > 0)
		{
			klass.addMethod
			(
				'get',
				cast getVars,
				"?" + Tools.toPhpType(modelClassName),
				"return $this->getOne('SELECT * FROM `' . $this->table . '`" + getWhereSql(getVars) + ");"
			);
		}
		
		var createVars = vars.filter(function(x) return !x.isAutoInc);
		var autoIncVars = vars.filter(function(x) return x.isAutoInc);
		
		klass.addMethod
		(
			'add',
			Syntax.arrayDecl(new PhpVar('obj', Tools.toPhpType(modelClassName))),
			'void',
			createVars.filter(function(x) return positions.is(x.table, x.name)).map
			(
				function(x) return 
				  "if ($obj->" + x.haxeName + " == null)\n"
				+ "{\n"
				+ "\t$obj->" + x.name + " = $this->db->query('SELECT MAX(`" + x.name + "`) FROM `' . $this->table . '`" 
					+ getWhereSql(getForeignKeyVars(db, table, vars), "obj->")
					+ ")->getIntResult(0) + 1;\n"
				+ "}\n\n"
			).join("")
			+"$data = $this->serializer->serializeObject($obj, [ " + createVars.map(function(x) return "'" + x.name + "'").join(", ") + " ]);\n"
			+"$fields = [];\n"
			+"$values = [];\n"
			+"foreach ($data as $k => $v) { $fields[] = \"`$k`\"; $values[] = $this->db->quote($v); }\n"
			+"$this->db->query('INSERT INTO `' . $this->table . '`(' . implode(', ', $fields) . ') VALUES (' . implode(', ', $values) . ')');"
			+(autoIncVars.length > 0 ? "\n" + autoIncVars.map(function(v) return "$obj->" + v.haxeName + " = $this->db->lastInsertId();").join("\n") : "")
		);
		
		if (vars.exists(function(v) return v.isKey) && vars.exists(function(v) return !v.isKey))
		{
			var savedVars = vars.filter(function(v) return !v.isKey);
			var whereVars = vars.filter(function(v) return v.isKey);
			klass.addMethod(
				"save",
				Syntax.arrayDecl(
					new PhpVar("obj", Tools.toPhpType(modelClassName)),
					new PhpVar("properties", "string[]", "null")
				),
				"void",
				  "if ($properties === null) $properties = [ " + savedVars.map(function(x) return "'" + x.name + "'").join(", ") + " ];\n"
				+ "\n"
				+ "$data = $this->serializer->serializeObject($obj, $properties);\n"
				+ "$sets = []; foreach ($data as $k => $v) $sets[] = \"`$k` = \" . $this->db->quote($v);\n"
				+ "\n"
				+ "$keys = $this->serializer->serializeObject($obj, [ " + whereVars.map(function(x) return "'" + x.name + "'").join(", ") + " ]);\n"
				+ "$wheres = []; foreach ($keys as $k => $v) $wheres[] = \"`$k` = \" . $this->db->quote($v);\n"
				+ "\n"
				+ "$this->db->query('UPDATE `' . $this->table . '` SET ' . implode(', ', $sets) . ' WHERE ' . implode(' AND ', $wheres) . ' LIMIT 1');"
			);
		}
		
		var deleteVars = vars.filter(function(x) return x.isKey);
		if (deleteVars.length == 0) deleteVars = vars;
		klass.addMethod
		(
			'deleteBy' + deleteVars.map(function(x) return Tools.fieldAsFunctionNamePart(x.haxeName)).join('And'),
			cast deleteVars,
			'void',
			"$this->db->query('DELETE FROM `' . $this->table . '`" + getWhereSql(deleteVars) + " . ' LIMIT 1');"
		);
		
        Syntax.foreach(db.connection.getUniques(table), function(_, fields:TypedArray<String>)
		{
            var vs = vars.filter(function(x) return fields.hasValue(x.name));
			createGetByMethodOne(vars, modelClassName, vs, klass);
		});
		
        Syntax.foreach(getForeignKeyVars(db, table, vars), function(_, v:OrmPhpVar)
        {
            createGetByMethodMany(vars, modelClassName, Syntax.arrayDecl(v), klass, positions);
        });
		
		return klass;
	}
	
	function getCustomManager(vars:TypedArray<OrmPhpVar>, modelClassName:String, fullClassName:String, baseClassName:String=null) : PhpClass
	{
		var model = new PhpClass(fullClassName, baseClassName);
		
		if (Tools.getNamespace(modelClassName) != Tools.getNamespace(fullClassName))
		{
			model.addImport(modelClassName);
		}
		
		return model;
	}
	
	function createGetByMethodOne(vars:TypedArray<OrmPhpVar>, modelClassName:String, whereVars:TypedArray<OrmPhpVar>, model:PhpClass) : Void
	{
		if (whereVars == null || whereVars.length == 0) return;
        
        model.addMethod
		(
			'getBy' + whereVars.map(function(x) return Tools.fieldAsFunctionNamePart(x.haxeName)).join('And'),
			cast whereVars, 
			"?" + Tools.toPhpType(modelClassName),
			"return $this->getOne('SELECT * FROM `' . $this->table . '`" + getWhereSql(whereVars) + ");"
		);
	}
	
	function createGetByMethodMany(vars:TypedArray<OrmPhpVar>, modelClassName:String, whereVars:TypedArray<OrmPhpVar>, model:PhpClass, positions:OrmPositions) : Void
	{
		if (whereVars == null || whereVars.length == 0) return;

		model.addMethod
		(
			'getBy' + whereVars.map(function(v) return Tools.fieldAsFunctionNamePart(v.haxeName)).join('And'),
			(cast whereVars:TypedArray<PhpVar>).concat(Syntax.arrayDecl(new PhpVar('_order', 'string', getOrderDefVal(vars, positions)))), 
			Tools.toPhpType(modelClassName) + '[]',
			"return $this->getMany('SELECT * FROM `' . $this->table . '`" + getWhereSql(whereVars) + " . ($_order !== null ? ' ORDER BY ' . $_order : ''));"
		);
	}
	
	function getOrderDefVal(vars:TypedArray<OrmPhpVar>, positions:OrmPositions) : String
	{
		var positionVar = vars.filter(function(x) return positions.is(x.table, x.name));
		return positionVar.length == 0 ? "null" : "'" + positionVar.map(function(x) return x.name).join(", ") + "'";
	}
    
    function getWhereSql(vars:TypedArray<OrmPhpVar>, varPrefix="") : String
    {
        return vars.length > 0
            ? " WHERE " + vars.map(function(v) return "`" + v.name + "` = ' . $this->quote($" + varPrefix + v.haxeName + ")").join(". ' AND ")
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