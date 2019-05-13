<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\orm;

use \nanodb\orm\SqlTextField as OrmSqlTextField;
use \nanodb\orm\SqlTextRaw as OrmSqlTextRaw;

class SqlText {
	/**
	 * @var string
	 */
	public $text;

	/**
	 * @param string $fieldName
	 * 
	 * @return OrmSqlTextField
	 */
	static public function field ($fieldName) {
		return new OrmSqlTextField($fieldName);
	}

	/**
	 * @param string $sqlText
	 * 
	 * @return OrmSqlTextRaw
	 */
	static public function raw ($sqlText) {
		return new OrmSqlTextRaw($sqlText);
	}

	/**
	 * @param string $text
	 * 
	 * @return void
	 */
	protected function __construct ($text) {
		$this->text = $text;
	}
}

