<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\php\_Boot;

use \nanodb\php\Boot;
use \nanodb\php\_Boot\HxString as _BootHxString;
use \nanodb\php\_Boot\HxClosure as _BootHxClosure;

/**
 * Class<T> implementation for Haxe->PHP internals.
 */
class HxClass {
	/**
	 * @var string
	 */
	public $phpClassName;

	/**
	 * @param string $phpClassName
	 * 
	 * @return void
	 */
	public function __construct ($phpClassName) {
		$this->phpClassName = $phpClassName;
	}

	/**
	 * Magic method to call static methods of this class, when `HxClass` instance is in a `Dynamic` variable.
	 * 
	 * @param string $method
	 * @param mixed $args
	 * 
	 * @return mixed
	 */
	public function __call ($method, $args) {
		$callback = ((($this->phpClassName === "String" ? _BootHxString::class : $this->phpClassName))??'null') . "::" . $method;
		return call_user_func_array($callback, $args);
	}

	/**
	 * Magic method to get static vars of this class, when `HxClass` instance is in a `Dynamic` variable.
	 * 
	 * @param string $property
	 * 
	 * @return mixed
	 */
	public function __get ($property) {
		if (defined("" . $this->phpClassName . "::" . $property)) {
			return constant("" . $this->phpClassName . "::" . $property);
		} else if (Boot::hasGetter($this->phpClassName, $property)) {
			$tmp = $this->phpClassName;
			return $tmp::{"get_" . $property}();
		} else if (method_exists($this->phpClassName, $property)) {
			return new _BootHxClosure($this->phpClassName, $property);
		} else {
			$tmp1 = $this->phpClassName;
			return $tmp1::${$property};
		}
	}

	/**
	 * Magic method to set static vars of this class, when `HxClass` instance is in a `Dynamic` variable.
	 * 
	 * @param string $property
	 * @param mixed $value
	 * 
	 * @return void
	 */
	public function __set ($property, $value) {
		if (Boot::hasSetter($this->phpClassName, $property)) {
			$tmp = $this->phpClassName;
			$tmp::{"set_" . $property}($value);
		} else {
			$tmp1 = $this->phpClassName;
			$tmp1::${$property} = $value;
		}
	}
}

Boot::registerClass(HxClass::class, 'php._Boot.HxClass');