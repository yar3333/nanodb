<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\php\_Boot\HxAnon;
use \nanodb\php\Boot;
use \nanodb\EReg;
use \nanodb\generator\OrmPositions as GeneratorOrmPositions;

class OrmTools {
	/**
	 * @param string $haxeName
	 * @param string $haxeType
	 * @param string $haxeDefVal
	 * 
	 * @return object
	 */
	static public function createVar ($haxeName, $haxeType, $haxeDefVal = null) {
		return new HxAnon([
			"haxeName" => $haxeName,
			"haxeType" => $haxeType,
			"haxeDefVal" => $haxeDefVal,
		]);
	}

	/**
	 * @param string $table
	 * @param object $f
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return object
	 */
	static public function field2var ($table, $f, $positions) {
		$f1 = $f->name;
		$tmp = OrmTools::sqlType2phpType($f->type);
		$tmp1 = ($positions->is(new HxAnon([
			"table" => $table,
			"name" => $f->name,
		])) ? "null" : null);
		return new HxAnon([
			"table" => $table,
			"haxeName" => $f1,
			"haxeType" => $tmp,
			"haxeDefVal" => $tmp1,
			"name" => $f->name,
			"type" => $f->type,
			"isNull" => $f->isNull,
			"isKey" => $f->isKey,
			"isAutoInc" => $f->isAutoInc,
		]);
	}

	/**
	 * @param string $table
	 * @param mixed $fields
	 * @param GeneratorOrmPositions $positions
	 * 
	 * @return mixed
	 */
	static public function fields2vars ($table, $fields, $positions) {
		return array_map(function ($x)  use (&$table, &$positions) {
			return OrmTools::field2var($table, $x, $positions);
		}, $fields);
	}

	/**
	 * @param string $sqlType
	 * 
	 * @return string
	 */
	static public function sqlType2phpType ($sqlType) {
		$sqlType = mb_strtoupper($sqlType);
		if ($sqlType === "TINYINT(1)") {
			return "bool";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "TINYINT")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "SMALLINT")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "MEDIUMINT")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "SHORT")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "LONG")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "INT")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "INTEGER")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "INT24")) {
			return "int";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "BIGINT")) {
			return "float";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "LONGLONG")) {
			return "float";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "DECIMAL")) {
			return "float";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "FLOAT")) {
			return "float";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "DOUBLE")) {
			return "float";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "REAL")) {
			return "float";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "DATE")) {
			return "DateTime";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "DATETIME")) {
			return "DateTime";
		}
		return "String";
	}

	/**
	 * @param string $checked
	 * @param string $type
	 * 
	 * @return bool
	 */
	static public function sqlTypeCheck ($checked, $type) {
		$re = new EReg("^" . $type . "(\\(|\$)", "");
		return $re->match($checked);
	}
}

Boot::registerClass(OrmTools::class, 'generator.OrmTools');