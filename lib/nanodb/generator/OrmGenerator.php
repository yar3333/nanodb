<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\php\_Boot\HxAnon;
use \nanodb\php\Boot;
use \nanodb\generator\OrmManagerGenerator as GeneratorOrmManagerGenerator;
use \nanodb\generator\Log as GeneratorLog;
use \nanodb\generator\PhpClass as GeneratorPhpClass;
use \nanodb\orm\Db;
use \nanodb\generator\OrmModelGenerator as GeneratorOrmModelGenerator;
use \nanodb\generator\OrmPositions as GeneratorOrmPositions;
use \nanodb\generator\OrmTable as GeneratorOrmTable;

class OrmGenerator {
	/**
	 * @var string
	 */
	public $srcPath;

	/**
	 * @param string $srcPath
	 * 
	 * @return void
	 */
	public function __construct ($srcPath) {
		$this->srcPath = (rtrim(str_replace("\\", "/", $srcPath), "\\/")??'null') . "/";
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
		$autogenOrmClassName = ($autogenPackage??'null') . ".Orm";
		$customOrmClassName = ($customPackage??'null') . ".Orm";
		$this1 = [];
		$tables = $this1;
		$collection = $db->connection->getTables();
		foreach ($collection as $key => $value) {
			if (!in_array($value, $ignoreTables, false)) {
				$table = new GeneratorOrmTable($value, $autogenPackage, $customPackage);
				(new GeneratorOrmModelGenerator())->make($db, $table, $customOrmClassName, $_gthis->srcPath, $positions);
				(new GeneratorOrmManagerGenerator())->make($db, $table, $customOrmClassName, $_gthis->srcPath, $positions);
				array_push($tables, $table);
			}
		}

		GeneratorLog::start("MANAGERS => " . ($customOrmClassName??'null'));
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
			$clas->addVar(new HxAnon([
				"haxeName" => $value->varName,
				"haxeType" => $value->customManagerClassName,
				"haxeDefVal" => null,
			]), false, false, true);
		}
		$clas->addMethod("new", [new HxAnon([
			"haxeName" => "db",
			"haxeType" => "orm.Db",
			"haxeDefVal" => null,
		])], "Void", implode("\x0A", array_map(function ($t) {
			return "this." . ($t->varName??'null') . " = new " . ($t->customManagerClassName??'null') . "(db, cast this);";
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
		$destFileName = ($this->srcPath??'null') . (str_replace(".", "/", $autogenOrmClassName)??'null') . ".hx";
		mkdir(dirname($destFileName));
		file_put_contents($destFileName, "// This is autogenerated file. Do not edit!\x0A\x0A" . ($autogenOrm->toString()??'null'));
	}

	/**
	 * @param string $customOrmClassName
	 * @param string $autogenOrmClassName
	 * 
	 * @return void
	 */
	public function makeCustomOrm ($customOrmClassName, $autogenOrmClassName) {
		if (!file_exists(($this->srcPath??'null') . "/" . (str_replace(".", "/", $customOrmClassName)??'null') . ".hx")) {
			$customOrm = $this->getCustomOrm($customOrmClassName, $autogenOrmClassName);
			$destFileName = ($this->srcPath??'null') . (str_replace(".", "/", $customOrmClassName)??'null') . ".hx";
			mkdir(dirname($destFileName));
			file_put_contents($destFileName, $customOrm->toString());
		}
	}
}

Boot::registerClass(OrmGenerator::class, 'generator.OrmGenerator');
