<?php

namespace nanodb\generator;

/**
 * Global log class.
 * Using:
 *		Log::instance = new Log(5); // init log at the start of your application; 5 - nesting level limit (messages with greater nesting level will be ignored)
 * 		...
 *		Log::start("MyProcessStartMessage");
 * 		...
 * 		Log::echo("myMessage");
 * 		...
 * 		if (good) Log::finishSuccess(); // finish Process
 * 		else      Log::finishFail();
 */
class Log
{
	/**
	 * @var Log
	 */
	static public $instance;

	/**
	 * @var int
	 */
	public $depth;

	/**
	 * @var int
	 */
	public $depthLimit;

	/**
	 * @var bool
	 */
	public $inBlock;

	/**
	 * @var int
	 */
	public $ind;

	/**
	 * @var int
	 */
	public $levelLimit;

	/**
	 * @var mixed
	 */
	public $shown;

	/**
	 * @param string $message
	 * @param int $level
	 * @return void
	 */
	public static function echo($message, $level = 1)
    {
		if ($level === null) {
			$level = 1;
		}
		if (self::$instance !== null) {
			self::$instance->echoInner($message, $level);
		}
	}

	/**
	 * @param string $text
	 * @return void
	 */
	public static function finishFail($text = "FAIL")
    {
		if ($text === null) {
			$text = "FAIL";
		}
		if (self::$instance !== null) {
			self::$instance->finishFailInner($text);
		}
	}

	/**
	 * @param string $text
	 * @return void
	 */
	public static function finishSuccess($text = "OK")
    {
		if ($text === null) {
			$text = "OK";
		}
		if (self::$instance !== null) {
			self::$instance->finishSuccessInner($text);
		}
	}

	/**
	 * @param string $message
	 * @param int $level
	 * @param \Closure $procFunc
	 * @return void
	 */
	public static function process($message, $level, $procFunc)
    {
		if ($level === null) {
			$level = 1;
		}
		self::start($message, $level);
		try {
			$procFunc();
		}
		catch (\Throwable $e) {
			self::finishFail();
			throw $e;
		}
		self::finishSuccess();
	}

	/**
	 * @param string $message
	 * @param int $level
	 * @param \Closure $procFunc
	 * @return mixed
	 */
	public static function processResult($message, $level, $procFunc)
    {
		if ($level === null) $level = 1;

		self::start($message, $level);
		$r = null;
		try {
			$r = $procFunc();
		}
		catch (\Throwable $e) {
			self::finishFail();
			throw $e;
		}
		self::finishSuccess();
		return $r;
	}

	/**
	 * @param string $message
	 * @param int $level
	 * @return void
	 */
	public static function start($message, $level = 1)
    {
		if ($level === null) $level = 1;

		if (self::$instance !== null) {
			self::$instance->startInner($message, $level);
		}
	}

	/**
	 * @param int $depthLimit
	 * @param int $levelLimit
	 * @return void
	 */
	public function __construct($depthLimit = 2147483647, $levelLimit = 2147483647)
    {
		if ($depthLimit === null) $depthLimit = 2147483647;
		if ($levelLimit === null) $levelLimit = 2147483647;

		$this->depthLimit = $depthLimit;
		$this->levelLimit = $levelLimit;
		$this->depth = -1;
		$this->ind = 0;
		$this->inBlock = false;
		$this->shown = [];
	}

	/**
	 * @param string $text
	 * @param int $level
	 * @return void
	 */
	public function echoInner ($text, $level)
    {
		if ($this->depth < $this->depthLimit) {
			if ($level <= $this->levelLimit) {
				if ($this->inBlock) {
					$this->println("");
				}
				$this->println($this->indent($this->ind) . str_replace("\n", "\n" . $this->indent($this->ind), $text));
				$this->inBlock = false;
			}
		}
	}

	/**
	 * @param string $text
	 * @return void
	 */
	public function finishFailInner($text)
    {
		if ($this->depth < $this->depthLimit) {
			if (array_pop($this->shown)) {
				if (!$this->inBlock) {
					$this->print($this->indent($this->ind));
				}
				$this->ind--;
				if (!(mb_strpos($text, "\n") !== false)) {
					$this->println("[" . $text . "]");
				} else {
					$this->println("\n" . $this->indent($this->ind + 1) . "[\n" . $this->indent($this->ind + 2) . str_replace("\n", "\n" . $this->indent($this->ind + 2), $text) . "\n" . $this->indent($this->ind + 1) . "]");
				}
				$this->inBlock = false;
			}
		}
		$this->depth--;
	}

	/**
	 * @param string $text
	 * @return void
	 */
	public function finishSuccessInner($text)
    {
		if ($this->depth < $this->depthLimit) {
			if (array_pop($this->shown)) {
				if (!$this->inBlock) {
					$this->print($this->indent($this->ind));
				}
				$this->ind--;
				if (!(mb_strpos($text, "\n") !== false)) {
					$this->println("[" . $text . "]");
				} else {
					$this->println("\n" . $this->indent($this->ind + 1) . "[\n" . $this->indent($this->ind + 2) . str_replace("\n", "\n" . ($this->indent($this->ind + 2)??'null'), $text) . "\n" . $this->indent($this->ind + 1) . "]");
				}
				$this->inBlock = false;
			}
		}
		$this->depth--;
	}

	/**
	 * @param int $depth
	 * @return string
	 */
	public function indent ($depth)
    {
		return str_pad("", $depth * 2, " ");
	}

	/**
	 * @param string $s
	 * @return void
	 */
	public function print ($s)
    {
		echo($s);
	}

	/**
	 * @param string $s
	 * @return void
	 */
	public function println ($s)
    {
		echo($s . "\n");
	}

	/**
	 * @param string $message
	 * @param int $level
	 * @return void
	 */
	public function startInner ($message, $level)
    {
		$this->depth++;
		if ($this->depth < $this->depthLimit) {
			if ($level <= $this->levelLimit) {
				if ($this->inBlock) {
					$this->println("");
				}
				$this->print($this->indent($this->ind) . $message . ": ");
				$this->inBlock = true;
				$this->shown[] = true;
				$this->ind++;
			} else {
				$this->shown[] = false;
			}
		}
	}

	/**
	 * @internal
	 * @access private
	 */
	public static function init()
	{
		static $called = false;
		if ($called) return;
		$called = true;

		self::$instance = new Log();
	}
}

Log::init();
