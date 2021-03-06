<?php

namespace nanodb\generator;

class OrmPhpVar extends PhpVar
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
	public $table;

	/**
	 * @var string
	 */
	public $type;

	/**
	 * @param string $haxeName
	 * @param string $haxeType
	 * @param string $haxeDefVal
	 * @return void
	 */
	public function __construct ($haxeName, $haxeType, $haxeDefVal = null)
    {
		parent::__construct($haxeName, $haxeType, $haxeDefVal);
	}
}

