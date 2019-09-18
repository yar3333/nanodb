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
	static public function field($fieldName)
    {
		return new SqlTextField($fieldName);
	}

	/**
	 * @param string $sqlText
	 * @return SqlTextRaw
	 */
	static public function raw($sqlText)
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

