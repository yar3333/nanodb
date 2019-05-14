<?php

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

	function __construct(array $data, string $property)
	{
		$this->data = $data;
		$this->property = $property;
	}

	function optional($defaultValue) : self
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

	function asMixedOrNull()
	{
        if (array_key_exists($this->property, $this->data) && $this->data[$this->property] === null) return null;
        return $this->asMixed();
    }

	function asMixed()
	{
		if (!array_key_exists($this->property, $this->data)) {
			if ($this->optional) return $this->defaultValue;
			throw new EntityDeserializationException("Field [" . $this->property . "] is required", '__fromJson');
		}

		$v = $this->data[$this->property];
		if ($v === null) {
		    if ($this->optional) return $this->defaultValue;
            throw new EntityDeserializationException("Null is not allowed for field [" . $this->property . "]", '__fromJson');
        }

        return $v;
	}

	function asStringOrNull() : ?string
	{
        if (array_key_exists($this->property, $this->data) && $this->data[$this->property] === null) return null;
        return $this->asString();
    }

	function asString() : string
	{
		if (!array_key_exists($this->property, $this->data)) {
			if ($this->optional) return $this->defaultValue;
			throw new EntityDeserializationException("Field [" . $this->property . "] is required", '__fromJson');
		}

		$v = $this->data[$this->property];
		if ($v === null) {
		    if ($this->optional) return $this->defaultValue;
            throw new EntityDeserializationException("Null is not allowed for field [" . $this->property . "]", '__fromJson');
        }
		if (!is_string($v)) throw new EntityDeserializationException("String is expected for field [" . $this->property . "]", '__fromJson');
        return $v;
	}

	function asIntOrNull() : ?int
	{
        if (array_key_exists($this->property, $this->data) && $this->data[$this->property] === null) return null;
        return $this->asInt();
    }

	function asInt() : int
	{
		if (!array_key_exists($this->property, $this->data)) {
			if ($this->optional) return $this->defaultValue;
			throw new EntityDeserializationException("Field [" . $this->property . "] is required", '__fromJson');
		}

		$v = $this->data[$this->property];
		if ($v === null) {
		    if ($this->optional) return $this->defaultValue;
            throw new EntityDeserializationException("Null is not allowed for field [" . $this->property . "]", '__fromJson');
        }
		if (!is_numeric($v) || !ctype_digit($v)) throw new EntityDeserializationException("Integer is expected for field [" . $this->property . "]", '__fromJson');
        $f = (float)$v;
        if ($f < PHP_INT_MIN || $f > PHP_INT_MAX) throw new EntityDeserializationException("Value out of integer range for field [" . $this->property . "]", '__fromJson');

        $i = (int)$v;
        if ($this->checkRange && ($i < $this->rangeMin || $i > $this->rangeMax)) throw new EntityDeserializationException("Value out of alolowed range (" . $this->rangeMin . ".." . $this->rangeMax . ") for field [" . $this->property . "]", '__fromJson');

        return $i;
	}

	function asFloatOrNull() : ?float
	{
        if (array_key_exists($this->property, $this->data) && $this->data[$this->property] === null) return null;
        return $this->asFloat();
    }

	function asFloat() : float
	{
		if (!array_key_exists($this->property, $this->data)) {
			if ($this->optional) return $this->defaultValue;
			throw new EntityDeserializationException("Field [" . $this->property . "] is required", '__fromJson');
		}

		$v = $this->data[$this->property];
		if ($v === null) {
		    if ($this->optional) return $this->defaultValue;
		    throw new EntityDeserializationException("Null is not allowed for field [" . $this->property . "]", '__fromJson');
        }
		if (!is_numeric($v)) throw new EntityDeserializationException("Float is expected for field [" . $this->property . "]", '__fromJson');

		$f =  (float)$v;
        if ($this->checkRange && ($f < $this->rangeMin || $f > $this->rangeMax)) throw new EntityDeserializationException("Value out of alolowed range (" . $this->rangeMin . ".." . $this->rangeMax . ") for field [" . $this->property . "]", '__fromJson');

        return $f;
	}

	function asDateTimeOrNull() : ?\DateTime
	{
        if (array_key_exists($this->property, $this->data) && $this->data[$this->property] === null) return null;
        return $this->asDateTime();
    }

	function asDateTime() : \DateTime
	{
		if (!array_key_exists($this->property, $this->data)) {
			if ($this->optional) return $this->defaultValue;
			throw new EntityDeserializationException("Field [" . $this->property . "] is required", '__fromJson');
		}

		$v = $this->data[$this->property];
		if ($v === null) {
		    if ($this->optional) return $this->defaultValue;
		    throw new EntityDeserializationException("Null is not allowed for field [" . $this->property . "]", '__fromJson');
        }

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

        throw new EntityDeserializationException("Date/time is expected for field [" . $this->property . "]", '__fromJson');
	}
}
