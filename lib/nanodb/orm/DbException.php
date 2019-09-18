<?php

namespace nanodb\orm;

class DbException extends \Exception
{
	/**
	 * @param string $sql
	 * @param \Exception $e
	 * @return DbException
	 */
	static public function errorOnQuery ($sql, $e)
    {
		return new DbException($sql, $e->getCode(), $e);
	}

	/**
	 * @param string $message
	 * @param int $code
	 * @param \Throwable $previous
	 * @return void
	 */
	public function __construct ($message = null, $code = null, $previous = null)
    {
		parent::__construct($message, $code, $previous);
	}
}

