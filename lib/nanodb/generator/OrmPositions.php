<?php

namespace nanodb\generator;

class OrmPositions
{
	/**
	 * @var mixed
	 */
	public $names;

	/**
	 * @param mixed $names
	 * @return void
	 */
	public function __construct($names)
    {
		$this->names = $names;
	}

	/**
	 * @param string $table
	 * @param string $name
	 * @return bool
	 */
	public function is($table, $name)
    {
		if (\in_array($table . '.' . $name, $this->names, false) || \in_array('*.' . $name, $this->names, false)) {
			return true;
		}
        return \in_array($name, $this->names, false);
	}
}

