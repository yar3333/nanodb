<?php

namespace nanodb\sys\db;

use \nanodb\sys\db\Connection as DbConnection;
use \nanodb\sys\db\MysqlConnection as DbMysqlConnection;

class Mysql
{
	/**
	 * @param object $params
	 * @return DbConnection
	 */
	public static function connect($params)
    {
		return new DbMysqlConnection($params);
	}
}
