<?php

namespace nanodb\generator;

class PhpVar
{
	/**
	 * @var string
	 */
	public $haxeDefVal;

	/**
	 * @var string
	 */
	public $haxeName;

	/**
	 * @var string
	 */
	public $haxeType;

	/**
	 * @param string $haxeName
	 * @param string $haxeType
	 * @param string $haxeDefVal
	 * @return void
	 */
	public function __construct ($haxeName, $haxeType, $haxeDefVal = null)
    {
		$this->haxeName = $haxeName;
		$this->haxeType = $haxeType;
		$this->haxeDefVal = $haxeDefVal;
	}
}
