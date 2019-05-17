<?php

namespace nanodb\orm;

class EntityDeserializationException extends \Exception
{
	public $methodSuffix;

	function __construct(string $message, string $methodSuffix, \Throwable $previous = null)
	{
		parent::__construct($message, 0, $previous);
		
		$this->methodSuffix = $methodSuffix;
	}
}