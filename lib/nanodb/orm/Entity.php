<?php

namespace nanodb\orm;

class Entity implements \JsonSerializable
{
    /**
     * @param array $dest
     * @param string $property
     * @param string $methodSuffix
     */
    private function serializeProperty(array &$dest, string $property, string $methodSuffix) : void
    {
        $method = $property . $methodSuffix;
        if (method_exists($this, $method)) $this->$method($dest, $property);
        else 			                   $this->serializePropertyDefault($dest, $property, $methodSuffix);
    }

    protected function serializePropertyDefault(array &$dest, string $property, string $methodSuffix) : void
    {
    	$dest[$property] = $this->$property;
    }

    /**
     * @param array $src
     * @param string $property
     * @param string $methodSuffix
     * @throws EntityDeserializationException
     */
    private function deserializeProperty(array $src, string $property, string $methodSuffix) : void
    {
        $method = $property . $methodSuffix;
		if (method_exists($this, $method)) $this->$method($src, $property);
		else			                   $this->deserializePropertyDefault($src, $property, $methodSuffix);
    }

    protected function deserializePropertyDefault(array $src, string $property, string $methodSuffix) : void
    {
        if (!array_key_exists($property, $src) || $methodSuffix === "__fromJson" && $src[$property] === null)
        {
            throw new EntityDeserializationException("Field [" . $property . "] is required", $methodSuffix);
        }
        $this->$property = $src[$property];
    }

    protected function serializePropertyIgnoreNull(array &$data, string $property) : void
    {
        if (property_exists($this, $property)) $data[$property] = $this->$property;
    }
	
    public function jsonSerialize(array $properties=null) : array
    {
        if ($properties === null) $properties = array_keys(get_object_vars($this));

        $data = [];
        foreach ($properties as $var) {
            $this->serializeProperty($data, $var, "__toJson");
        }
        return $data;
    }

    public function jsonDeserialize(array $data, array $properties=null) : void
    {
		if ($properties === null) $properties = array_keys(get_object_vars($this));

		foreach ($properties as $var) {
            $this->deserializeProperty($data, $var, "__fromJson");
        }
    }

	public function dbSerialize(array $properties=null): array
    {
        if ($properties === null) $properties = array_keys(get_object_vars($this));

        $data = [];
        foreach ($properties as $var) {
			$this->serializeProperty($data, $var, "__toDb");
        }
        return $data;
    }

    public function dbDeserialize(array $data, array $properties=null) : void
    {
		if ($properties === null) $properties = array_keys(get_object_vars($this));
        
		foreach ($properties as $var) {
            $this->deserializeProperty($data, $var, "__fromDb");
        }
    }
}