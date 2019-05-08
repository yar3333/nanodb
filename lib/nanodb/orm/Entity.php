<?php

namespace nanodb\orm;

class Entity implements \JsonSerializable
{
    protected function serializeProperty(string $methodSuffix, array &$dest, string $property) : void
    {
        $method = $property . $methodSuffix;
        if (method_exists($this, $method)) $this->$method($dest, $property);
        else                               $dest[$property] = $this->$property;
    }

    protected function deserializeProperty(string $methodSuffix, array $src, string $property) : void
    {
        $method = $property . $methodSuffix;
		if (method_exists($this, $method)) $this->$method($src, $property);
		else                               $this->$property = $src[$property];
    }

    protected function serializePropertyIgnoreNull(array &$data, string $property) : void
    {
        if (isset($this->$property)) $data[$property] = $this->$property;
    }
    
    protected function deserializePropertyOptional(array $data, string $property, $defaultValue=null) : void
    {
        $this->$property = isset($data[$property]) ? $data[$property] : $defaultValue;
    }

    public function jsonSerialize(array $properties=null) : array
    {
        if (!isset($properties)) $properties = array_diff(array_keys(get_object_vars($this)), [ "db", "orm" ]);

        $data = [];
        foreach ($properties as $var) {
            $this->serializeProperty("__toJson", $data, $var);
        }
        return $data;
    }

    public function jsonDeserialize(array $data) : void
    {
		if (!isset($properties)) $properties = array_diff(array_keys(get_object_vars($this)), [ "db", "orm" ]);

		foreach ($properties as $var) {
            $this->deserializeProperty("__fromJson", $data, $var);
        }
    }

	public function dbSerialize(array $properties=null): array
    {
        if (!isset($properties)) $properties = array_keys(get_object_vars($this));

        $data = [];
        foreach ($properties as $var) {
			$this->serializeProperty("__toDb", $data, $var);
        }
        return $data;
    }

    public function dbDeserialize(array $data, array $properties=null) : void
    {
		if (!isset($properties)) $properties = array_keys(get_object_vars($this));
        
		foreach ($properties as $var) {
            $this->deserializeProperty("__fromDb", $data, $var);
        }
    }
}