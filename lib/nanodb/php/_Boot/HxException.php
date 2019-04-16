<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\php\_Boot;

use \nanodb\php\Boot;

/**
 * Special exception which is used to wrap non-throwable values
 */
class HxException extends \Exception {
	/**
	 * @var mixed
	 */
	public $e;

	/**
	 * @param mixed $e
	 * 
	 * @return void
	 */
	public function __construct ($e) {
		$this->e = $e;
		parent::__construct(Boot::stringify($e));
	}
}

Boot::registerClass(HxException::class, 'php._Boot.HxException');
