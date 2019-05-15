<?php

namespace nanodb\orm;

class Entity implements \JsonSerializable
{
    /**
	 * param string $methodSuffix
	 * param array $dest
	 * param string $property
     * @throws EntityFieldNotFoundException
	 */
    private function serializeProperty(string $methodSuffix, array &$dest, string $property) : void
    {
        $method = $property . $methodSuffix;
        if (method_exists($this, $method)) $this->$method($dest, $property);
        else {
			$dest[$property] = $this->$property;
		}
    }

    /**
	 * param string $methodSuffix
	 * param string $src
	 * param string $property
     * @throws EntityFieldNotFoundException
	 */
	private function deserializeProperty(string $methodSuffix, array $src, string $property) : void
    {
        $method = $property . $methodSuffix;
		if (method_exists($this, $method)) $this->$method($src, $property);
		else
		{
			if (!array_key_exists($property, $src) || $methodSuffix === "__fromJson" && $src[$property] === null) throw new EntityDeserializationException("Field [" . $property . "] is required", $methodSuffix);
			$this->$property = $src[$property];
		}
    }
	
    protected function serializePropertyIgnoreNull(array &$data, string $property) : void
    {
        if (property_exists($this, $property)) $data[$property] = $this->$property;
    }
	
    public function jsonSerialize(array $properties=null) : array
    {
        if ($properties == null) $properties = array_diff(array_keys(get_object_vars($this)), [ "db", "orm" ]);

        $data = [];
        foreach ($properties as $var) {
            $this->serializeProperty("__toJson", $data, $var);
        }
        return $data;
    }

    public function jsonDeserialize(array $data, array $properties=null) : void
    {
		if ($properties == null) $properties = array_diff(array_keys(get_object_vars($this)), [ "db", "orm" ]);

		foreach ($properties as $var) {
            $this->deserializeProperty("__fromJson", $data, $var);
        }
    }

	public function dbSerialize(array $properties=null): array
    {
        if ($properties == null) $properties = array_keys(get_object_vars($this));

        $data = [];
        foreach ($properties as $var) {
			$this->serializeProperty("__toDb", $data, $var);
        }
        return $data;
    }

    public function dbDeserialize(array $data, array $properties=null) : void
    {
		if ($properties == null) $properties = array_keys(get_object_vars($this));
        
		foreach ($properties as $var) {
            $this->deserializeProperty("__fromDb", $data, $var);
        }
    }
}