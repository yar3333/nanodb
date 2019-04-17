<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\generator;

use \nanodb\php\Boot;
use \nanodb\generator\PhpVar as GeneratorPhpVar;

class OrmPhpVar extends GeneratorPhpVar {
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
	 * 
	 * @return void
	 */
	public function __construct ($haxeName, $haxeType, $haxeDefVal = null) {
		parent::__construct($haxeName, $haxeType, $haxeDefVal);
	}
}

Boot::registerClass(OrmPhpVar::class, 'generator.OrmPhpVar');
