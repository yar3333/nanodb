<?php

namespace nanodb\sys\db;

class Sqlite
{
	/**
	 * @param string $file
	 * @return Connection
	 */
	public static function open($file)
    {
		return new SQLiteConnection($file);
	}
}

