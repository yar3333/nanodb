<?php

namespace nanodb\orm;

class EntityFieldNotFoundException extends \Exception
{
	public $methodSuffix;

	function __construct(string $message, string $methodSuffix)
	{
		parent::__construct($message);
		
		$this->methodSuffix = $methodSuffix;
	}
}