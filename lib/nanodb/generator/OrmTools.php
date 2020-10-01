<?php

namespace nanodb\generator;

use \nanodb\orm\DbTableFieldData;
use \nanodb\EReg;

class OrmTools
{
	/**
	 * @param string $table
	 * @param DbTableFieldData $f
	 * @param OrmPositions $positions
	 * @return OrmPhpVar
	 */
	static public function field2var ($table, $f, $positions)
    {
		$f1 = $f->name;
		$r = ($f->isNull ? "?" : "") . OrmTools::sqlType2phpType($f->type);
		$r1 = new OrmPhpVar($f1, $r, $positions->is($table, $f->name) ? "null" : null);
		$r1->table = $table;
		$r1->name = $f->name;
		$r1->type = $f->type;
		$r1->isNull = $f->isNull;
		$r1->isKey = $f->isKey;
		$r1->isAutoInc = $f->isAutoInc;
		return $r1;
	}

	/**
	 * @param string $table
	 * @param mixed $fields
	 * @param OrmPositions $positions
	 * @return mixed
	 */
	static public function fields2vars ($table, $fields, $positions)
    {
		return array_map(function ($x)  use ($table, $positions) {
			return OrmTools::field2var($table, $x, $positions);
		}, $fields);
	}

	/**
	 * @param string $sqlType
	 * @return string
	 */
	static public function sqlType2phpType($sqlType)
    {
		$sqlType = mb_strtoupper($sqlType);
		if (OrmTools::sqlTypeCheck($sqlType, "BIT")) {
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
			return "\\DateTime";
		}
		if (OrmTools::sqlTypeCheck($sqlType, "DATETIME")) {
			return "\\DateTime";
		}
		return "string";
	}

	/**
	 * @param string $checked
	 * @param string $type
	 * @return bool
	 */
    static public function sqlTypeCheck($checked, $type)
    {
        $re = new EReg("^" . $type . "(\\(|\$)", "");
        return $re->match(self::normalizeType($checked));
    }

    private const EXCLUDES = ['UNSIGNED', 'ZEROFILL'];

    /**
     * @param $sql_type
     * @return string
     */
    private static function normalizeType($sql_type) : string
    {
        $res = $sql_type;
        foreach (self::EXCLUDES as $EXCLUDE) {
            $res = str_replace($EXCLUDE, '', $res);
        }
        return str_replace(' ', '', $res);
    }
}