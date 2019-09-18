<?php

namespace nanodb\orm;

class DbTableFieldData
{
	/**
	 * @var bool
	 */
	public $isAutoInc;

	/**
	 * @var bool
	 */
	public $isKey;

	/**
	 * @var bool
	 */
	public $isNull;

	/**
	 * @var string
	 */
	public $name;

	/**
	 * @var string
	 */
	public $type;

	/**
	 * @param string $name
	 * @param string $type
	 * @param bool $isNull
	 * @param bool $isKey
	 * @param bool $isAutoInc
	 */
	public function __construct ($name, $type, $isNull, $isKey, $isAutoInc)
    {
		$this->name = $name;
		$this->type = $type;
		$this->isNull = $isNull;
		$this->isKey = $isKey;
		$this->isAutoInc = $isAutoInc;
	}
}

