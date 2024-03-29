<?php

namespace nanodb\orm;

use nanodb\sys\db\Mysql;
use nanodb\sys\db\ResultSet;
use nanodb\EReg;
use nanodb\sys\db\MysqlConnection;

class DbDriver_mysql implements DbDriver
{
	/**
	 * @var int
	 */
	const renewTimeoutSeconds = 120;

	/**
	 * @var MysqlConnection
	 */
	public $connection;

	/**
	 * @var string
	 */
	public $database;

	/**
	 * @var string
	 */
	public $host;

	/**
	 * @var int
	 */
	public $lastAccessTime;

	/**
	 * @var string
	 */
	public $pass;

	/**
	 * @var int
	 */
	public $port;

	/**
	 * @var string
	 */
	public $user;

    /**
     * @var ?int
     */
    public $connection_timeout;

	/**
	 * @param string $dbparams
	 * @return void
	 */
	public function __construct($dbparams)
    {
		$this->lastAccessTime = 0;

        $re = new EReg("^([_a-zA-Z0-9]+)\\:(.+?)@([-_.a-zA-Z0-9]+)(?:[:](\\d+))?/([-_a-zA-Z0-9]+)(#(\\d+))?\$", '');
		if (!$re->match($dbparams)) throw new \Exception('Connection string invalid format.');

		$this->host = $re->matched(3);
		$this->user = $re->matched(1);
		$this->pass = $re->matched(2);
		$this->database = $re->matched(5);
		$this->port = (($re->matched(4) !== null) && ($re->matched(4) !== '') ? (int)($re->matched(4)) : 0);
        $this->connection_timeout = $re->matched(7);
		$this->renew();
	}

	/**
	 * @return void
	 */
	public function close()
    {
		try {
			$this->connection->close();
		}
		catch (\Throwable $e) {}
		$this->connection = null;
	}

	/**
	 * @param string $table
	 * @return mixed
	 */
	public function getFields($table)
    {
		$this1 = [];
		$r = $this1;
		$resultSet = $this->query('SHOW COLUMNS FROM `' . $table . '`');
		$collection = $resultSet->results();
		foreach ($collection as $key => $value) {
			$r[] = new DbTableFieldData($value['Field'], $value['Type'], $value['Null'] === 'YES', $value['Key'] === 'PRI', $value['Extra'] === 'auto_increment');
		}

		return $r;
	}

	/**
	 * @param string $table
	 * @return mixed
	 */
	public function getForeignKeys($table)
    {
		$sql = "\n  SELECT\n   u.table_name AS 'table',\n   u.column_name AS 'key',\n   u.referenced_table_name AS 'parentTable',\n   u.referenced_column_name AS 'parentKey'\n  FROM information_schema.table_constraints AS c\n  INNER JOIN information_schema.key_column_usage AS u\n  USING( constraint_schema, constraint_name )\n  WHERE c.constraint_type = 'FOREIGN KEY'\n    AND c.table_schema = '" . $this->database . "'\n    AND u.table_name = '" . $table . "';\n";
		return array_map(static function ($x) {
			return (object)($x);
		}, $this->query($sql)->results());
	}

	/**
	 * @return mixed
	 */
	public function getTables()
    {
		$this1 = [];
		$r = $this1;
		$resultSet = $this->query('SHOW TABLES FROM `' . $this->database . '`');
		$collection = $resultSet->results();
		foreach ($collection as $key => $value) {
			$fields = array_keys($value);
			$r[] = $value[$fields[0]];

		}

		return $r;
	}

	/**
	 * @param string $table
	 * @return mixed
	 */
	public function getUniques($table)
    {
		$resultSet = $this->query('SHOW INDEX FROM `' . $table . "` WHERE Non_unique=0 AND Key_name<>'PRIMARY'");
		$this1 = [];
		$r = $this1;
		$collection = $resultSet->results();
		foreach ($collection as $key => $value) {
			$key1 = $value['Key_name'];
			if (!\array_key_exists($key1, $r)) {
				$this2 = [];
				$r[$key1] = $this2;
			}
			$r[$key1][] = $value['Column_name'];

		}

		return array_values($r);
	}

	/**
	 * @return int
	 */
	public function lastInsertId()
    {
		return $this->connection->lastInsertId();
	}

	/**
	 * @param string $sql
	 * @return ResultSet
	 */
	public function query($sql)
    {
		$this->renew();
		try {
			return $this->connection->request($sql);
		}
		catch (\Throwable $e) {
			throw DbException::errorOnQuery($sql, $e);
		}
	}

	/**
	 * @param mixed $v
	 * @return string
	 */
	public function quote($v)
    {
		if (\is_string($v)) return $this->connection->quote($v);
		if (\is_int($v)) return $this->connection->quote($v);
		if (\is_float($v)) return $this->connection->quote($v);
		if (\is_bool($v)) return $v ? '1' : '0';
		if ($v === null) return 'NULL';
		if ($v instanceof \DateTime) return "'" . ($v->format('Y-m-d H:i:s')??'null') . "'";
		if ($v instanceof SqlTextField) return '`' . $v->text . '`';
		throw new \Exception("Unsupported parameter type '" . $v . "'.");
	}

	/**
	 * @return void
	 */
	public function renew()
    {
		if (time() - $this->lastAccessTime > 120) {
			if ($this->connection !== null) {
				try {
					$this->connection->request('SELECT 0');
				}
				catch (\Throwable $e) {
					$this->close();
				}
			}
			if ($this->connection === null) {
				$this->connection = Mysql::connect((object)([
					'host' => $this->host,
					'user' => $this->user,
					'pass' => $this->pass,
					'database' => $this->database,
					'port' => ($this->port !== 0 ? $this->port : 3306),
					'socket' => null,
				]));
				$this->connection->request('set names utf8');
				$this->connection->request("set character_set_client='utf8'");
				$this->connection->request("set character_set_results='utf8'");
				$this->connection->request("set collation_connection='utf8_general_ci'");
			}
		}
		$this->lastAccessTime = time();
	}
}

