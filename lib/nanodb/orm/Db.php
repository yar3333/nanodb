<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\orm;

use \nanodb\orm\DbException as OrmDbException;
use \nanodb\orm\DbDriver as OrmDbDriver;
use \nanodb\sys\db\ResultSet;
use \nanodb\orm\SqlText as OrmSqlText;
use \nanodb\php\_Boot\HxException;
use \nanodb\EReg;

class Db {
	/**
	 * @var OrmDbDriver
	 */
	public $connection;
	/**
	 * @var string
	 */
	public $connectionString;
	/**
	 * @var int
	 * Level of tracing SQL:
	 * 0 - show errors only;
	 * 1 - show queries;
	 * 2 - show queries and times.
	 */
	public $logLevel;

	/**
	 * @param string $connectionString
	 * @param int $logLevel
	 * 
	 * @return void
	 */
	public function __construct ($connectionString, $logLevel = null) {
		$this->connectionString = $connectionString;
		$this->logLevel = ($logLevel !== null ? $logLevel : 0);
		$n = mb_strpos($connectionString, "://");
		if (($n === false)) {
			throw new \Exception("Connection string format must be 'dbtype://params'.");
		}
		$dbtype = mb_substr($connectionString, 0, $n);
		$dbparams = mb_substr($connectionString, $n + mb_strlen("://"));
		$klassName = "\\nanodb\\orm\\DbDriver_" . $dbtype;
		$tmp = $klassName;
		$this->connection = new $tmp($dbparams);
	}

	/**
	 * @param string $sql
	 * @param mixed $params
	 * 
	 * @return string
	 */
	public function bind ($sql, $params) {
		$_gthis = $this;
		return (new EReg("[{]([_a-zA-Z][_a-zA-Z0-9]*)[}]", ""))->map($sql, function ($re)  use (&$params, &$_gthis, &$sql) {
			$name = $re->matched(1);
			if (array_key_exists($name, $params)) {
				return $_gthis->quote($params[$name]);
			}
			throw new HxException("Param '" . $name . "' not found while binding SQL query '" . $sql . "'.");
		});
	}

	/**
	 * @return void
	 */
	public function close () {
		try {
			$this->connection->close();
		} catch (\Throwable $__hx__caught_e) {
			$__hx__real_e = ($__hx__caught_e instanceof HxException ? $__hx__caught_e->e : $__hx__caught_e);
			$e = $__hx__real_e;
					}
		$this->connection = null;
	}

	/**
	 * @return int
	 */
	public function lastInsertId () {
		return $this->connection->lastInsertId();
	}

	/**
	 * @param string $sql
	 * @param mixed $params
	 * 
	 * @return ResultSet
	 */
	public function query ($sql, $params = null) {
		try {
			if ($params !== null) {
				$sql = $this->bind($sql, $params);
			}
			$tmp = $this->logLevel >= 1;
			$startTime = ($this->logLevel >= 2 ? microtime(true) : 0);
			$r = $this->connection->query($sql);
			$tmp1 = $this->logLevel >= 2;
			return $r;
		} catch (\Throwable $__hx__caught_e) {
			$__hx__real_e = ($__hx__caught_e instanceof HxException ? $__hx__caught_e->e : $__hx__caught_e);
			if ($__hx__real_e instanceof OrmDbException) {
				$e = $__hx__real_e;
				throw new \Exception("DATABASE\n\x09SQL QUERY: " . $sql . "\n\x09SQL RESULT: error code = " . ($e->getCode()??'null') . ", message: " . ($e->getMessage()??'null'));
			} else {
				$e1 = $__hx__real_e;
				throw (is_object($__hx__throw = $e1) && $__hx__throw instanceof \Throwable ? $__hx__throw : new HxException($__hx__throw));
			}
		}
	}

	/**
	 * @param mixed $v
	 * 
	 * @return string
	 */
	public function quote ($v) {
		return $this->connection->quote($v);
	}

	/**
	 * @param string $fieldName
	 * 
	 * @return OrmSqlText
	 */
	public function sqlTextField ($fieldName) {
		return OrmSqlText::field($fieldName);
	}

	/**
	 * @param string $sqlText
	 * 
	 * @return OrmSqlText
	 */
	public function sqlTextRaw ($sqlText) {
		return OrmSqlText::raw($sqlText);
	}
}

