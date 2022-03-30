<?php

namespace nanodb\orm;

use \nanodb\sys\db\ResultSet;

interface DbDriver
{
	/**
	 * @return void
	 */
	function close();

	/**
	 * @param string $table
	 * @return mixed
	 */
	function getFields($table);

	/**
	 * @param string $table
	 * @return mixed
	 */
	function getForeignKeys($table);

	/**
	 * @return mixed
	 */
	function getTables();

	/**
	 * @param string $table
	 * @return mixed
	 */
	function getUniques($table);

	/**
	 * @return int
	 */
	function lastInsertId();

	/**
	 * @param string $sql
	 * @return ResultSet
	 */
	function query($sql);

	/**
	 * @param mixed $s
	 * @return string
	 */
	public function quote($s);
}

