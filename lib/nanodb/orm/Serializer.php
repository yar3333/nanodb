<?php

namespace nanodb\orm;

class Serializer implements ISerializer
{
	/**
	 * @param object $src
	 * @param string[] $properties
	 * @return array
	 */
	public function serializeObject(object $src, array $properties=null) : array
    {
		if ($properties === null) $properties = array_keys(get_object_vars($src));

		$r = [];
		foreach ($properties as $value) {
			$r[$value] = $src->$value;
		}
		return $r;
	}

	/**
	 * @param array $src
	 * @param object $dest
	 * @param string[] $properties
	 * 
	 * @return void
	 */
	public function deserializeObject(array $src, object $dest, array $properties=null) : void
    {
		if ($properties === null) $properties = array_keys(get_object_vars($dest));

		foreach ($properties as $value) {
			$dest->$value = $src[$value];
		}
	}

	public function serializeValue($value)
    {
        return $value;
    }
}

