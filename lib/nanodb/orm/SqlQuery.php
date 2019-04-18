<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\orm;

use \nanodb\orm\SqlTextField as OrmSqlTextField;
use \nanodb\orm\SqlTextRaw as OrmSqlTextRaw;
use \nanodb\orm\Db as OrmDb;
use \nanodb\sys\db\ResultSet;
use \nanodb\Std;

class SqlQuery {
	/**
	 * @var mixed
	 */
	public $conditions;
	/**
	 * @var OrmDb
	 */
	public $db;
	/**
	 * @var object
	 */
	public $manager;
	/**
	 * @var mixed
	 */
	public $orderBys;
	/**
	 * @var string
	 */
	public $table;

	/**
	 * @param string $table
	 * @param OrmDb $db
	 * @param object $manager
	 * 
	 * @return void
	 */
	public function __construct ($table, $db, $manager) {
		$this->orderBys = [];
		$this->conditions = [];
		$this->table = $table;
		$this->db = $db;
		$this->manager = $manager;
	}

	/**
	 * @return int
	 */
	public function count () {
		$r = $this->db->query("SELECT COUNT(*) FROM `" . $this->table . "`" . ($this->getWhereSql()??'null'));
		if (!$r->hasNext()) {
			return 0;
		}
		return $r->getIntResult(0);
	}

	/**
	 * @param int $limit
	 * @param int $offset
	 * 
	 * @return void
	 */
	public function delete ($limit = null, $offset = null) {
		$this->db->query("DELETE FROM `" . $this->table . "`" . ($this->getWhereSql()??'null') . ($this->getLimitSql($limit)??'null') . ($this->getOffsetSql($offset)??'null'));
	}

	/**
	 * @return bool
	 */
	public function exists () {
		return $this->findOneFields([$this->db->sqlTextRaw("1")]) !== null;
	}

	/**
	 * @param int $limit
	 * @param int $offset
	 * 
	 * @return mixed
	 */
	public function findMany (int $limit = null, int $offset = null) : array {
		$sqlSelect = $this->getSelectSql(null);
		$sqlLimit = $this->getLimitSql($limit);
		$sqlOffset = $this->getOffsetSql($offset);
		return $this->manager->getBySqlMany($sqlSelect . $sqlLimit . $sqlOffset);
	}

	/**
	 * @param mixed $fields
	 * @param int $limit
	 * @param int $offset
	 * 
	 * @return ResultSet
	 */
	public function findManyFields ($fields, $limit = null, $offset = null) {
		return $this->db->query(($this->getSelectSql($fields)??'null') . ($this->getLimitSql($limit)??'null') . ($this->getOffsetSql($offset)??'null'));
	}

	/**
	 * @return mixed
	 */
	public function findOne () {
		return $this->manager->getBySqlOne($this->getSelectSql(null));
	}

	/**
	 * @param mixed $fields
	 * 
	 * @return mixed
	 */
	public function findOneFields ($fields) {
		$rr = $this->db->query(($this->getSelectSql($fields)??'null') . "\x0ALIMIT 1");
		if ($rr->hasNext()) {
			return $rr->next();
		}
		return null;
	}

	/**
	 * @param int $limit
	 * 
	 * @return string
	 */
	public function getLimitSql ($limit) {
		if ($limit !== null) {
			return "\x0ALIMIT " . $limit;
		} else {
			return "";
		}
	}

	/**
	 * @param int $offset
	 * 
	 * @return string
	 */
	public function getOffsetSql ($offset) {
		if ($offset !== null) {
			return "\x0AOFFSET " . $offset;
		} else {
			return "";
		}
	}

	/**
	 * @return string
	 */
	public function getOrderBySql () {
		if (count($this->orderBys) > 0) {
			return "\x0AORDER BY " . (implode(", ", $this->orderBys)??'null');
		} else {
			return "";
		}
	}

	/**
	 * @param mixed $fields
	 * 
	 * @return string
	 */
	public function getSelectSql ($fields) {
		$_gthis = $this;
		$f = ($fields !== null ? array_map(function ($x)  use (&$_gthis) {
			return $_gthis->quoteField($x);
		}, $fields) : ["*"]);
		return "SELECT " . (implode(", ", $f)??'null') . "\x0AFROM `" . $this->table . "`" . ($this->getWhereSql()??'null') . ($this->getOrderBySql()??'null');
	}

	/**
	 * @return string
	 */
	public function getWhereSql () {
		if (count($this->conditions) > 0) {
			return "\x0AWHERE " . (implode("\x0A\x09AND ", $this->conditions)??'null');
		} else {
			return "";
		}
	}

	/**
	 * @param mixed $value
	 * 
	 * @return SqlQuery
	 */
	public function orderAsc ($value) {
		array_push($this->orderBys, $this->quoteValue($value));
		return $this;
	}

	/**
	 * @param mixed $value
	 * 
	 * @return SqlQuery
	 */
	public function orderDesc ($value) {
		array_push($this->orderBys, $this->quoteValue($value) . " DESC");
		return $this;
	}

	/**
	 * @param mixed $v
	 * 
	 * @return string
	 */
	public function quoteField ($v) {
		if (($v instanceof OrmSqlTextRaw)) {
			return $v->text;
		}
		if (($v instanceof OrmSqlTextField)) {
			return "`" . $v->text . "`";
		}
		return "`" . (Std::string($v)??'null') . "`";
	}

	/**
	 * @param mixed $v
	 * 
	 * @return string
	 */
	public function quoteValue ($v) {
		$_gthis = $this;
		if (($v instanceof OrmSqlTextRaw)) {
			return $v->text;
		}
		if (($v instanceof OrmSqlTextField)) {
			return "`" . $v->text . "`";
		}
		if (is_array($v)) {
			return "(" . (implode(", ", array_map(function ($x)  use (&$_gthis) {
				return $_gthis->db->quote($x);
			}, $v))??'null') . ")";
		}
		return $this->db->quote($v);
	}

	/**
	 * @param mixed $fields
	 * @param int $limit
	 * @param int $offset
	 * 
	 * @return void
	 */
	public function update ($fields, $limit = null, $offset = null) {
		$_gthis = $this;
		$sets = [];
		foreach ($fields as $key => $value) {
			array_push($sets, "`" . $key . "` = " . ($_gthis->quoteValue($value)??'null'));
		}
		$this->db->query("UPDATE `" . $this->table . "`\x0ASET\x0A\x09" . (implode("\x0A\x09", $sets)??'null') . ($this->getWhereSql()??'null') . ($this->getLimitSql($limit)??'null') . ($this->getOffsetSql($offset)??'null'));
	}

	/**
	 * @param string $rawSqlText
	 * 
	 * @return SqlQuery
	 */
	public function where (string $rawSqlText) {
		array_push($this->conditions, $rawSqlText);
		return $this;
	}

	/**
	 * @param string $field
	 * @param string $op
	 * @param mixed $value
	 * 
	 * @return SqlQuery
	 */
	public function whereField (string $field, string $op, $value) {
		array_push($this->conditions, "`" . $field . "` " . $op . " " . $this->quoteValue($value));
		return $this;
	}
}

