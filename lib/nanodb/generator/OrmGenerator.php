<?php

namespace nanodb\generator;

use \nanodb\orm\Db;

class OrmGenerator
{
	/**
	 * @var string
	 */
	public $outPath;

	/**
	 * @param string $outPath
	 * @return void
	 */
	public function __construct($outPath)
    {
		$this->outPath = $outPath !== "" ? rtrim(str_replace("\\", "/", $outPath), "\\/") . "/" : "";
	}

	/**
	 * @param Db $db
	 * @param string $autogeneratedNamespace
	 * @param string $customNamespace
	 * @param mixed $ignoreTables
	 * @param mixed $noInstantiateManagers
	 * @param OrmPositions $positions
	 * @return void
	 */
	public function generate ($db, $autogeneratedNamespace, $customNamespace, $ignoreTables, $noInstantiateManagers, $positions)
    {
		$_gthis = $this;
		$autogenOrmClassName = $autogeneratedNamespace . ".Orm";
		$customOrmClassName = $customNamespace . ".Orm";
		$this1 = [];
		$tables = $this1;
		$collection = $db->connection->getTables();
		foreach ($collection as $key => $value) {
			if (!in_array($value, $ignoreTables, false)) {
				$table = new OrmTable($value, $autogeneratedNamespace, $customNamespace);
				(new OrmModelGenerator())->make($db, $table, $customOrmClassName, $_gthis->outPath, $positions);
				(new OrmQueryGenerator())->make($db, $table, $customOrmClassName, $_gthis->outPath, $positions);
				(new OrmManagerGenerator())->make($db, $table, $customOrmClassName, $_gthis->outPath, $positions);
				$tables[] = $table;
			}
		}

		Log::start("ORM => " . $customOrmClassName);
		$this->makeAutogenOrm($tables, $autogenOrmClassName, $customOrmClassName, $noInstantiateManagers);
		$this->makeCustomOrm($customOrmClassName, $autogenOrmClassName);
		Log::finishSuccess();
	}

	/**
	 * @param mixed $tables
	 * @param string $fullClassName
	 * @param mixed $noInstantiateManagers
	 * @param string $customOrmClassName
	 * @return PhpClass
	 */
	public function getAutogenOrm ($tables, $fullClassName, $noInstantiateManagers, $customOrmClassName)
    {
		$klass = new PhpClass($fullClassName);
		$klass->addGlobalComment("// This file is autogenerated. Do not edit!");
		foreach ($tables as $key => $value) {
			$value1 = $value->varName;
			$klass->addVar(new PhpVar($value1, Tools::toPhpType($value->customManagerClassName)));
		}
		$klass->addMethod("__construct", [new PhpVar("db", Tools::toPhpType("nanodb.orm.Db")), new PhpVar("serializer", Tools::toPhpType("nanodb.orm.ISerializer"), "null")], null, "if (!\$serializer) \$serializer = new \\nanodb\\orm\\Serializer();\n\n" . implode("\n", array_map(function ($t)  use (&$customOrmClassName) {
			return "/** @var " . Tools::toPhpType($customOrmClassName) . " \$this */\n" . "\$this->" . $t->varName . " = new " . Tools::toPhpType($t->customManagerClassName) . "(\$db, \$this, \$serializer);";
		}, array_filter($tables, function ($t1)  use (&$noInstantiateManagers) {
			return !in_array($t1->tableName, $noInstantiateManagers, false);
		}))));
		return $klass;
	}

	/**
	 * @param string $fullClassName
	 * @param string $autogenOrmClassName
	 * @return PhpClass
	 */
	public function getCustomOrm ($fullClassName, $autogenOrmClassName)
    {
		return new PhpClass($fullClassName, $autogenOrmClassName);
	}

	/**
	 * @param mixed $tables
	 * @param string $autogenOrmClassName
	 * @param string $customOrmClassName
	 * @param mixed $noInstantiateManagers
	 * @return void
	 */
	public function makeAutogenOrm ($tables, $autogenOrmClassName, $customOrmClassName, $noInstantiateManagers)
    {
		$autogenOrm = $this->getAutogenOrm($tables, $autogenOrmClassName, $noInstantiateManagers, $customOrmClassName);
		$destFileName = $this->outPath . str_replace(".", "/", $autogenOrmClassName) . ".php";
		Tools::mkdir(dirname($destFileName));
		file_put_contents($destFileName, $autogenOrm->toString());
	}

	/**
	 * @param string $customOrmClassName
	 * @param string $autogenOrmClassName
	 * @return void
	 */
	public function makeCustomOrm ($customOrmClassName, $autogenOrmClassName)
    {
		if (!file_exists($this->outPath . "/" . str_replace(".", "/", $customOrmClassName) . ".php")) {
			$customOrm = $this->getCustomOrm($customOrmClassName, $autogenOrmClassName);
			$destFileName = $this->outPath . str_replace(".", "/", $customOrmClassName) . ".php";
			Tools::mkdir(dirname($destFileName));
			file_put_contents($destFileName, $customOrm->toString());
		}
	}
}

