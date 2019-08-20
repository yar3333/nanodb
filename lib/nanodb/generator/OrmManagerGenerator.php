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
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param mixed $whereVars
	 * @param GeneratorPhpClass $model
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return void
	 */
	public function createGetByMethodMany ($vars, $modelClassName, $whereVars, $model, $positions) {
		if (($whereVars === null) || (count($whereVars) === 0)) {
			return;
		}
		$model->addMethod("getBy" . (implode("And", array_map(function ($v) {
			return GeneratorTools::fieldAsFunctionNamePart($v->haxeName);
		}, $whereVars))??'null'), array_merge($whereVars, [new GeneratorPhpVar("_order", "string", $this->getOrderDefVal($vars, $positions))]), GeneratorTools::toPhpType($modelClassName) . "[]", "return \$this->getMany('SELECT * FROM `' . \$this->table . '`" . $this->getWhereSql($whereVars) . " . (\$_order !== null ? ' ORDER BY ' . \$_order : ''));");
	}

	/**
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param mixed $whereVars
	 * @param GeneratorPhpClass $model
	 * 
	 * @return void
	 */
	public function createGetByMethodOne ($vars, $modelClassName, $whereVars, $model) {
		if (($whereVars === null) || (count($whereVars) === 0)) {
			return;
		}
		$model->addMethod("getBy" . (implode("And", array_map(function ($x) {
			return GeneratorTools::fieldAsFunctionNamePart($x->haxeName);
		}, $whereVars))??'null'), $whereVars, "?" . GeneratorTools::toPhpType($modelClassName), "return \$this->getOne('SELECT * FROM `' . \$this->table . '`" . $this->getWhereSql($whereVars) . ");");
	}

	/**
	 * @param Db $db
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param string $autogeneratedManagerClassName
	 * @param string $customOrmClassName
	 * @param string $customManagerClassName
	 * @param string $queryClassName
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getAutogenManager ($db, $table, $vars, $modelClassName, $autogeneratedManagerClassName, $customOrmClassName, $customManagerClassName, $queryClassName, $positions) {
		$_gthis = $this;
		$klass = new GeneratorPhpClass($autogeneratedManagerClassName, $queryClassName);
		$klass->addGlobalComment("// This file is autogenerated. Do not edit!");
		$dbPhpVar = new GeneratorPhpVar("db", GeneratorTools::toPhpType("nanodb.orm.Db"));
		$ormPhpVar = new GeneratorPhpVar("orm", GeneratorTools::toPhpType($customOrmClassName));
		$serializerPhpVar = new GeneratorPhpVar("serializer", GeneratorTools::toPhpType("nanodb.orm.ISerializer"));
		$klass->addVar($ormPhpVar, "protected");
		$klass->addMethod("__construct", [$dbPhpVar, $ormPhpVar, $serializerPhpVar], null, "parent::__construct(\$db, \$serializer);\n" . "\$this->orm = \$orm;");
		$getVars = array_filter($vars, function ($x) {
			return $x->isKey;
		});
		if (count($getVars) > 0) {
			$klass->addMethod("get", $getVars, "?" . GeneratorTools::toPhpType($modelClassName), "return \$this->getOne('SELECT * FROM `' . \$this->table . '`" . $this->getWhereSql($getVars) . ");");
		}
		$createVars = array_filter($vars, function ($x1) {
			return !$x1->isAutoInc;
		});
		$autoIncVars = array_filter($vars, function ($x2) {
			return $x2->isAutoInc;
		});
		$klass->addMethod("add", [new GeneratorPhpVar("obj", GeneratorTools::toPhpType($modelClassName))], "void", (implode("", array_map(function ($x3)  use (&$table, &$db, &$vars, &$_gthis) {
			$this1 = "if (\$this->" . $x3->haxeName . " == null)\n" . "{\n" . "\t\$obj->" . $x3->name . " = \$this->db->query('SELECT MAX(`" . $x3->name . "`) FROM `' . \$this->table . '`";
			$this2 = $_gthis->getForeignKeyVars($db, $table, $vars);
			return $this1 . ($_gthis->getWhereSql($this2, true)??'null') . ").getIntResult(0) + 1;\n" . "}\n\n";
		}, array_filter($createVars, function ($x4)  use (&$positions) {
			return $positions->is($x4->table, $x4->name);
		})))??'null') . "\$data = \$this->serializer->serializeObject(\$obj, [ " . (implode(", ", array_map(function ($x5) {
			return "'" . $x5->name . "'";
		}, $createVars))??'null') . " ]);\n" . "\$fields = [];\n" . "\$values = [];\n" . "foreach (\$data as \$k => \$v) { \$fields[] = \"`\$k`\"; \$values[] = \$this->db->quote(\$v); }\n" . "\$this->db->query('INSERT INTO `' . \$this->table . '`(' . implode(', ', \$fields) . ') VALUES (' . implode(', ', \$values) . ')');" . (((count($autoIncVars) > 0 ? "\n" . (implode("\n", array_map(function ($v) {
			return "\$obj->" . $v->haxeName . " = \$this->db->lastInsertId();";
		}, $autoIncVars))??'null') : ""))??'null'));
		if (current(array_filter($vars, function ($v1) {
			return $v1->isKey;
		})) && current(array_filter($vars, function ($v2) {
			return !$v2->isKey;
		}))) {
			$savedVars = array_filter($vars, function ($v3) {
				return !$v3->isKey;
			});
			$whereVars = array_filter($vars, function ($v4) {
				return $v4->isKey;
			});
			$klass->addMethod("save", [new GeneratorPhpVar("obj", GeneratorTools::toPhpType($modelClassName)), new GeneratorPhpVar("properties", "string[]", "null")], "void", "if (\$properties === null) \$properties = [ " . (implode(", ", array_map(function ($x6) {
				return "'" . $x6->name . "'";
			}, $savedVars))??'null') . " ];\n" . "\n" . "\$data = \$this->serializer->serializeObject(\$obj, \$properties);\n" . "\$sets = []; foreach (\$data as \$k => \$v) \$sets[] = \"`\$k` = \" . \$this->db->quote(\$v);\n" . "\n" . "\$keys = \$this->serializer->serializeObject(\$obj, [ " . (implode(", ", array_map(function ($x7) {
				return "'" . $x7->name . "'";
			}, $whereVars))??'null') . " ]);\n" . "\$wheres = []; foreach (\$keys as \$k => \$v) \$wheres[] = \"`\$k` = \" . \$this->db->quote(\$v);\n" . "\n" . "\$this->db->query('UPDATE `' . \$this->table . '` SET ' . implode(', ', \$sets) . ' WHERE ' . implode(' AND ', \$wheres) . ' LIMIT 1');");
		}
		$deleteVars = array_filter($vars, function ($x8) {
			return $x8->isKey;
		});
		if (count($deleteVars) === 0) {
			$deleteVars = $vars;
		}
		$klass->addMethod("deleteBy" . (implode("And", array_map(function ($x9) {
			return GeneratorTools::fieldAsFunctionNamePart($x9->haxeName);
		}, $deleteVars))??'null'), $deleteVars, "void", "\$this->db->query('DELETE FROM `' . \$this->table . '`" . $this->getWhereSql($deleteVars) . " . ' LIMIT 1');");
		$collection = $db->connection->getUniques($table);
		foreach ($collection as $key => $value) {
			unset($fields);
			$fields = $value;
			$vs = array_filter($vars, function ($x10)  use (&$fields) {
				return in_array($x10->name, $fields, false);
			});
			$_gthis->createGetByMethodOne($vars, $modelClassName, $vs, $klass);

		}

		$collection1 = $this->getForeignKeyVars($db, $table, $vars);
		foreach ($collection1 as $key1 => $value1) {
			$tmp = [$value1];
			$_gthis->createGetByMethodMany($vars, $modelClassName, $tmp, $klass, $positions);
		}

		return $klass;
	}

	/**
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param string $fullClassName
	 * @param string $baseClassName
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getCustomManager ($vars, $modelClassName, $fullClassName, $baseClassName = null) {
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
				return $x1->name;
			}, $positionVar))??'null') . "'";
		}
	}

	/**
	 * @param mixed $vars
	 * @param bool $prefixThisToVars
	 * 
	 * @return string
	 */
	public function getWhereSql ($vars, $prefixThisToVars = false) {
		if ($prefixThisToVars === null) {
			$prefixThisToVars = false;
		}
		if (count($vars) > 0) {
			return " WHERE " . (implode(". ' AND ", array_map(function ($v)  use (&$prefixThisToVars) {
				return "`" . $v->name . "` = ' . \$this->quote(\$" . ((($prefixThisToVars ? "this->" : ""))??'null') . $v->haxeName . ")";
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
		$autoGeneratedManager = $this->getAutogenManager($db, $table->tableName, $vars, $table->customModelClassName, $table->autogeneratedManagerClassName, $customOrmClassName, $table->customManagerClassName, $table->queryClassName, $positions);
		$destFileName = $outPath . (str_replace(".", "/", $table->autogeneratedManagerClassName)??'null') . ".php";
		GeneratorTools::mkdir(dirname($destFileName));
		file_put_contents($destFileName, $autoGeneratedManager->toString());
		if (!file_exists($outPath . "/" . (str_replace(".", "/", $table->customManagerClassName)??'null') . ".php")) {
			$customManager = $this->getCustomManager($vars, $table->customModelClassName, $table->customManagerClassName, $table->autogeneratedManagerClassName);
			$destFileName1 = $outPath . (str_replace(".", "/", $table->customManagerClassName)??'null') . ".php";
			GeneratorTools::mkdir(dirname($destFileName1));
			file_put_contents($destFileName1, $customManager->toString());
		}
		GeneratorLog::finishSuccess();
	}
}

