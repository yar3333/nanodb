<?php

namespace nanodb\generator;

class CmdOption
{
	/**
	 * @var mixed
	 */
	public $defaultValue;

	/**
	 * @var string
	 */
	public $help;

	/**
	 * @var string
	 */
	public $name;

	/**
	 * @var bool
	 */
	public $repeatable;

	/**
	 * @var mixed
	 */
	public $switches;

	/**
	 * @var string
	 */
	public $type;

	/**
	 * @param string $name
	 * @param mixed $defaultValue
	 * @param string $type
	 * @param mixed $switches
	 * @param string $help
	 * @param bool $repeatable
	 * 
	 * @return void
	 */
	public function __construct ($name, $defaultValue, $type, $switches, $help, $repeatable)
    {
		$this->name = $name;
		$this->defaultValue = $defaultValue;
		$this->type = $type;
		$this->switches = $switches;
		$this->help = $help;
		$this->repeatable = $repeatable;
	}
}

