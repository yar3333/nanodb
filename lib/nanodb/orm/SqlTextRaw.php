<?php

namespace nanodb\orm;

class SqlTextRaw extends SqlText
{
	public function __construct ($sqlText)
    {
		parent::__construct($sqlText);
	}
}

