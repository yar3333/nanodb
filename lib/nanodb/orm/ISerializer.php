<?php

namespace nanodb\orm;

interface ISerializer
{
   /**
     * @param object $src
     * @param string[] $properties
     * @return array
     */
	function serializeObject(object $src, array $properties=null) : array;

    /**
     * @param array $src
     * @param object $dest
     * @param string[] $properties
     */
	public function deserializeObject(array $src, object $dest, array $properties=null) : void;
}

