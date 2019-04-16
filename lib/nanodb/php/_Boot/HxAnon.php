<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\php\_Boot;

use \nanodb\php\Boot;

/**
 * Anonymous objects implementation
 */
class HxAnon extends \StdClass {
	/**
	 * @param mixed $fields
	 * 
	 * @return void
	 */
	public function __construct ($fields = null) {
		$_gthis = $this;
		;
		if ($fields !== null) {
			foreach ($fields as $key => $value) {
				$tmp = $_gthis;
				$tmp->{$key} = $value;
			}
		}
	}

	/**
	 * @param string $name
	 * @param mixed $args
	 * 
	 * @return mixed
	 */
	public function __call ($name, $args) {
		return ($this->$name)(...$args);
	}

	/**
	 * @param string $name
	 * 
	 * @return mixed
	 */
	public function __get ($name) {
		return null;
	}
}

Boot::registerClass(HxAnon::class, 'php._Boot.HxAnon');
