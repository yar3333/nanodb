<?php

namespace nanodb\sys\db;

interface ResultSet
{
	/**
	 * @return void
	 */
	public function free();

	/**
	 * @return mixed
	 */
	public function getFieldsNames();

	/**
	 * @param int $n
	 * @return float
	 */
	public function getFloatResult($n);

	/**
	 * @param int $n
	 * @return int
	 */
	public function getIntResult($n);

	/**
	 * @param int $n
	 * @return string
	 */
	public function getResult($n);

	/**
	 * @return bool
	 */
	public function hasNext();

	/**
	 * @return mixed
	 */
	public function next();

	/**
	 * @return mixed
	 */
	public function results();
}
