<?php

namespace nanodb\orm;

use nanodb\sys\db\Connection;
use nanodb\sys\db\Sqlite;
use nanodb\sys\db\ResultSet;
use nanodb\EReg;

class DbDriver_sqlite implements DbDriver
{
	/**
	 * @var Connection
	 */
	public $connection;

	/**
	 * @param string $dbparams
	 * @return void
	 */
	public function __construct ($dbparams)
    {
		$this->connection = Sqlite::open($dbparams);
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
		$_gthis = $this;
		$rows = $this->query('PRAGMA table_info(' . $table . ')');
		return array_map(static function ($row)  use (&$table, &$_gthis) {
			$row1 = $row['name'];
			$row2 = $row['type'];
			$tmp = ($row['notnull'] == 0);
			$row3 = $row['pk'];
			return new DbTableFieldData($row1, $row2, $tmp, $row3, $_gthis->isAutoincrement($table, $row['name']));
		}, $rows->results());
	}

	/**
	 * @param string $table
	 * @return mixed
	 */
	public function getForeignKeys($table)
    {
		$this1 = [];
		$r = $this1;
		$sql = $this->query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" . $table . "'")->getResult(0);
		$reFK = new EReg('^CONSTRAINT ".+?" FOREIGN KEY [(]"(.+?)"[)] REFERENCES "(.+?)" [(]"(.+?)"[)]', '');
		$collection = explode("\n", str_replace("\x0D", '', $sql));
		foreach ($collection as $key => $value) {
			if ($reFK->match($value)) {
				$value1 = $reFK->matched(1);
				$value2 = $reFK->matched(2);
				$r[] = (object)([
                    'key' => $value1,
                    'parentTable' => $value2,
                    'parentKey' => $reFK->matched(3),
                ]);
			}
		}

		return $r;
	}

	/**
	 * @return mixed
	 */
	public function getTables()
    {
		$rows = $this->query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name");
		return array_map(static function ($row) {
			return $row['name'];
		}, $rows->results());
	}

	/**
	 * @param string $table
	 * 
	 * @return mixed
	 */
	public function getUniques($table)
    {
		$this1 = [];
		$r = $this1;
		$sql = $this->query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" . $table . "'")->getResult(0);
		$reUNIQUE = new EReg('^CONSTRAINT ".+?" UNIQUE [(](.+?)[)]', '');
		$collection = explode("\n", str_replace("\x0D", '', $sql));
		foreach ($collection as $key => $value) {
			if ($reUNIQUE->match($value)) {
				$fields = $reUNIQUE->matched(1);
				$r[] = array_map(static function ($s) {
                    $s = trim($s);
                    if ((strncmp($s, '"', 1) === 0) && (substr($s, -mb_strlen('"')) === '"')) {
                        $s = mb_substr($s, 1, -1);
                    }
                    return $s;
                }, explode(',', $fields));
			}
		}

		return $r;
	}

	/**
	 * @param string $table
	 * @param string $field
	 * 
	 * @return bool
	 */
	public function isAutoincrement($table, $field)
    {
		$sql = $this->query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" . $table . "'")->getResult(0);
		$inner = new EReg("[(]((?:.|\x0D|\n)*)[)]", 'm');
		if (!$inner->match($sql)) {
			throw new \Exception('Unhandled syntax of "sqlite_master" for table "' . $table . '".');
		}
		$statement = trim($inner->matched(1));
		$fields = explode(',', $statement);
		$delim = "\\[\\]\"'`";
		$named = array_filter($fields, static function ($fld)  use (&$delim, &$field) {
			$fld = explode(' ', trim($fld))[0];
			$reg = '[' . $delim . ']?' . $field . '[' . $delim . ']?';
			$fld_reg = new EReg($reg, 'gm');
			$matching = $fld_reg->match($fld);
			$without_delim_word = mb_strlen($fld) === mb_strlen($field);
			$with_delim_word = mb_strlen($fld) === (mb_strlen($field) + 2);
			if ($matching) {
				if ($without_delim_word) {
					return true;
				}

                return $with_delim_word;
            } else {
				return false;
			}
		});
		if (\count($named) !== 1) {
			throw new \Exception('Unhandled syntax of "sqlite_master" for table "' . $table . '".');
		}
        return \in_array('AUTOINCREMENT', array_map(static function ($x) {
            return trim($x);
        }, explode(' ', $named[0])), false);
	}

	/**
	 * @return int
	 */
	public function lastInsertId () {
		return $this->connection->lastInsertId();
	}

	/**
	 * @param string $sql
	 * @return ResultSet
	 */
	public function query ($sql)
    {
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
}

