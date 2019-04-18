<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\generator\OrmManagerGenerator as GeneratorOrmManagerGenerator;
use \nanodb\generator\OrmQueryGenerator as GeneratorOrmQueryGenerator;
use \nanodb\generator\Tools as GeneratorTools;
use \nanodb\generator\Log as GeneratorLog;
use \nanodb\generator\PhpClass as GeneratorPhpClass;
use \nanodb\orm\Db;
use \nanodb\generator\OrmModelGenerator as GeneratorOrmModelGenerator;
use \nanodb\generator\PhpVar as GeneratorPhpVar;
use \nanodb\generator\OrmPositions as GeneratorOrmPositions;
use \nanodb\generator\OrmTable as GeneratorOrmTable;

class OrmGenerator {
	/**
	 * @var string
	 */
	public $outPath;

	/**
	 * @param string $outPath
	 * 
	 * @return void
	 */
	public function __construct ($outPath) {
		$this->outPath = ($outPath !== "" ? (rtrim(str_replace("\\", "/", $outPath), "\\/")??'null') . "/" : "");
	}

	/**
	 * @param Db $db
	 * @param string $autogenPackage
	 * @param string $customPackage
	 * @param mixed $ignoreTables
	 * @param mixed $noInstantiateManagers
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return void
	 */
	public function generate ($db, $autogenPackage, $customPackage, $ignoreTables, $noInstantiateManagers, $positions) {
		$_gthis = $this;
		$autogenOrmClassName = $autogenPackage . ".Orm";
		$customOrmClassName = $customPackage . ".Orm";
		$this1 = [];
		$tables = $this1;
		$collection = $db->connection->getTables();
		foreach ($collection as $key => $value) {
			if (!in_array($value, $ignoreTables, false)) {
				$table = new GeneratorOrmTable($value, $autogenPackage, $customPackage);
				(new GeneratorOrmModelGenerator())->make($db, $table, $customOrmClassName, $_gthis->outPath, $positions);
				(new GeneratorOrmManagerGenerator())->make($db, $table, $customOrmClassName, $_gthis->outPath, $positions);
				(new GeneratorOrmQueryGenerator())->make($db, $table, $_gthis->outPath, $positions);
				array_push($tables, $table);
			}
		}

		GeneratorLog::start("MANAGERS => " . $customOrmClassName);
		$this->makeAutogenOrm($tables, $autogenOrmClassName, $customOrmClassName, $noInstantiateManagers);
		$this->makeCustomOrm($customOrmClassName, $autogenOrmClassName);
		GeneratorLog::finishSuccess();
	}

	/**
	 * @param mixed $tables
	 * @param string $fullClassName
	 * @param mixed $noInstantiateManagers
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getAutogenOrm ($tables, $fullClassName, $noInstantiateManagers) {
		$clas = new GeneratorPhpClass($fullClassName);
		foreach ($tables as $key => $value) {
			$value1 = $value->varName;
			$clas->addVar(new GeneratorPhpVar($value1, GeneratorTools::toPhpType($value->customManagerClassName)));
		}
		$clas->addMethod("__construct", [new GeneratorPhpVar("db", GeneratorTools::toPhpType("nanodb.orm.Db"))], null, implode("\n", array_map(function ($t) {
			return "\$this->" . $t->varName . " = new " . (GeneratorTools::toPhpType($t->customManagerClassName)??'null') . "(\$db, \$this);";
		}, array_filter($tables, function ($t1)  use (&$noInstantiateManagers) {
			return !in_array($t1->tableName, $noInstantiateManagers, false);
		}))));
		return $clas;
	}

	/**
	 * @param string $fullClassName
	 * @param string $autogenOrmClassName
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getCustomOrm ($fullClassName, $autogenOrmClassName) {
		return new GeneratorPhpClass($fullClassName, $autogenOrmClassName);
	}

	/**
	 * @param mixed $tables
	 * @param string $autogenOrmClassName
	 * @param string $customOrmClassName
	 * @param mixed $noInstantiateManagers
	 * 
	 * @return void
	 */
	public function makeAutogenOrm ($tables, $autogenOrmClassName, $customOrmClassName, $noInstantiateManagers) {
		$autogenOrm = $this->getAutogenOrm($tables, $autogenOrmClassName, $noInstantiateManagers);
		$destFileName = $this->outPath . (str_replace(".", "/", $autogenOrmClassName)??'null') . ".php";
		GeneratorTools::mkdir(dirname($destFileName));
		file_put_contents($destFileName, "<?php\n// This file is autogenerated. Do not edit!\n\n" . ($autogenOrm->toString()??'null'));
	}

	/**
	 * @param string $customOrmClassName
	 * @param string $autogenOrmClassName
	 * 
	 * @return void
	 */
	public function makeCustomOrm ($customOrmClassName, $autogenOrmClassName) {
		if (!file_exists($this->outPath . "/" . (str_replace(".", "/", $customOrmClassName)??'null') . ".php")) {
			$customOrm = $this->getCustomOrm($customOrmClassName, $autogenOrmClassName);
			$destFileName = $this->outPath . (str_replace(".", "/", $customOrmClassName)??'null') . ".php";
			GeneratorTools::mkdir(dirname($destFileName));
			file_put_contents($destFileName, "<?php\n\n" . ($customOrm->toString()??'null'));
		}
	}
}

