<?php

namespace nanodb\orm;

class Entity implements \JsonSerializable
{
    /**
     * @param array $dest
     * @param string $property
     * @param string $methodSuffix
     */
    private function serializePropertyViaMethod(array &$dest, string $property, string $methodSuffix) : void
    {
        $method = $property . $methodSuffix;
        if (method_exists($this, $method)) $this->$method($dest, $property);
        else 			                   $this->serializeProperty($dest, $property, $methodSuffix);
    }

    protected function serializeProperty(array &$dest, string $property, string $methodSuffix) : void
    {
        $dest[$property] = $this->serializeValue($this->$property, $methodSuffix);
    }

    /**
     * @param mixed $value
     * @param string $methodSuffix
     * @return mixed
     */
    function serializeValue($value, string $methodSuffix)
    {
    	if ((is_array($value) && array_keys($value) === range(0, count($value) - 1)) || $value instanceof \ArrayObject)
        {
            $r = [];
            foreach ($value as $item) {
                $r[] = $this->serializeValue($item, $methodSuffix);
            }
            return $r;
        }

    	if ($value instanceof Entity)
        {
            switch ($methodSuffix)
            {
                case "__toJson": return $value->jsonSerialize();
                case "__toDb": return $value->dbSerialize();
            }
        }

    	return $value;
    }

    /**
     * @param array|\ArrayObject $src
     * @param string $property
     * @param string $methodSuffix
     * @throws EntityDeserializationException
     */
    private function deserializePropertyViaMethod($src, string $property, string $methodSuffix) : void
    {
        $method = $property . $methodSuffix;
		if (method_exists($this, $method)) $this->$method($src, $property);
		else			                   $this->deserializeProperty($src, $property, $methodSuffix);
    }

    /**
     * @param array|\ArrayObject $src
     * @param string $property
     * @param string $methodSuffix
     * @throws EntityDeserializationException
     */
    protected function deserializeProperty($src, string $property, string $methodSuffix) : void
    {
        if (!array_key_exists($property, $src) || $methodSuffix === "__fromJson" && $src[$property] === null)
        {
            throw new EntityDeserializationException("Field [" . $property . "] is required", $methodSuffix);
        }
        $this->$property = $src[$property];
    }
	
    public function jsonSerialize(array $properties=null) : array
    {
        if ($properties === null) $properties = array_keys(get_object_vars($this));

        $data = [];
        foreach ($properties as $var) {
            $this->serializePropertyViaMethod($data, $var, "__toJson");
        }
        return $data;
    }

    public function jsonDeserialize(array $data, array $properties=null) : void
    {
		if ($properties === null) $properties = array_keys(get_object_vars($this));

		foreach ($properties as $var) {
            $this->deserializePropertyViaMethod($data, $var, "__fromJson");
        }
    }

	public function dbSerialize(array $properties=null): array
    {
        if ($properties === null) $properties = array_keys(get_object_vars($this));

        $data = [];
        foreach ($properties as $var) {
			$this->serializePropertyViaMethod($data, $var, "__toDb");
        }
        return $data;
    }

	/**
	 * @param array|\ArrayObject $data 
	 * @param array $properties 
     * @throws EntityDeserializationException
	 */
	public function dbDeserialize($data, array $properties=null) : void
    {
		if ($properties === null) $properties = array_keys(get_object_vars($this));
        
		foreach ($properties as $var) {
            $this->deserializePropertyViaMethod($data, $var, "__fromDb");
        }
    }
}