<?php

namespace nanodb\orm;

use \nanodb\orm\EntityDeserializationException;

class FieldDeserializer
{
	private $data;
	private $property;

	private $optional = false;
	private $defaultValue;

	private $checkRange = false;
	private $rangeMin;
	private $rangeMax;

	function __construct(array $data, string $field)
	{
		$this->data = $data;
		$this->field = $field;
	}

    /**
     * Value used if field not present or null.
     * @param mixed $defaultValue
     * @return FieldDeserializer
     */
	function optional($defaultValue=null) : self
	{
		$this->optional = true;
		$this->defaultValue = $defaultValue;
		return $this;
	}

	function checkRange(float $min, float $max) : self
	{
		$this->checkRange = true;
		$this->rangeMin = $min;
		$this->rangeMax = $max;
		return $this;
	}

	function asMixed()
	{
		if (!array_key_exists($this->property, $this->data)) {
			if ($this->optional) return $this->defaultValue;
			throw new EntityDeserializationException("Field [" . $this->field . "] is required", '__fromJson');
		}

		$v = $this->data[$this->property];
		if ($v === null) {
		    if ($this->optional) return $this->defaultValue;
            throw new EntityDeserializationException("Null is not allowed for field [" . $this->field . "]", '__fromJson');
        }

        return $v;
	}

	function asString() : string
	{
        $v = $this->asMixed();
		if ($this->optional && ($v === null || !array_key_exists($this->property, $this->data))) return $this->defaultValue;

		if (!is_string($v)) throw new EntityDeserializationException("String is expected for field [" . $this->field . "]", '__fromJson');

        return $v;
	}

	function asInt() : int
	{
        $v = $this->asMixed();
		if ($this->optional && ($v === null || !array_key_exists($this->property, $this->data))) return $this->defaultValue;

		if (!is_numeric($v) || !ctype_digit($v)) throw new EntityDeserializationException("Integer is expected for field [" . $this->field . "]", '__fromJson');

        $f = (float)$v;
        if ($f < PHP_INT_MIN || $f > PHP_INT_MAX) throw new EntityDeserializationException("Value out of integer range for field [" . $this->field . "]", '__fromJson');

        $i = (int)$v;
        if ($this->checkRange && ($i < $this->rangeMin || $i > $this->rangeMax)) throw new EntityDeserializationException("Value out of allowed range " . $this->rangeMin . ".." . $this->rangeMax . " for field [" . $this->field . "]", '__fromJson');

        return $i;
	}

	function asFloat() : float
	{
        $v = $this->asMixed();
		if ($this->optional && ($v === null || !array_key_exists($this->property, $this->data))) return $this->defaultValue;

		if (!is_numeric($v)) throw new EntityDeserializationException("Float is expected for field [" . $this->field . "]", '__fromJson');

		$f =  (float)$v;
        if ($this->checkRange && ($f < $this->rangeMin || $f > $this->rangeMax)) throw new EntityDeserializationException("Value out of alolowed range (" . $this->rangeMin . ".." . $this->rangeMax . ") for field [" . $this->field . "]", '__fromJson');

        return $f;
	}

	function asDateTime() : \DateTime
	{
        $v = $this->asMixed();
		if ($this->optional && ($v === null || !array_key_exists($this->property, $this->data))) return $this->defaultValue;

		try
        {
            if (is_numeric($v))
            {
                $dt = new \DateTime();
                $dt->setTimestamp($v);
                return $dt;
            }

            if (is_string($v))
            {
                return new \DateTime($v);
            }
        }
		catch (\Exception $e) {}

        throw new EntityDeserializationException("Date/time is expected for field [" . $this->field . "]", '__fromJson');
	}

	function asArray() : array
	{
        $v = $this->asMixed();
		if ($this->optional && ($v === null || !array_key_exists($this->property, $this->data))) return $this->defaultValue;

        if (!is_array($v)) throw new EntityDeserializationException("Array is expected for field [" . $this->field . "]", '__fromJson');

		return (array)$v;
	}
}
