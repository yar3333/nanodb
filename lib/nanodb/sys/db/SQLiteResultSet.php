<?php

namespace nanodb\sys\db;

class SQLiteResultSet implements ResultSet
{
    /**
     * @var int
     */
    public $currentIndex;

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
     * @var bool
     */
    public $loaded;

    /**
     * @var int
     */
    public $nfields;

    /**
     * @var \SQLite3Result
     */
    public $result;

    /**
     * @var mixed
     */
    public $rows;

    /**
     * @param \SQLite3Result $result
     */
    public function __construct($result)
    {
        $this->currentIndex = 0;
        $this->loaded = false;
        $this->nfields = 0;
        $this->length = 0;
        $this->result = $result;
    }

    /**
     * @param mixed $row
     * @return mixed
     */
    public function correctArrayTypes($row)
    {
        if ($this->fieldsInfo === null) {
            $this->fieldsInfo = [];
            $_g = 0;
            while ($_g < $this->nfields) {
                $i = $_g++;
                $key = $this->result->columnName($i);
                $val = $this->result->columnType($i);
                $this->fieldsInfo[$key] = $val;

            }

        }
        $fieldsInfo = $this->fieldsInfo;
        foreach ($row as $key1 => $value) {
            $row[$key1] = $this->correctType($value, $fieldsInfo[$key1]);
        }
        return $row;
    }

    /**
     * @param string $value
     * @param int $type
     * @return mixed
     */
    public function correctType($value, $type)
    {
        if ($value === null) return null;
        if ($type === SQLITE3_INTEGER) return (int)($value);
        if ($type === SQLITE3_FLOAT) return (float)($value);
        return $value;
    }

    /**
     * @return void
     */
    public function fetchAll()
    {
        $this->rows = [];
        $index = 0;
        $row = $this->result->fetchArray(SQLITE3_ASSOC);
        while ($row !== false) {
            $val = $this->correctArrayTypes($row);
            $this->rows[$index] = $val;

            $row = $this->result->fetchArray(SQLITE3_ASSOC);
            ++$index;
        }
        $this->length = $index;
    }

    /**
     * @return void
     */
    public function free()
    {
        $this->result->finalize();
    }

    /**
     * @return mixed
     */
    public function getFieldsInfo()
    {
        if ($this->fieldsInfo === null) {
            $this->fieldsInfo = [];
            $_g = 0;
            while ($_g < $this->nfields) {
                $i = $_g++;
                $key = $this->result->columnName($i);
                $val = $this->result->columnType($i);
                $this->fieldsInfo[$key] = $val;

            }

        }
        return $this->fieldsInfo;
    }

    /**
     * @return mixed
     */
    public function getFieldsNames()
    {
        if ($this->fieldsInfo === null) {
            $this->fieldsInfo = [];
            $_g = 0;
            while ($_g < $this->nfields) {
                $i = $_g++;
                $key = $this->result->columnName($i);
                $val = $this->result->columnType($i);
                $this->fieldsInfo[$key] = $val;

            }

        }
        $fieldsInfo = $this->fieldsInfo;
        return array_keys($fieldsInfo);
    }

    /**
     * @param int $n
     * @return float
     */
    public function getFloatResult($n)
    {
        return (float)($this->getResult($n));
    }

    /**
     * @param int $n
     * @return int
     */
    public function getIntResult($n)
    {
        return (int)($this->getResult($n));
    }

    /**
     * @param int $n
     * @return string
     */
    public function getResult($n)
    {
        if (!$this->loaded) $this->load();
        if (!$this->hasNext()) return null;
        return array_values($this->rows[$this->currentIndex])[$n];
    }

    /**
     * @return bool
     */
    public function hasNext()
    {
        if (!$this->loaded) $this->load();
        return $this->currentIndex < $this->length;
    }

    /**
     * @return void
     */
    public function load()
    {
        $this->loaded = true;
        $this->nfields = $this->result->numColumns();
        if ($this->fieldsInfo === null) {
            $this->fieldsInfo = [];
            $_g = 0;
            while ($_g < $this->nfields) {
                $i = $_g++;
                $key = $this->result->columnName($i);
                $val = $this->result->columnType($i);
                $this->fieldsInfo[$key] = $val;
            }
        }
        $this->fetchAll();
    }

    /**
     * @return mixed
     */
    public function next()
    {
        if (!$this->loaded) $this->load();

        $next = $this->rows[$this->currentIndex++];
        return $this->correctArrayTypes($next);
    }

    /**
     * @return mixed
     */
    public function results()
    {
        if (!$this->loaded) $this->load();

        $list = [];
        $collection = $this->rows;
        foreach ($collection as $key => $value) {
            array_push($list, $this->correctArrayTypes($value));
        }

        return $list;
    }
}

