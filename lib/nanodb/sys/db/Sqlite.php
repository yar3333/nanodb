<?php

namespace nanodb\sys\db;

class Sqlite
{
	/**
	 * @param string $file
	 * @return Connection
	 */
	static public function open($file)
    {
		return new SQLiteConnection($file);
	}
}

