<?php

namespace nanodb\orm;

class SqlTextField extends SqlText
{
	public function __construct($fieldName)
    {
		parent::__construct($fieldName);
	}
}
