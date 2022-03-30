<?php

namespace nanodb\orm;

class SqlText
{
	/**
	 * @var string
	 */
	public $text;

	/**
	 * @param string $fieldName
	 * @return SqlTextField
	 */
	public static function field($fieldName)
    {
		return new SqlTextField($fieldName);
	}

	/**
	 * @param string $sqlText
	 * @return SqlTextRaw
	 */
	public static function raw($sqlText)
    {
		return new SqlTextRaw($sqlText);
	}

	/**
	 * @param string $text
	 * @return void
	 */
	protected function __construct($text)
    {
		$this->text = $text;
	}
}

