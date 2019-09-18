<?php

namespace nanodb\generator;

use \nanodb\EReg;

/**
 * Usage example:
 * $parser = new CmdOptions();
 * $parser->addOption('isRecursive', false, [ '-r', '--recursive']);
 * $parser->addOption('count', 0, [ '-c', '--count']);
 * $parser->addOption('file', 'bin');
 * $parser->parse([ 'test', '-c', '10', '-r' ]);
 * // now:
 * // $parser->params = [ 'c' => 10, 'r' => true, file => 'test' ]
 */
class CmdOptions {
	/**
	 * @var mixed
	 */
	public $args;
	/**
	 * @var mixed
	 */
	public $options;
	/**
	 * @var int
	 */
	public $paramWoSwitchIndex;
	/**
	 * @var mixed
	 */
	public $params;

	/**
	 * @return void
	 */
	public function __construct()
    {
		$this1 = [];
		$this->options = $this1;
	}

	/**
	 * @param string $name
	 * @param mixed $defaultValue
	 * @param mixed $switches
	 * @param string $help
	 * @return void
	 */
	public function add($name, $defaultValue, $switches = null, $help = "")
    {
		if ($help === null) $help = "";
		$type = $this->getValueType($defaultValue);
		if ($type === null) $type = "string";
		$this->addInner($name, $defaultValue, $type, $switches, $help, false);
	}

	/**
	 * @param string $name
	 * @param mixed $defaultValue
	 * @param string $type
	 * @param mixed $switches
	 * @param string $help
	 * @param bool $repeatable
	 * @return void
	 */
	public function addInner($name, $defaultValue, $type, $switches, $help, $repeatable) : void
    {
		if (!$this->hasOption($name)) {
			array_push($this->options, new CmdOption($name, $defaultValue, $type, $switches, $help, $repeatable));
		} else {
			throw new \Exception("Option '" . $name . "' already added.");
		}
	}

	/**
	 * @param string $name
	 * @param string $type
	 * @param mixed $switches
	 * @param string $help
	 * @return void
	 */
	public function addRepeatable ($name, $type, $switches = null, $help = "") : void
    {
		if ($help === null) {
			$help = "";
		}
		if (($type !== "string") && ($type !== "int") && ($type !== "float")) {
			throw new \Exception("Type '" . $type . "' can not be used for repeatable option '" . $name . "'.");
		}
		$this->addInner($name, [], $type, $switches, $help, true);
	}

	/**
	 * @param string $name
	 * @param mixed $value
	 * @return void
	 */
	public function addRepeatableValue ($name, $value) : void
    {
		if ($this->params[$name] === null) {
			$this->params[$name] = [];
		}
		array_push($this->params[$name], $value);
	}

	/**
	 * @param string $s
	 * @return void
	 */
	public function ensureValueExist ($s)
    {
		if (count($this->args) === 0) {
			throw new \Exception("Missing value after '" . $s . "' switch.");
		}
	}

	/**
	 * @param string $name
	 * @return mixed
	 */
	public function get($name)
    {
		return $this->params[$name];
	}

	/**
	 * @param string $prefix
	 * @return string
	 */
	public function getHelpMessage ($prefix = "\t")
    {
		if ($prefix === null) {
			$prefix = "\t";
		}
		$maxSwitchLength = 0;
		$collection = $this->options;
		foreach ($collection as $key => $value) {
			if (($value->switches !== null) && (count($value->switches) > 0)) {
				$maxSwitchLength1 = implode(", ", $value->switches);
				$maxSwitchLength = ($maxSwitchLength > mb_strlen($maxSwitchLength1) ? $maxSwitchLength : mb_strlen(implode(", ", $value->switches)));
			} else {
				$maxSwitchLength = ($maxSwitchLength > (mb_strlen($value->name) + 2) ? $maxSwitchLength : mb_strlen($value->name) + 2);
			}
		}

		$s = "";
		$collection1 = $this->options;
		foreach ($collection1 as $key1 => $value1) {
			if (($value1->switches !== null) && (count($value1->switches) > 0)) {
				$s1 = str_pad(implode(", ", $value1->switches), $maxSwitchLength + 1, " ");
				$s = $s . $prefix . $s1;
			} else {
				$s2 = str_pad("<" . $value1->name . ">", $maxSwitchLength + 1, " ");
				$s = $s . $prefix . $s2;
			}
			if (($value1->help !== null) && ($value1->help !== "")) {
				$helpLines = explode("\n", $value1->help);
				$s = $s . array_shift($helpLines) . "\n";
				$s = $s . (implode("", array_map(function ($s3)  use (&$maxSwitchLength, &$prefix) {
					$this1 = str_pad("", $maxSwitchLength + 1, " ", STR_PAD_LEFT);
					return $prefix . $this1 . $s3 . "\n";
				}, $helpLines))??'null');
			} else {
				$s = $s . "\n";
			}
			$s = $s . "\n";

		}

		return (rtrim($s, null)??'null') . "\n";
	}

	/**
	 * @return CmdOption
	 */
	public function getNextNoSwitchOption()
    {
		$_g = $this->paramWoSwitchIndex;
		$_g1 = count($this->options);
		while ($_g < $_g1) {
			$i = $_g++;
			if ($this->options[$i]->switches === null) {
				if (!$this->options[$i]->repeatable) {
					$this->paramWoSwitchIndex = $i + 1;
				}
				return $this->options[$i];
			}
		}

		throw new \Exception("Unexpected argument '" . $this->args[0] . "'.");
	}

	/**
	 * @param mixed $v
	 * @return string
	 */
	public function getValueType($v)
    {
		if (is_int($v)) {
			return "int";
		}
		if (is_float($v)) {
			return "float";
		}
		if (is_string($v)) {
			return "string";
		}
		return null;
	}

	/**
	 * @param string $name
	 * @return bool
	 */
	public function hasOption($name)
    {
		return current(array_filter($this->options, function ($opt)  use (&$name) {
			return $opt->name === $name;
		}));
	}

	/**
	 * @param mixed $args
	 * @return mixed
	 */
	public function parse($args)
    {
		$_gthis = $this;
		$this->args = array_slice($args, 0);
		$this->paramWoSwitchIndex = 0;
		$this1 = [];
		$this->params = $this1;
		$collection = $this->options;
		foreach ($collection as $key => $value) {
			$_gthis->params[$value->name] = $value->defaultValue;
		}

		while (count($this->args) > 0) {
			$this->parseElement();
		}
		return $this->params;
	}

	public function parseElement() : void
    {
		$arg = array_shift($this->args);
		if ($arg !== "--") {
			if ((mb_substr($arg, 0, 1) === "-") && ($arg !== "-")) {
				$arg = (new EReg("^(--?.+)=(.+)\$", ""))->map($arg, function(EReg $r) {
					array_unshift($this->args, $r->matched(2));
					return $r->matched(1);
				});
				$_g = 0;
				$_g1 = $this->options;
				while ($_g < count($_g1)) {
					$opt = $_g1[$_g];
					++$_g;
					if ($opt->switches !== null) {
						$_g2 = 0;
						$_g11 = $opt->switches;
						while ($_g2 < count($_g11)) {
							$s = $_g11[$_g2];
							++$_g2;
							if ($s === $arg) {
								$this->parseValue($opt, $arg);
								return;
							}
						}
					}
				}

				throw new \Exception("Unknow switch '" . $arg . "'.");
			} else {
				array_unshift($this->args, $arg);
				$this->parseValue($this->getNextNoSwitchOption(), $this->args[0]);
			}
		} else {
			while (count($this->args) > 0) {
				$this->parseValue($this->getNextNoSwitchOption(), $this->args[0]);
			}
		}
	}

	/**
	 * @param CmdOption $opt
	 * @param string $s
	 * @return void
	 */
	public function parseValue ($opt, $s)
    {
		$__hx__switch = ($opt->type);
		if ($__hx__switch === "bool") {
			$this->params[$opt->name] = !$opt->defaultValue;
		} else if ($__hx__switch === "float") {
			$this->ensureValueExist($s);
			if (!$opt->repeatable) {
				$this->params[$opt->name] = (float)(array_shift($this->args));
			} else {
				$this->addRepeatableValue($opt->name, (float)(array_shift($this->args)));
			}
		} else if ($__hx__switch === "int") {
			$this->ensureValueExist($s);
			if (!$opt->repeatable) {
				$this->params[$opt->name] = (int)(array_shift($this->args));
			} else {
				$this->addRepeatableValue($opt->name, (int)(array_shift($this->args)));
			}
		} else if ($__hx__switch === "string") {
			$this->ensureValueExist($s);
			if (!$opt->repeatable) {
				$this->params[$opt->name] = array_shift($this->args);
			} else {
				$this->addRepeatableValue($opt->name, array_shift($this->args));
			}
		} else {
			throw new \Exception("Option type '" . $opt->type . "' not supported.");
		}
	}
}

