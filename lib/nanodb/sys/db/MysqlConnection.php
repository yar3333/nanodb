<?php

namespace nanodb\sys\db;

class MysqlConnection implements Connection
{
    private const DEFAULT_CONNECTION_TIMEOUT = 30;
	/**
	 * @var \Mysqli
	 */
	public $db;

	/**
	 * @param object $params
	 */
	public function __construct ($params)
    {
		if ($params->port === null) $params->port = (int)ini_get("mysqli.default_port");
		if ($params->socket === null) $params->socket = ini_get("mysqli.default_socket");
		if ($params->database === null) $params->database = "";

        $this->db = new \Mysqli();
        $this->db->options(MYSQLI_OPT_CONNECT_TIMEOUT, $params->connection_timeout ?? self::DEFAULT_CONNECTION_TIMEOUT);
        $this->db->connect($params->host, $params->user, $params->pass, $params->database, $params->port, $params->socket);
	}

	/**
	 * @return void
	 */
	public function close()
    {
		$this->db->close();
	}

	/**
	 * @return void
	 */
	public function commit()
    {
		$success = $this->db->commit();
		if (!$success) {
			throw new \Exception("Failed to commit transaction: " . $this->db->error);
		}
	}

	/**
	 * @return string
	 */
	public function dbName()
    {
		return "MySQL";
	}

	/**
	 * @param string $s
	 * @return string
	 */
	public function escape($s)
    {
		return $this->db->escape_string($s);
	}

	/**
	 * @return int
	 */
	public function lastInsertId()
    {
		return $this->db->insert_id;
	}

	/**
	 * @param string $s
	 * @return string
	 */
	public function quote($s)
    {
		if ((mb_strpos($s, "\x00") !== false)) {
			return "x'" . bin2hex($s) . "'";
		}
		return "'" . $this->db->escape_string($s) . "'";
	}

	/**
	 * @param string $s
	 * @param int $mode
	 * @return ResultSet
	 */
	public function request($s, $mode = null)
    {
		$result = $this->db->query($s, $mode);
		if ($result === false) throw new \Exception("Failed to perform db query: " . $this->db->error);
		if ($result === true) return null;
		return new MysqlResultSet($result);
	}

	/**
	 * @return void
	 */
	public function rollback()
    {
		$success = $this->db->rollback();
		if (!$success) throw new \Exception("Failed to rollback transaction: " . $this->db->error);
	}

	/**
	 * @return void
	 */
	public function startTransaction ()
    {
		$success = $this->db->begin_transaction();
		if (!$success) throw new \Exception("Failed to start transaction: " . $this->db->error);
	}
}

