<?php

namespace nanodb\orm;

use \nanodb\orm\EntityDeserializationException;

class FieldDeserializer
{
	private $data;
	private $field;

	private $optional = false;
	private $defaultValue;

	private $checkRange = false;
	private $rangeMin;
	private $rangeMax;

	private function isReturnDefault() : bool
    {
		if (!array_key_exists($this->field, $this->data)) {
			if ($this->optional) return true;
			throw new EntityDeserializationException("Field [" . $this->field . "] is required", '__fromJson');
		}

		if ($this->data[$this->field] === null) {
            if ($this->optional) return true;
            throw new EntityDeserializationException("Null is not allowed for field [" . $this->field . "]", '__fromJson');

        }
		return false;
    }

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
		if ($this->isReturnDefault()) return $this->defaultValue;
        return $this->data[$this->field];
	}

	function asString() : ?string
	{
		if ($this->isReturnDefault()) return $this->defaultValue;

		$v = $this->data[$this->field];
		if (!is_string($v)) throw new EntityDeserializationException("String is expected for field [" . $this->field . "]", '__fromJson');
        return $v;
	}

	function asInt() : ?int
	{
		if ($this->isReturnDefault()) return $this->defaultValue;

		$v = $this->data[$this->field];

		if (!is_int($v)) {
            if (!is_string($v) || !ctype_digit($v)) throw new EntityDeserializationException("Integer is expected for field [" . $this->field . "]", '__fromJson');
            $v = (int)$v;
        }

        if ($this->checkRange && ($v < $this->rangeMin || $v > $this->rangeMax)) throw new EntityDeserializationException("Value out of allowed range " . $this->rangeMin . ".." . $this->rangeMax . " for field [" . $this->field . "]", '__fromJson');

        return $v;
	}

	function asFloat() : ?float
	{
		if ($this->isReturnDefault()) return $this->defaultValue;

		$v = $this->data[$this->field];

		if (!is_float($v)) {
            if (!is_string($v) || !is_numeric($v)) throw new EntityDeserializationException("Float is expected for field [" . $this->field . "]", '__fromJson');
            $v = (float)$v;
        }

        if ($this->checkRange && ($v < $this->rangeMin || $v > $this->rangeMax)) throw new EntityDeserializationException("Value out of allowed range (" . $this->rangeMin . ".." . $this->rangeMax . ") for field [" . $this->field . "]", '__fromJson');

        return $v;
	}

	function asDateTime() : ?\DateTime
	{
		if ($this->isReturnDefault()) return $this->defaultValue;

		$v = $this->data[$this->field];

		try {
            if (is_numeric($v)) {
                $dt = new \DateTime();
                $dt->setTimestamp($v);
                return $dt;
            }

            if (is_string($v)) {
                return new \DateTime($v);
            }
        }
		catch (\Exception $e) {}

        throw new EntityDeserializationException("Date/time is expected for field [" . $this->field . "]", '__fromJson');
	}

	function asArray() : ?array
	{
		if ($this->isReturnDefault()) return $this->defaultValue;

		$v = $this->data[$this->field];
        if (!is_array($v)) throw new EntityDeserializationException("Array is expected for field [" . $this->field . "]", '__fromJson');
		return (array)$v;
	}

	/**
	 * Ensure about array and call $convert for each item, wrapped into FieldDeserializer.
	 * @param callable $convert This function must receive one FieldDeserializer argument and return result value.
	 * @return array
	 */
	function asArrayOf(callable $convert) : ?array
	{
		if ($this->isReturnDefault()) return $this->defaultValue;

		$v = $this->asArray();
		try {
            for ($i=0; $i < count($v); $i++) {
                $v[$i] = $convert(self::fromValue($v[$i]));
            }
        }
        catch (EntityDeserializationException $e)
        {
            throw new EntityDeserializationException("Array of integers is expected for field [" . $this->field . "]", '__fromJson');
        }
        return $v;
	}

	function asArrayOfInt() : ?array
	{
		return $this->asArrayOf(function(FieldDeserializer $fd) {
		    return $fd->asInt();
		});
	}

	function asArrayOfFloat() : ?array
	{
		return $this->asArrayOf(function(FieldDeserializer $fd) { return $fd->asFloat(); });
	}

	function asArrayOfString() : ?array
	{
		return $this->asArrayOf(function(FieldDeserializer $fd) { return $fd->asFloat(); });
	}

	function asArrayOfDateTime() : ?array
	{
		return $this->asArrayOf(function(FieldDeserializer $fd) { return $fd->asDateTime(); });
	}

	static function fromValue($value) : FieldDeserializer
    {
        return new FieldDeserializer(["value" => $value], "value");
    }

    /**
     * Returns null if $str is null.
     * @param string $str
     * @param string $delimiter
     * @return int[]
     */
    static function stringToArrayOfInt(string $str, string $delimiter) : array
    {
        if ($str === null) return null;
        if ($str === "") return [];
        return self::fromValue(explode($delimiter, $str))->asArrayOfInt();
    }

    /**
     * Returns null if $str is null.
     * @param string $str
     * @param string $delimiter
     * @return float[]
     */
    static function stringToArrayOfFloat(string $str, string $delimiter) : array
    {
        if ($str === null) return null;
        if ($str === "") return [];
        return self::fromValue(explode($delimiter, $str))->asArrayOfFloat();
    }

    /**
     * Returns null if $str is null.
     * @param string $str
     * @param string $delimiter
     * @return \DateTime[]
     */
    static function stringToArrayOfDateTime(string $str, string $delimiter) : array
    {
        if ($str === null) return null;
        if ($str === "") return [];
        return self::fromValue(explode($delimiter, $str))->asArrayOfDateTime();
    }

    /**
     * Returns null if $str is null.
     * @param string $str
     * @param string $delimiter
     * @return string[]
     */
    static function stringToArrayOfString(string $str, string $delimiter) : array
    {
        if ($str === null) return null;
        if ($str === "") return [];
        return self::fromValue(explode($delimiter, $str))->asArrayOfString();
    }
}
