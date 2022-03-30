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
     * @var ISerializer
     */
	protected $serializer;

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
	
	public function __construct(Db $db, ISerializer $serializer)
	{
		$this->db = $db;
		$this->serializer = $serializer;
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
	
	public function findManyIterator() : TypedIterator
	{
		return $this->getManyIterator($this->getSelectSql(null) . $this->getLimitAndOffsetSql());
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
			$sets[] = "`" . $key . "` = " . $this->quote($value);
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
		if ($fields) {
		    $fields = array_map(function($v) { return $v instanceof SqlText ? $v->text : $v; }, $fields);
        }
	    return "SELECT " . ($this->isDistinct ? "DISTINCT " : "") . ($fields !== null ? implode(", ", $fields) : "*") . "\nFROM `" . $this->table . "`" . $this->getWhereSql() . $this->getOrderBySql();
	}

	protected function getWhereSql() : string
	{
        return $this->conditions ? "\nWHERE " . implode("\n\tAND ", $this->conditions) : "";
	}

	public function orderAsc(string $field)
	{
		return $this->order("`$field`");
	}

	public function orderDesc(string $field)
	{
		return $this->order("`$field` DESC");
	}

	/**
	 * @param string $rawSqlText
	 * @return mixed
	 */
	public function order(string $rawSqlText)
	{
		$r = clone $this;
		$r->orderBys[] = $rawSqlText;
		return $r;
	}

    /**
     * @param string $rawSqlText
     * @param mixed[] $params
     * @return mixed
     */
	public function where(string $rawSqlText, array $params=null)
	{
	    if ($params !== null)
	    {
            /** @noinspection AlterInForeachInspection */
            foreach ($params as $k => &$v)
	        {
	            $v = $this->serializer->serializeValue($v);
            }
            $rawSqlText = $this->db->bind($rawSqlText, $params);
        }

		$r = clone $this;
		$r->conditions[] = '(' . $rawSqlText . ')';
		return $r;
	}

    /**
     * @return mixed
     */
	public function distinct()
    {
		$r = clone $this;
		$r->isDistinct = true;
		return $r;
    }
	
    /**
     * @param int $skip
     * @return mixed
     */
	public function skip(int $skip)
    {
		$r = clone $this;
		$r->skip = $skip;
		return $r;
    }
	
    /**
     * @param int $limit
     * @return mixed
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
     * @return mixed
     */
	public function whereField(string $field, string $op, $value)
	{
		$opUC = strtoupper(trim($op));
		
		if ($opUC === "!=" || $opUC === "<>")
		{
			if ($value === null) return $this->where("`" . $field . "` IS NOT NULL");
			else                 return $this->where("`" . $field . "` != " . $this->quote($value));
		}
		
		if ($opUC === "=")
		{
			if ($value === null) return $this->where("`" . $field . "` IS NULL");
			else                 return $this->where("`" . $field . "` = " . $this->quote($value));
		}
		
		if ($opUC === "IN" || $opUC === "NOT IN")
		{
			$values = [];
			foreach ($value as $v)
			{
				$values[] = $this->quote($v);
			}
			return $this->where("`" . $field . "` " . $opUC . " (" . implode(", ", $values) . ")");
		}

		return $this->where("`" . $field . "` " . $op . " " . $this->quote($value));
	}

	protected function getOne(string $sql)
	{
		$resultSet = $this->db->query($sql . ' LIMIT 1');
		if (!$resultSet) throw DbException::errorOnQuery($sql, new \Exception('Query must return ResultSet.'));
		if (!$resultSet->hasNext()) return null;
		return $this->newFromDbRow($resultSet->next());
	}

	protected function getMany(string $sql) : array
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

	protected function getManyIterator(string $sql) : TypedIterator
    {
		$resultSet = $this->db->query($sql);
		if (!$resultSet) throw DbException::errorOnQuery($sql, new \Exception('Query must return ResultSet.'));
		return new TypedIterator($resultSet, function($row) { return $this->newFromDbRow($row); });
    }

	protected function quote($value)
    {
        return $this->db->quote($this->serializer->serializeValue($value));
    }

	abstract protected function newFromDbRow(array $row);
}
