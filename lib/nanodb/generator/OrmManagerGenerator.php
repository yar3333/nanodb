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
		}, $whereVars))??'null'), array_merge($whereVars, [new GeneratorPhpVar("_order", "string", $this->getOrderDefVal($vars, $positions))]), GeneratorTools::toPhpType($modelClassName) . "[]", "return \$this->getBySqlMany('SELECT * FROM `" . $table . "`" . $this->getWhereSql($whereVars) . " . (\$_order != null ? ' ORDER BY ' . \$_order : ''));");
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
		}, $whereVars))??'null'), $whereVars, "?" . GeneratorTools::toPhpType($modelClassName), "return \$this->getBySqlOne('SELECT * FROM `" . $table . "`" . $this->getWhereSql($whereVars) . ");");
	}

	/**
	 * @param Db $db
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param string $autogenManagerClassName
	 * @param string $customOrmClassName
	 * @param string $queryClassName
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getAutogenManager ($db, $table, $vars, $modelClassName, $autogenManagerClassName, $customOrmClassName, $queryClassName, $positions) {
		$_gthis = $this;
		$model = new GeneratorPhpClass($autogenManagerClassName);
		$dbPhpVar = new GeneratorPhpVar("db", GeneratorTools::toPhpType("nanodb.orm.Db"));
		$ormPhpVar = new GeneratorPhpVar("orm", GeneratorTools::toPhpType($customOrmClassName));
		$model->addVar($dbPhpVar, "protected");
		$model->addVar($ormPhpVar, "protected");
		$this1 = [];
		$model->addMethod("query", $this1, GeneratorTools::toPhpType($queryClassName), "return new " . GeneratorTools::toPhpType($queryClassName) . "(\$this->db, \$this);");
		$model->addMethod("__construct", [$dbPhpVar, $ormPhpVar], null, "\$this->db = \$db;\n\$this->orm = \$orm;");
		$tmp = GeneratorTools::toPhpType($modelClassName);
		$tmp1 = "\$_obj = new " . GeneratorTools::toPhpType($modelClassName) . "(\$this->db, \$this->orm);\n" . (implode("\n", array_map(function ($x) {
			return "\$_obj->" . $x->haxeName . " = \$" . $x->haxeName . ";";
		}, $vars))??'null') . "\n" . "return \$_obj;";
		$model->addMethod("newModelFromParams", $vars, $tmp, $tmp1);
		$model->addMethod("newModelFromAssoc", [new GeneratorPhpVar("row", "array")], GeneratorTools::toPhpType($modelClassName), "\$_obj = new " . GeneratorTools::toPhpType($modelClassName) . "(\$this->db, \$this->orm);\n" . (implode("\n", array_map(function ($x1) {
			return "\$_obj->" . $x1->haxeName . " = \$row['" . $x1->haxeName . "'];";
		}, $vars))??'null') . "\n" . "return \$_obj;");
		$model->addMethod("whereField", [new GeneratorPhpVar("field", "string"), new GeneratorPhpVar("op", "string"), new GeneratorPhpVar("value", null)], GeneratorTools::toPhpType($queryClassName), "return \$this->query()->whereField(\$field, \$op, \$value);");
		$model->addMethod("where", [new GeneratorPhpVar("rawSqlText", "string")], GeneratorTools::toPhpType($queryClassName), "return \$this->query()->where(\$rawSqlText);");
		$getVars = array_filter($vars, function ($x2) {
			return $x2->isKey;
		});
		if (count($getVars) > 0) {
			$model->addMethod("get", $getVars, "?" . GeneratorTools::toPhpType($modelClassName), "return \$this->getBySqlOne('SELECT * FROM `" . $table . "`" . $this->getWhereSql($getVars) . ");");
		}
		$createVars = array_filter($vars, function ($x3) {
			return !$x3->isAutoInc;
		});
		$model->addMethod("create", $createVars, GeneratorTools::toPhpType($modelClassName), (implode("", array_map(function ($x4)  use (&$table, &$db, &$vars, &$_gthis) {
			$this2 = "if (\$" . $x4->haxeName . " == null)\n" . "{\n" . "\tposition = \$this->db->query('SELECT MAX(`" . $x4->name . "`) FROM `" . $table . "`";
			$this3 = $_gthis->getForeignKeyVars($db, $table, $vars);
			return $this2 . $_gthis->getWhereSql($this3) . ").getIntResult(0) + 1;\n" . "}\n\n";
		}, array_filter($createVars, function ($x5)  use (&$positions) {
			return $positions->is($x5->table, $x5->name);
		})))??'null') . "\$this->db->query('INSERT INTO `" . $table . "`(" . (implode(", ", array_map(function ($x6) {
			return "`" . $x6->name . "`";
		}, $createVars))??'null') . ") VALUES (' . " . (implode(" . ', ' . ", array_map(function ($x7) {
			return "\$this->db->quote(\$" . $x7->haxeName . ")";
		}, $createVars))??'null') . " . ')');\n" . "return \$this->newModelFromParams(" . (implode(", ", array_map(function ($x8) {
			if ($x8->isAutoInc) {
				return "\$this->db->lastInsertId()";
			} else {
				return "\$" . $x8->haxeName;
			}
		}, $vars))??'null') . ");");
		$deleteVars = array_filter($vars, function ($x9) {
			return $x9->isKey;
		});
		if (count($deleteVars) === 0) {
			$deleteVars = $vars;
		}
		$model->addMethod("delete", $deleteVars, "void", "\$this->db->query('DELETE FROM `" . $table . "`" . $this->getWhereSql($deleteVars) . " . ' LIMIT 1');");
		$model->addMethod("getAll", [new GeneratorPhpVar("_order", "string", $this->getOrderDefVal($vars, $positions))], GeneratorTools::toPhpType($modelClassName) . "[]", "return \$this->getBySqlMany('SELECT * FROM `" . $table . "`' . (\$_order != null ? ' ORDER BY ' . \$_order : ''));");
		$model->addMethod("getBySqlOne", [new GeneratorPhpVar("sql", "string")], "?" . GeneratorTools::toPhpType($modelClassName), "\$rows = \$this->db->query(\$sql . ' LIMIT 1');\n" . "if (\$rows->length == 0) return null;\n" . "return \$this->newModelFromAssoc(\$rows->next());");
		$model->addMethod("getBySqlMany", [new GeneratorPhpVar("sql", "string")], GeneratorTools::toPhpType($modelClassName) . "[]", "\$resutSet = \$this->db->query(\$sql);\n" . "\$r = [];\n" . "while (\$row = \$resutSet->next())\n" . "{\n" . "\tarray_push(\$r, \$this->newModelFromAssoc(\$row));\n" . "}\n" . "return \$r;");
		$collection = $db->connection->getUniques($table);
		foreach ($collection as $key => $value) {
			unset($fields);
			$fields = $value;
			$vs = array_filter($vars, function ($x10)  use (&$fields) {
				return in_array($x10->name, $fields, false);
			});
			$_gthis->createGetByMethodOne($table, $vars, $modelClassName, $vs, $model);

		}

		$collection1 = $this->getForeignKeyVars($db, $table, $vars);
		foreach ($collection1 as $key1 => $value1) {
			$tmp2 = [$value1];
			$_gthis->createGetByMethodMany($table, $vars, $modelClassName, $tmp2, $model, $positions);
		}

		return $model;
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
		$model->addImport($modelClassName);
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
		$autoGeneratedManager = $this->getAutogenManager($db, $table->tableName, $vars, $table->customModelClassName, $table->autogenManagerClassName, $customOrmClassName, $table->queryClassName, $positions);
		$destFileName = $outPath . (str_replace(".", "/", $table->autogenManagerClassName)??'null') . ".php";
		GeneratorTools::mkdir(dirname($destFileName));
		file_put_contents($destFileName, "<?php\n// This file is autogenerated. Do not edit!\n\n" . $autoGeneratedManager->toString());
		if (!file_exists($outPath . "/" . (str_replace(".", "/", $table->customManagerClassName)??'null') . ".php")) {
			$customManager = $this->getCustomManager($table->tableName, $vars, $table->customModelClassName, $table->customManagerClassName, $table->autogenManagerClassName);
			$destFileName1 = $outPath . (str_replace(".", "/", $table->customManagerClassName)??'null') . ".php";
			GeneratorTools::mkdir(dirname($destFileName1));
			file_put_contents($destFileName1, "<?php\n\n" . $customManager->toString());
		}
		GeneratorLog::finishSuccess();
	}
}

