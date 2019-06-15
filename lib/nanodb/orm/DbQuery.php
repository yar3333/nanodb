<?php
/** @noinspection ReturnTypeCanBeDeclaredInspection */

namespace nanodb\orm;

use nanodb\sys\db\ResultSet;

abstract class DbQuery
{
	/**
	 * @var Db
	 */
	protected $db;

	/**
	 * @var string
	 */
	protected $table;

	/**
	 * @var string[]
	 */
	private $conditions = [];

	/**
	 * @var string[]
	 */
	private $orderBys = [];

    /**
     * @var bool
     */
	private $isDistinct = false;

	/**
	 * @var int
	 */
	private $skip = null;
	
	/**
	 * @var int
	 */
	private $limit = null;
	
	/**
	 * @param string $table
	 * @param Db $db
	 */
	public function __construct(Db $db, string $table)
	{
		$this->db = $db;
		$this->table = $table;
	}

	public function count() : int
	{
		$r = $this->db->query("SELECT COUNT(*) FROM `" . $this->table . "`" . $this->getWhereSql());
		if (!$r->hasNext()) return 0;
		return $r->getIntResult(0);
	}

	public function delete() : void
	{
		$this->db->query("DELETE FROM `" . $this->table . "`" . $this->getWhereSql() . $this->getLimitAndOffsetSql());
	}

	public function exists() : bool
	{
		return $this->findOneFields([SqlText::raw("1")]) !== null;
	}

	public function findMany() : array
	{
		return $this->getMany($this->getSelectSql(null) . $this->getLimitAndOffsetSql());
	}

	public function findManyFields(array $fields) : ResultSet
	{
		return $this->db->query($this->getSelectSql($fields) . $this->getLimitAndOffsetSql());
	}

	public function findOne()
	{
		return $this->getOne($this->getSelectSql(null));
	}

	public function findOneFields(?array $fields) : ?array
	{
		$rr = $this->db->query($this->getSelectSql($fields) . "\nLIMIT 1");
		if ($rr->hasNext()) {
			return $rr->next();
		}
		return null;
	}

	public function update(array $fields) : void
	{
		$sets = [];
		foreach ($fields as $key => $value)
		{
			$sets[] = "`" . $key . "` = " . $this->db->quote($value);
		}
		$this->db->query("UPDATE `" . $this->table . "`\nSET\n\t" . implode("\n\t", $sets) . $this->getWhereSql() . $this->getLimitAndOffsetSql());
	}

	protected function getLimitAndOffsetSql() : string
	{
		return ($this->limit !== null ? "\nLIMIT " . $this->limit : "") . ($this->skip ? "\nOFFSET " . $this->skip : "");
	}

	protected function getOrderBySql() : string
	{
		return $this->orderBys ? "\nORDER BY " . implode(", ", $this->orderBys) : "";
	}

	protected function getSelectSql(?array $fields) : string
	{
		$f = ($fields !== null ? array_map(function($x) { return $this->db->quote($x); }, $fields) : ["*"]);
		return "SELECT " . ($this->isDistinct ? "DISTINCT " : "") . implode(", ", $f) . "\nFROM `" . $this->table . "`" . $this->getWhereSql() . $this->getOrderBySql();
	}

	/**
	 * @return string
	 */
	protected function getWhereSql() : string
	{
        return $this->conditions ? "\nWHERE " . implode("\n\tAND ", $this->conditions) : "";
	}

	/**
	 * @param string $rawSqlText
	 * @return static
	 */
	public function orderAsc(string $rawSqlText)
	{
		$r = clone $this;
		$r->orderBys[] = $rawSqlText;
		return $r;
	}

	/**
	 * @param string $rawSqlText
	 * @return static
	 */
	public function orderDesc(string $rawSqlText)
	{
		$r = clone $this;
		$r->orderBys[] = $rawSqlText . " DESC";
		return $r;
	}

    /**
     * @param string $rawSqlText
     * @return static
     */
	public function where(string $rawSqlText)
	{
		$r = clone $this;
		$r->conditions[] = $rawSqlText;
		return $r;
	}

    /**
     * @return static
     */
	public function distinct()
    {
		$r = clone $this;
		$r->isDistinct = true;
		return $r;
    }
	
    /**
     * @param int $skip
     * @return static
     */
	public function skip(int $skip)
    {
		$r = clone $this;
		$r->skip = $skip;
		return $r;
    }
	
    /**
     * @param int $limit
     * @return static
     */
	public function limit(int $limit)
    {
		$r = clone $this;
		$r->limit = $limit;
		return $r;
    }

    /**
     * @param string $field
     * @param string $op
     * @param $value
     * @return static
     */
	public function whereField(string $field, string $op, $value)
	{
		$opUC = trim(strtoupper($op), null);
		
		if ($opUC === "!=" || $opUC === "<>")
		{
			if ($value === null) return $this->where("`" . $field . "` IS NOT NULL");
			else                 return $this->where("`" . $field . "` != " . $this->db->quote($value));
		}
		
		if ($opUC === "=")
		{
			if ($value === null) return $this->where("`" . $field . "` IS NULL");
			else                 return $this->where("`" . $field . "` = " . $this->db->quote($value));
		}
		
		if ($opUC === "IN" || $opUC === "NOT IN")
		{
			$values = [];
			foreach ($value as $v)
			{
				$values[] = $this->db->quote($v);
			}
			return $this->where("`" . $field . "` " . $opUC . " (" . implode(", ", $values) . ")");
		}

		return $this->where("`" . $field . "` " . $op . " " . $this->db->quote($value));
	}

	public function getOne(string $sql)
	{
		$resultSet = $this->db->query($sql . ' LIMIT 1');
		if (!$resultSet) throw DbException::errorOnQuery($sql, new \Exception('Query must return ResultSet.'));
		if (!$resultSet->hasNext()) return null;
		return $this->newFromDbRow($resultSet->next());
	}
    
	public function getMany(string $sql) : array
	{
		$resultSet = $this->db->query($sql);
		if (!$resultSet) throw DbException::errorOnQuery($sql, new \Exception('Query must return ResultSet.'));
		$r = [];
		/** @noinspection PhpAssignmentInConditionInspection */
		while ($row = $resultSet->next())
		{
			$r[] = $this->newFromDbRow($row);
		}
		return $r;
	}

	abstract protected function newFromDbRow(array $row);
}
