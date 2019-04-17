<?php
/**
 * Generated by Haxe 4.0.0-rc.2+77068e10c
 */

namespace nanodb\sys\db;

use \nanodb\php\Boot;
use \nanodb\sys\db\Connection as DbConnection;
use \nanodb\sys\db\MysqlConnection as DbMysqlConnection;

class Mysql {
	/**
	 * @param object $params
	 * 
	 * @return DbConnection
	 */
	static public function connect ($params) {
		return new DbMysqlConnection($params);
	}
}

Boot::registerClass(Mysql::class, 'sys.db.Mysql');