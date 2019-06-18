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
use \nanodb\generator\OrmPositions as GeneratorOrmPositions;
use \nanodb\generator\OrmTable as GeneratorOrmTable;

class OrmModelGenerator {
	/**
	 * @return void
	 */
	public function __construct () {
	}

	/**
	 * @param string $table
	 * @param mixed $vars
	 * @param string $modelClassName
	 * @param string $customOrmClassName
	 * @param string $customEntityClassName
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getAutogenModel ($table, $vars, $modelClassName, $customOrmClassName, $customEntityClassName) {
		$klass = new GeneratorPhpClass($modelClassName, $customEntityClassName);
		$klass->addGlobalComment("// This file is autogenerated. Do not edit!");
		foreach ($vars as $key => $value) {
			$klass->addVar($value);
		}
		return $klass;
	}

	/**
	 * @param string $customModelClassName
	 * @param string $autogeneratedModelClassName
	 * 
	 * @return GeneratorPhpClass
	 */
	public function getCustomModel ($customModelClassName, $autogeneratedModelClassName) {
		return new GeneratorPhpClass($customModelClassName, $autogeneratedModelClassName);
	}

	/**
	 * @param Db $db
	 * @param GeneratorOrmTable $table
	 * @param string $customOrmClassName
	 * @param string $outPath
	 * @param GeneratorOrmPositions $positions
	 * @param string $customEntityClassName
	 * 
	 * @return void
	 */
	public function make ($db, $table, $customOrmClassName, $outPath, $positions, $customEntityClassName) {
		GeneratorLog::start($table->tableName . " => " . $table->customModelClassName);
		$vars = GeneratorOrmTools::fields2vars($table->tableName, $db->connection->getFields($table->tableName), $positions);
		$autogeneratedModel = $this->getAutogenModel($table->tableName, $vars, $table->autogeneratedModelClassName, $customOrmClassName, $customEntityClassName);
		$destFileName = $outPath . (str_replace(".", "/", $table->autogeneratedModelClassName)??'null') . ".php";
		GeneratorTools::mkdir(dirname($destFileName));
		file_put_contents($destFileName, $autogeneratedModel->toString());
		if (!file_exists($outPath . "/" . (str_replace(".", "/", $table->customModelClassName)??'null') . ".php")) {
			$customModel = $this->getCustomModel($table->customModelClassName, $table->autogeneratedModelClassName);
			$destFileName1 = $outPath . (str_replace(".", "/", $table->customModelClassName)??'null') . ".php";
			GeneratorTools::mkdir(dirname($destFileName1));
			file_put_contents($destFileName1, $customModel->toString());
		}
		GeneratorLog::finishSuccess();
	}
}

