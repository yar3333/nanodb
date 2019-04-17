<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\php\Boot;
use \nanodb\generator\Tools as GeneratorTools;

class OrmTable {
	/**
	 * @var string
	 */
	public $autogenManagerClassName;
	/**
	 * @var string
	 */
	public $autogenModelClassName;
	/**
	 * @var string
	 */
	public $customManagerClassName;
	/**
	 * @var string
	 */
	public $customModelClassName;
	/**
	 * @var string
	 */
	public $tableName;
	/**
	 * @var string
	 */
	public $varName;

	/**
	 * @param string $tableName
	 * @param string $autogenPackage
	 * @param string $customPackage
	 * 
	 * @return void
	 */
	public function __construct ($tableName, $autogenPackage, $customPackage) {
		$this->tableName = $tableName;
		$this->varName = $this->getVarName();
		$className = $this->getClassName();
		$this->autogenManagerClassName = $autogenPackage . "." . $className . "Manager";
		$this->customManagerClassName = $customPackage . "." . $className . "Manager";
		$this->autogenModelClassName = $autogenPackage . "." . $className;
		$this->customModelClassName = $customPackage . "." . $className;
	}

	/**
	 * @return string
	 */
	public function getClassName () {
		$s = "";
		$packs = explode("__", mb_strtolower($this->tableName));
		while (count($packs) > 1) {
			$pack = array_shift($packs);
			$words = explode("_", $pack);
			$s = $s . (array_shift($words)??'null');
			$s = $s . (implode("", array_map(function ($x) {
				return GeneratorTools::capitalize($x);
			}, $words))??'null');
			$s = $s . ".";
		}
		$s = $s . (implode("", array_map(function ($x1) {
			return GeneratorTools::capitalize($x1);
		}, explode("_", $packs[0])))??'null');
		return $s;
	}

	/**
	 * @return string
	 */
	public function getVarName () {
		$s = "";
		$packs = explode("__", mb_strtolower($this->tableName));
		while (count($packs) > 1) {
			$pack = array_shift($packs);
			$words = explode("_", $pack);
			$s = $s . (array_shift($words)??'null');
			$s = $s . (implode("", array_map(function ($v) {
				return GeneratorTools::capitalize($v);
			}, $words))??'null');
			$s = $s . "_";
		}
		$parts = explode("_", $packs[0]);
		$s1 = implode("", array_map(function ($w) {
			return GeneratorTools::capitalize($w);
		}, array_slice($parts, 1, null)));
		$s = $s . ($parts[0]??'null') . $s1;
		return $s;
	}
}

Boot::registerClass(OrmTable::class, 'generator.OrmTable');