<?php

namespace nanodb\orm;

use nanodb\sys\db\ResultSet;

class Db
{
	/**
	 * @var DbDriver
	 */
	public $connection;
	
	/**
	 * @var string
	 */
	protected $connectionString;
	
	/**
	 * @var int
	 * Level of tracing SQL:
	 * 0 - show errors only;
	 * 1 - show queries;
	 * 2 - show queries and times.
	 */
	public $logLevel;

	public function __construct(string $connectionString, int $logLevel = null)
	{
		$this->connectionString = $connectionString;
		
		$this->logLevel = $logLevel ?? 0;
		
		$n = mb_strpos($connectionString, "://");
		if ($n === false) throw new \Exception("Connection string format must be 'dbtype://params'.");
		$dbtype = mb_substr($connectionString, 0, $n);
		$dbparams = mb_substr($connectionString, $n + mb_strlen("://"));
		
		$klassName = "\\nanodb\\orm\\DbDriver_" . $dbtype;
		$this->connection = new $klassName($dbparams);
	}

	public function bind(string $sql, array $params) : string
	{
		return preg_replace_callback("/[{]([_a-zA-Z][_a-zA-Z0-9]*)[}]/", function ($mathes)  use ($params, $sql) {
			$name = $mathes[1];
			if (array_key_exists($name, $params)) return $this->quote($params[$name]);
			throw new \Exception("Param \"$name\" not found while binding SQL query \"$sql\".");
		}, $sql);
	}

	public function close() : void
	{
		try { $this->connection->close(); }
		catch (\Exception $e) {}
		$this->connection = null;
	}

	public function lastInsertId() : int
	{
		return $this->connection->lastInsertId();
	}

	public function query(string $sql, array $params = null) : ResultSet
	{
		try {
			if ($params !== null) {
				$sql = $this->bind($sql, $params);
			}
			return $this->connection->query($sql);
		}
		catch (DbException $e)
		{
			throw new \Exception("DATABASE\n\tSQL QUERY: " . $sql . "\n\tSQL RESULT: error code = " . $e->getCode() . ", message: " . $e->getMessage());
		}
	}

	public function quote($v) : string
	{
		if ($v instanceof SqlTextRaw) return $v->text;
		
		if (is_array($v) || $v instanceof \ArrayObject) {
			return "(" . implode(", ", array_map(function ($x) { return $this->quote($x); }, $v)) . ")";
		}
		return $this->connection->quote($v);
	}
}

