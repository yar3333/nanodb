<?php

namespace nanodb\orm;

use nanodb\sys\db\ResultSet;

class TypedIterator implements \Iterator
{
    /**
     * @var ResultSet
     */
    protected $resultSet;

    /**
     * @var callable
     */
    protected $deserialize;

    /**
     * @var int
     */
    protected $position;

    /**
     * @var mixed
     */
    protected $item;

    /**
     * @var bool
     */
    protected $isValid;

    public function __construct(ResultSet $resultSet, callable $deserialize)
    {
        $this->resultSet = $resultSet;
        $this->deserialize = $deserialize;

        $this->position = -1;
        $this->next();
    }

    public function rewind() : void
    {
        if ($this->position != 0) throw new \RuntimeException("TypedIterator: rewind() unsupported.");
    }
    #[\ReturnTypeWillChange]
    public function current()
    {
        return $this->item;
    }

    public function key() : int
    {
        return $this->position;
    }

    public function next() : void
    {
        $this->isValid = $this->resultSet->hasNext();
        $this->item = $this->isValid ? ($this->deserialize)($this->resultSet->next()) : null;
        $this->position++;
    }

    public function valid() : bool
    {
        return $this->isValid;
    }
}