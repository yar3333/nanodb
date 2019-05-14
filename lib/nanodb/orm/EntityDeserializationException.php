<?php

namespace nanodb\orm;

class EntityDeserializationException extends \Exception
{
	public $methodSuffix;

	function __construct(string $message, string $methodSuffix)
	{
		parent::__construct($message);
		
		$this->methodSuffix = $methodSuffix;
	}
}