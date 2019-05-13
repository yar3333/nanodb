<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\sys\db;

use \nanodb\sys\db\Connection as DbConnection;
use \nanodb\sys\db\SQLiteResultSet as DbSQLiteResultSet;
use \nanodb\sys\db\ResultSet as DbResultSet;

class SQLiteConnection implements DbConnection {
	/**
	 * @var \SQLite3
	 */
	public $db;

	/**
	 * @param string $file
	 * 
	 * @return void
	 */
	public function __construct ($file) {
		$this->db = new \SQLite3($file);
		$this->db->enableExceptions(true);
	}

	/**
	 * @return void
	 */
	public function close () {
		$this->db->close();
	}

	/**
	 * @return void
	 */
	public function commit () {
		$this->db->query("COMMIT");
	}

	/**
	 * @return string
	 */
	public function dbName () {
		return "SQLite";
	}

	/**
	 * @param string $s
	 * 
	 * @return string
	 */
	public function escape ($s) {
		return \SQLite3::escapeString($s);
	}

	/**
	 * @return int
	 */
	public function lastInsertId () {
		return (int)($this->db->lastInsertRowID());
	}

	/**
	 * @param string $s
	 * 
	 * @return string
	 */
	public function quote ($s) {
		if ((mb_strpos($s, "\x00") !== false)) {
			return "x'" . bin2hex($s) . "'";
		}
		return "'" . (\SQLite3::escapeString($s)??'null') . "'";
	}

	/**
	 * @param string $s
	 * 
	 * @return DbResultSet
	 */
	public function request ($s) {
		$result = $this->db->query($s);
		return new DbSQLiteResultSet($result);
	}

	/**
	 * @return void
	 */
	public function rollback () {
		$this->db->query("ROLLBACK");
	}

	/**
	 * @return void
	 */
	public function startTransaction () {
		$this->db->query("BEGIN TRANSACTION");
	}
}

