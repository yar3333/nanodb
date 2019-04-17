<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\php\_Boot;

use \nanodb\php\Boot;

/**
 * Base class for enum types
 */
class HxEnum {
	/**
	 * @var int
	 */
	public $index;
	/**
	 * @var mixed
	 */
	public $params;
	/**
	 * @var string
	 */
	public $tag;

	/**
	 * @param string $tag
	 * @param int $index
	 * @param mixed $arguments
	 * 
	 * @return void
	 */
	public function __construct ($tag, $index, $arguments = null) {
		$this->tag = $tag;
		$this->index = $index;
		$tmp = null;
		if ($arguments === null) {
			$this1 = [];
			$tmp = $this1;
		} else {
			$tmp = $arguments;
		}
		$this->params = $tmp;
	}

	/**
	 * PHP magic method to get string representation of this `Class`
	 * 
	 * @return string
	 */
	public function __toString () {
		$result = $this->tag;
		if (count($this->params) > 0) {
			$strings = array_map(function ($item) {
				return Boot::stringify($item);
			}, $this->params);
			$result = $result . "(" . (implode(",", $strings)??'null') . ")";
		}
		return $result;
	}

	/**
	 * Get string representation of this `Class`
	 * 
	 * @return string
	 */
	public function toString () {
		return $this->__toString();
	}
}

Boot::registerClass(HxEnum::class, 'php._Boot.HxEnum');