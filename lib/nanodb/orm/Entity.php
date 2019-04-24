<?php

namespace nanodb\orm;

class Entity implements \JsonSerializable
{
    protected function serializeProperty(string $methodSuffix, string $property, array &$dest) : void
    {
        $method = $property . $methodSuffix;
        if (method_exists($this, $method)) $this->$method($dest, $property);
        else                               $dest[$property] = $this->$property;
    }

    protected function deserializeProperty(string $methodSuffix, string $property, array $src) : void
    {
        $method = $property . $methodSuffix;
        $this->$property = method_exists($this, $method) ? $this->$method($src[$property])
                                                         : $src[$property];
    }

    protected function serializePropertyIgnoreNull(&$data, $property) : void
    {
        if (isset($this->$property)) $data[$property] = $this->$property;
    }

    public function jsonSerialize() : array
    {
        $data = [];
        foreach (get_object_vars($this) as $var => $value) {
            $this->serializeProperty("__toJson", $var, $data);
        }
        return $data;
    }

    public function jsonDeserialize(array $data) : void
    {
        foreach (get_object_vars($this) as $var => $value) {
            $this->deserializeProperty("__fromJson", $var, $data);
        }
    }

	public function dbSerialize(array $properties=null): array
    {
		if (!$properties) $properties = array_keys(get_object_vars($this));
	
        $data = [];
        foreach ($properties as $var) {
			$this->serializeProperty("__toDb", $var, $data);
        }
        return $data;
    }

    public function dbDeserialize(array $data) : void
    {
        foreach (get_object_vars($this) as $var => $value) {
            $this->deserializeProperty("__fromDb", $var, $data);
        }
    }
}