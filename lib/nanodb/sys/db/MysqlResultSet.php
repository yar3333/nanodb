<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\sys\db;

use \nanodb\php\_Boot\HxAnon;
use \nanodb\php\Boot;
use \nanodb\sys\db\ResultSet as DbResultSet;

class MysqlResultSet implements DbResultSet {
	/**
	 * @var mixed
	 */
	public $fetchedRow;
	/**
	 * @var mixed
	 */
	public $fieldsInfo;
	/**
	 * @var int
	 */
	public $length;
	/**
	 * @var int
	 */
	public $nfields;
	/**
	 * @var \Myslqi_result
	 */
	public $result;

	/**
	 * @param \Myslqi_result $result
	 * 
	 * @return void
	 */
	public function __construct ($result) {
		$this->result = $result;
	}

	/**
	 * @param mixed $row
	 * 
	 * @return void
	 */
	public function correctArrayTypes ($row) {
		$_gthis = $this;
		$_gthis1 = $this;
		if ($this->fieldsInfo === null) {
			$this->fieldsInfo = [];
			$collection = $this->result->fetch_fields();
			foreach ($collection as $key => $value) {
				$_gthis1->fieldsInfo[$value->name] = $value;
			}

		}
		$fieldsInfo = $this->fieldsInfo;
		foreach ($row as $key1 => $value1) {
			$row[$key1] = $_gthis->correctType($value1, $fieldsInfo[$key1]->type);
		}
	}

	/**
	 * @param string $value
	 * @param int $type
	 * 
	 * @return mixed
	 */
	public function correctType ($value, $type) {
		if ($value === null) {
			return null;
		}
		if (($type === MYSQLI_TYPE_BIT) || ($type === MYSQLI_TYPE_TINY) || ($type === MYSQLI_TYPE_SHORT) || ($type === MYSQLI_TYPE_LONG) || ($type === MYSQLI_TYPE_INT24) || ($type === MYSQLI_TYPE_CHAR)) {
			return (int)($value);
		}
		if (($type === MYSQLI_TYPE_DECIMAL) || ($type === MYSQLI_TYPE_NEWDECIMAL) || ($type === MYSQLI_TYPE_FLOAT) || ($type === MYSQLI_TYPE_DOUBLE)) {
			return (float)($value);
		}
		return $value;
	}

	/**
	 * @return void
	 */
	public function fetchNext () {
		$row = $this->result->fetch_assoc();
		if ($row !== null) {
			$this->correctArrayTypes($row);
			$this->fetchedRow = $row;
		}
	}

	/**
	 * @return mixed
	 */
	public function getFieldsInfo () {
		$_gthis = $this;
		if ($this->fieldsInfo === null) {
			$this->fieldsInfo = [];
			$collection = $this->result->fetch_fields();
			foreach ($collection as $key => $value) {
				$_gthis->fieldsInfo[$value->name] = $value;
			}

		}
		return $this->fieldsInfo;
	}

	/**
	 * @return mixed
	 */
	public function getFieldsNames () {
		$fields = $this->result->fetch_fields();
		return array_map(function ($x) {
			return $x->name;
		}, $fields);
	}

	/**
	 * @param int $n
	 * 
	 * @return float
	 */
	public function getFloatResult ($n) {
		return (float)($this->getResult($n));
	}

	/**
	 * @param int $n
	 * 
	 * @return int
	 */
	public function getIntResult ($n) {
		return (int)($this->getResult($n));
	}

	/**
	 * @param int $n
	 * 
	 * @return string
	 */
	public function getResult ($n) {
		if ($this->fetchedRow === null) {
			$this->fetchNext();
		}
		return array_values($this->fetchedRow)[$n];
	}

	/**
	 * @return int
	 */
	public function get_length () {
		return $this->result->num_rows;
	}

	/**
	 * @return int
	 */
	public function get_nfields () {
		return $this->result->field_count;
	}

	/**
	 * @return bool
	 */
	public function hasNext () {
		if ($this->fetchedRow === null) {
			$this->fetchNext();
		}
		return $this->fetchedRow !== null;
	}

	/**
	 * @return mixed
	 */
	public function next () {
		if ($this->fetchedRow === null) {
			$this->fetchNext();
		}
		return $this->withdrawFetched();
	}

	/**
	 * @return mixed
	 */
	public function results () {
		$this1 = [];
		$list = $this1;
		$this->result->data_seek(0);
		$row = $this->result->fetch_assoc();
		while ($row !== null) {
			$this->correctArrayTypes($row);
			array_push($list, $row);
			$row = $this->result->fetch_assoc();
		}
		return $list;
	}

	/**
	 * @return mixed
	 */
	public function withdrawFetched () {
		if ($this->fetchedRow === null) {
			return null;
		}
		$row = $this->fetchedRow;
		$this->fetchedRow = null;
		return new HxAnon($row);
	}
}

Boot::registerClass(MysqlResultSet::class, 'sys.db.MysqlResultSet');
Boot::registerGetters('nanodb\\sys\\db\\MysqlResultSet', [
	'nfields' => true,
	'length' => true
]);