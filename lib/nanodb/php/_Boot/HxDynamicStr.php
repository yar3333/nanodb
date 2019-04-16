<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\php\_Boot;

use \nanodb\php\Boot;
use \nanodb\php\_Boot\HxString as _BootHxString;
use \nanodb\php\_Boot\HxClosure as _BootHxClosure;

/**
 * For Dynamic access which looks like String.
 * Instances of this class should not be saved anywhere.
 * Instead it should be used to immediately invoke a String field right after instance creation one time only.
 */
class HxDynamicStr extends _BootHxClosure {
	/**
	 * @var string
	 */
	static public $hxString;

	/**
	 * @param string $str
	 * @param string $method
	 * @param mixed $args
	 * 
	 * @return mixed
	 */
	static public function invoke ($str, $method, $args) {
		array_unshift($args, $str);
		return call_user_func_array((HxDynamicStr::$hxString??'null') . "::" . $method, $args);
	}

	/**
	 * Returns HxDynamicStr instance if `value` is a string.
	 * Otherwise returns `value` as-is.
	 * 
	 * @param mixed $value
	 * 
	 * @return mixed
	 */
	static public function wrap ($value) {
		if (is_string($value)) {
			return new HxDynamicStr($value);
		} else {
			return $value;
		}
	}

	/**
	 * @param string $str
	 * 
	 * @return void
	 */
	public function __construct ($str) {
		parent::__construct($str, null);
	}

	/**
	 * @param string $method
	 * @param mixed $args
	 * 
	 * @return mixed
	 */
	public function __call ($method, $args) {
		array_unshift($args, $this->target);
		return call_user_func_array((HxDynamicStr::$hxString??'null') . "::" . $method, $args);
	}

	/**
	 * @param string $field
	 * 
	 * @return mixed
	 */
	public function __get ($field) {
		if ($field === "length") {
			return mb_strlen($this->target);
		} else {
			$this->func = $field;
			return $this;
		}
	}

	/**
	 * @see http://php.net/manual/en/language.oop5.magic.php#object.invoke
	 * 
	 * @return mixed
	 */
	public function __invoke () {
		$str = $this->target;
		$method = $this->func;
		$args = func_get_args();
		array_unshift($args, $str);
		return call_user_func_array((HxDynamicStr::$hxString??'null') . "::" . $method, $args);
	}

	/**
	 * Invoke this closure with `newThis` instead of `this`
	 * 
	 * @param mixed $newThis
	 * @param mixed $args
	 * 
	 * @return mixed
	 */
	public function callWith ($newThis, $args) {
		if ($newThis === null) {
			$newThis = $this->target;
		}
		$method = $this->func;
		array_unshift($args, $newThis);
		return call_user_func_array((HxDynamicStr::$hxString??'null') . "::" . $method, $args);
	}

	/**
	 * Generates callable value for PHP
	 * 
	 * @param mixed $eThis
	 * 
	 * @return mixed
	 */
	public function getCallback ($eThis = null) {
		if ($eThis === null) {
			return [$this, $this->func];
		}
		return [new HxDynamicStr($eThis), $this->func];
	}

	/**
	 * @internal
	 * @access private
	 */
	static public function __hx__init ()
	{
		static $called = false;
		if ($called) return;
		$called = true;


		self::$hxString = Boot::getClass(_BootHxString::class)->phpClassName;
	}
}

Boot::registerClass(HxDynamicStr::class, 'php._Boot.HxDynamicStr');
HxDynamicStr::__hx__init();
