<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\generator\OrmTools as GeneratorOrmTools;
use \nanodb\generator\Tools as GeneratorTools;
use \nanodb\generator\Log as GeneratorLog;
use \nanodb\generator\PhpClass as GeneratorPhpClass;
use \nanodb\orm\Db;
use \nanodb\generator\PhpVar as GeneratorPhpVar;
use \nanodb\generator\OrmPositions as GeneratorOrmPositions;
use \nanodb\generator\OrmTable as GeneratorOrmTable;

class OrmManagerGenerator {
	/**
	 * @return void
	 */
	public function __construct () {
	}

	/**
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param mixed $whereVars
	 * @param GeneratorPhpClass $model
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return void
	 */
	public function createGetByMethodMany ($table, $vars, $modelClassName, $whereVars, $model, $positions) {
		if (($whereVars === null) || (count($whereVars) === 0)) {
			return;
		}
		$model->addMethod("getBy" . (implode("And", array_map(function ($v) {
			return GeneratorTools::fieldAsFunctionNamePart($v->haxeName);
		}, $whereVars))??'null'), array_merge($whereVars, [new GeneratorPhpVar("_order", "string", $this->getOrderDefVal($vars, $positions))]), GeneratorTools::toPhpType($modelClassName) . "[]", "return \$this->getMany('SELECT * FROM `" . $table . "`" . $this->getWhereSql($whereVars) . " . (\$_order != null ? ' ORDER BY ' . \$_order : ''));");
	}

	/**
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param mixed $whereVars
	 * @param GeneratorPhpClass $model
	 * 
	 * @return void
	 */
	public function createGetByMethodOne ($table, $vars, $modelClassName, $whereVars, $model) {
		if (($whereVars === null) || (count($whereVars) === 0)) {
			return;
		}
		$model->addMethod("getBy" . (implode("And", array_map(function ($x) {
			return GeneratorTools::fieldAsFunctionNamePart($x->haxeName);
		}, $whereVars))??'null'), $whereVars, "?" . GeneratorTools::toPhpType($modelClassName), "return \$this->getOne('SELECT * FROM `" . $table . "`" . $this->getWhereSql($whereVars) . ");");
	}

	/**
	 * @param Db $db
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param string $autogeneratedManagerClassName
	 * @param string $customOrmClassName
	 * @param string $queryClassName
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getAutogenManager ($db, $table, $vars, $modelClassName, $autogeneratedManagerClassName, $customOrmClassName, $queryClassName, $positions) {
		$_gthis = $this;
		$klass = new GeneratorPhpClass($autogeneratedManagerClassName);
		$klass->addComment("// This file is autogenerated. Do not edit!");
		$klass->addComment("");
		$klass->addComment("/** @noinspection PhpParamsInspection */");
		$dbPhpVar = new GeneratorPhpVar("db", GeneratorTools::toPhpType("nanodb.orm.Db"));
		$ormPhpVar = new GeneratorPhpVar("orm", GeneratorTools::toPhpType($customOrmClassName));
		$serializerPhpVar = new GeneratorPhpVar("serializer", GeneratorTools::toPhpType("nanodb.orm.ISerializer"));
		$klass->addVar($dbPhpVar, "protected");
		$klass->addVar($ormPhpVar, "protected");
		$klass->addVar($serializerPhpVar, "protected");
		$klass->addMethod("query", [], GeneratorTools::toPhpType($queryClassName), "return new " . GeneratorTools::toPhpType($queryClassName) . "(\$this->db, \$this);");
		$klass->addMethod("__construct", [$dbPhpVar, $ormPhpVar, $serializerPhpVar], null, "\$this->db = \$db;\n\$this->orm = \$orm;\n\$this->serializer = \$serializer;");
		$klass->addMethod("newEmptyModel", [], GeneratorTools::toPhpType($modelClassName), "return new " . GeneratorTools::toPhpType($modelClassName) . "(\$this->db, \$this->orm, \$this->serializer);");
		$tmp = GeneratorTools::toPhpType($modelClassName);
		$tmp1 = "\$_obj = new " . GeneratorTools::toPhpType($modelClassName) . "(\$this->db, \$this->orm, \$this->serializer);\n" . (implode("\n", array_map(function ($x) {
			return "\$_obj->" . $x->haxeName . " = \$" . $x->haxeName . ";";
		}, $vars))??'null') . "\n" . "return \$_obj;";
		$klass->addMethod("newModelFromParams", $vars, $tmp, $tmp1);
		$klass->addMethod("newModelFromDbRow", [new GeneratorPhpVar("row", "array")], GeneratorTools::toPhpType($modelClassName), "\$_obj = new " . GeneratorTools::toPhpType($modelClassName) . "(\$this->db, \$this->orm, \$this->serializer);\n" . "\$this->serializer->deserializeObject(\$row, \$_obj, [ " . (implode(", ", array_map(function ($x1) {
			return "'" . $x1->haxeName . "'";
		}, $vars))??'null') . " ]);\n" . "return \$_obj;");
		$klass->addMethod("whereField", [new GeneratorPhpVar("field", "string"), new GeneratorPhpVar("op", "string"), new GeneratorPhpVar("value", null)], GeneratorTools::toPhpType($queryClassName), "return \$this->query()->whereField(\$field, \$op, \$value);");
		$klass->addMethod("where", [new GeneratorPhpVar("rawSqlText", "string")], GeneratorTools::toPhpType($queryClassName), "return \$this->query()->where(\$rawSqlText);");
		$getVars = array_filter($vars, function ($x2) {
			return $x2->isKey;
		});
		if (count($getVars) > 0) {
			$klass->addMethod("get", $getVars, "?" . GeneratorTools::toPhpType($modelClassName), "return \$this->getOne('SELECT * FROM `" . $table . "`" . $this->getWhereSql($getVars) . ");");
		}
		$createVars = array_filter($vars, function ($x3) {
			return !$x3->isAutoInc;
		});
		$autoIncVars = array_filter($vars, function ($x4) {
			return $x4->isAutoInc;
		});
		$klass->addMethod("create", $createVars, GeneratorTools::toPhpType($modelClassName), (implode("", array_map(function ($x5)  use (&$table, &$db, &$vars, &$_gthis) {
			$this1 = "if (\$" . $x5->haxeName . " == null)\n" . "{\n" . "\tposition = \$this->db->query('SELECT MAX(`" . $x5->name . "`) FROM `" . $table . "`";
			$this2 = $_gthis->getForeignKeyVars($db, $table, $vars);
			return $this1 . $_gthis->getWhereSql($this2) . ").getIntResult(0) + 1;\n" . "}\n\n";
		}, array_filter($createVars, function ($x6)  use (&$positions) {
			return $positions->is($x6->table, $x6->name);
		})))??'null') . "\$obj = \$this->newModelFromParams(" . (implode(", ", array_map(function ($x7) {
			if ($x7->isAutoInc) {
				return "0";
			} else {
				return "\$" . $x7->haxeName;
			}
		}, $vars))??'null') . ");\n" . "\$data = \$this->serializer->serializeObject(\$obj, [ " . (implode(", ", array_map(function ($x8) {
			return "'" . $x8->name . "'";
		}, $createVars))??'null') . " ]);\n" . "\$fields = [];\n" . "\$values = [];\n" . "foreach (\$data as \$k => \$v) { \$fields[] = \"`\$k`\"; \$values[] = \$this->db->quote(\$v); }\n" . "\$this->db->query('INSERT INTO `" . $table . "`(' . implode(', ', \$fields) . ') VALUES (' . implode(', ', \$values) . ')');\n" . (implode("", array_map(function ($v) {
			return "\$obj->" . $v->haxeName . " = \$this->db->lastInsertId();\n";
		}, $autoIncVars))??'null') . "return \$obj;");
		$klass->addMethod("add", [new GeneratorPhpVar("obj", GeneratorTools::toPhpType($modelClassName))], "void", (implode("", array_map(function ($x9)  use (&$table, &$db, &$vars, &$_gthis) {
			$this3 = "if (\$" . $x9->haxeName . " == null)\n" . "{\n" . "\t\$obj->" . $x9->name . " = \$this->db->query('SELECT MAX(`" . $x9->name . "`) FROM `" . $table . "`";
			$this4 = $_gthis->getForeignKeyVars($db, $table, $vars);
			return $this3 . $_gthis->getWhereSql($this4) . ").getIntResult(0) + 1;\n" . "}\n\n";
		}, array_filter($createVars, function ($x10)  use (&$positions) {
			return $positions->is($x10->table, $x10->name);
		})))??'null') . "\$data = \$this->serializer->serializeObject(\$obj, [ " . (implode(", ", array_map(function ($x11) {
			return "'" . $x11->name . "'";
		}, $createVars))??'null') . " ]);\n" . "\$fields = [];\n" . "\$values = [];\n" . "foreach (\$data as \$k => \$v) { \$fields[] = \"`\$k`\"; \$values[] = \$this->db->quote(\$v); }\n" . "\$this->db->query('INSERT INTO `" . $table . "`(' . implode(', ', \$fields) . ') VALUES (' . implode(', ', \$values) . ')');\n" . (implode("\n", array_map(function ($v1) {
			return "\$obj->" . $v1->haxeName . " = \$this->db->lastInsertId();";
		}, $autoIncVars))??'null'));
		$deleteVars = array_filter($vars, function ($x12) {
			return $x12->isKey;
		});
		if (count($deleteVars) === 0) {
			$deleteVars = $vars;
		}
		$klass->addMethod("delete", $deleteVars, "void", "\$this->db->query('DELETE FROM `" . $table . "`" . $this->getWhereSql($deleteVars) . " . ' LIMIT 1');");
		$klass->addMethod("getAll", [new GeneratorPhpVar("_order", "string", $this->getOrderDefVal($vars, $positions))], GeneratorTools::toPhpType($modelClassName) . "[]", "return \$this->getMany('SELECT * FROM `" . $table . "`' . (\$_order != null ? ' ORDER BY ' . \$_order : ''));");
		$klass->addMethod("getOne", [new GeneratorPhpVar("sql", "string")], "?" . GeneratorTools::toPhpType($modelClassName), "\$rows = \$this->db->query(\$sql . ' LIMIT 1');\n" . "if (!\$rows->hasNext()) return null;\n" . "return \$this->newModelFromDbRow(\$rows->next());");
		$klass->addMethod("getMany", [new GeneratorPhpVar("sql", "string")], GeneratorTools::toPhpType($modelClassName) . "[]", "\$resultSet = \$this->db->query(\$sql);\n" . "\$r = [];\n" . "/** @noinspection PhpAssignmentInConditionInspection */" . "while (\$row = \$resultSet->next())\n" . "{\n" . "\tarray_push(\$r, \$this->newModelFromDbRow(\$row));\n" . "}\n" . "return \$r;");
		$collection = $db->connection->getUniques($table);
		foreach ($collection as $key => $value) {
			unset($fields);
			$fields = $value;
			$vs = array_filter($vars, function ($x13)  use (&$fields) {
				return in_array($x13->name, $fields, false);
			});
			$_gthis->createGetByMethodOne($table, $vars, $modelClassName, $vs, $klass);

		}

		$collection1 = $this->getForeignKeyVars($db, $table, $vars);
		foreach ($collection1 as $key1 => $value1) {
			$tmp2 = [$value1];
			$_gthis->createGetByMethodMany($table, $vars, $modelClassName, $tmp2, $klass, $positions);
		}

		return $klass;
	}

	/**
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param string $fullClassName
	 * @param string $baseClassName
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getCustomManager ($table, $vars, $modelClassName, $fullClassName, $baseClassName = null) {
		$model = new GeneratorPhpClass($fullClassName, $baseClassName);
		if (GeneratorTools::getNamespace($modelClassName) !== GeneratorTools::getNamespace($fullClassName)) {
			$model->addImport($modelClassName);
		}
		return $model;
	}

	/**
	 * @param Db $db
	 * @param string $table
	 * @param mixed $vars
	 * 
	 * @return mixed
	 */
	public function getForeignKeyVars ($db, $table, $vars) {
		$foreignKeys = $db->connection->getForeignKeys($table);
		$foreignKeyVars = array_filter($vars, function ($v)  use (&$foreignKeys) {
			return current(array_filter($foreignKeys, function ($fk)  use (&$v) {
				return $fk->key === $v->name;
			}));
		});
		return $foreignKeyVars;
	}

	/**
	 * @param mixed $vars
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return string
	 */
	public function getOrderDefVal ($vars, $positions) {
		$positionVar = array_filter($vars, function ($x)  use (&$positions) {
			return $positions->is($x->table, $x->name);
		});
		if (count($positionVar) === 0) {
			return "null";
		} else {
			return "'" . (implode(", ", array_map(function ($x1) {
				return "\$" . $x1->name;
			}, $positionVar))??'null') . "'";
		}
	}

	/**
	 * @param mixed $vars
	 * 
	 * @return string
	 */
	public function getWhereSql ($vars) {
		if (count($vars) > 0) {
			return " WHERE " . (implode(". ' AND ", array_map(function ($v) {
				return "`" . $v->name . "` = ' . \$this->db->quote(\$" . $v->haxeName . ")";
			}, $vars))??'null');
		} else {
			return "'";
		}
	}

	/**
	 * @param Db $db
	 * @param GeneratorOrmTable $table
	 * @param string $customOrmClassName
	 * @param string $outPath
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return void
	 */
	public function make ($db, $table, $customOrmClassName, $outPath, $positions) {
		GeneratorLog::start($table->tableName . " => " . $table->customManagerClassName);
		$vars = GeneratorOrmTools::fields2vars($table->tableName, $db->connection->getFields($table->tableName), $positions);
		$autoGeneratedManager = $this->getAutogenManager($db, $table->tableName, $vars, $table->customModelClassName, $table->autogeneratedManagerClassName, $customOrmClassName, $table->queryClassName, $positions);
		$destFileName = $outPath . (str_replace(".", "/", $table->autogeneratedManagerClassName)??'null') . ".php";
		GeneratorTools::mkdir(dirname($destFileName));
		file_put_contents($destFileName, $autoGeneratedManager->toString());
		if (!file_exists($outPath . "/" . (str_replace(".", "/", $table->customManagerClassName)??'null') . ".php")) {
			$customManager = $this->getCustomManager($table->tableName, $vars, $table->customModelClassName, $table->customManagerClassName, $table->autogeneratedManagerClassName);
			$destFileName1 = $outPath . (str_replace(".", "/", $table->customManagerClassName)??'null') . ".php";
			GeneratorTools::mkdir(dirname($destFileName1));
			file_put_contents($destFileName1, $customManager->toString());
		}
		GeneratorLog::finishSuccess();
	}
}

