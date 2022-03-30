<?php

namespace nanodb\sys\db;

use \nanodb\sys\db\ResultSet as DbResultSet;

interface Connection
{
	/**
	 * @return void
	 */
	public function close();

	/**
	 * @return void
	 */
	public function commit();

	/**
	 * @return string
	 */
	public function dbName();

	/**
	 * @param string $s
	 * @return string
	 */
	public function escape($s);

	/**
	 * @return int
	 */
	public function lastInsertId();

	/**
	 * @param string $s
	 * @return string
	 */
	public function quote($s);

	/**
	 * @param string $s
	 * @return DbResultSet
	 */
	public function request($s);

	/**
	 * @return void
	 */
	public function rollback();

	/**
	 * @return void
	 */
	public function startTransaction();
}
