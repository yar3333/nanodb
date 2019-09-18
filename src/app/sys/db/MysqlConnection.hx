package sys.db;

import php.*;
import php.db.Mysqli;
using php.StringToolsNative;

class MysqlConnection implements Connection
{
	var db : Mysqli;

	public function new(
		params : {
			host : String,
			?port : Int,
			user : String,
			pass : String,
			?socket : String,
			?database : String
		}
	) : Void {
		if (params.port == null) params.port = Syntax.int(Global.ini_get('mysqli.default_port'));
		if (params.socket == null) params.socket = Global.ini_get('mysqli.default_socket');
		if (params.database == null) params.database = "";

		db = new Mysqli(params.host, params.user, params.pass, params.database, params.port, params.socket);
	}

	public function request(s:String, ?mode:Int) : ResultSet
	{
		var result = db.query(s, mode);
		if (result == false) throw 'Failed to perform db query: ' + db.error;
		if (result == true) return null;

		return new MysqlResultSet(result);
	}

	public function close() : Void 
	{
		db.close();
	}

	public function escape(s:String) : String 
	{
		return db.escape_string(s);
	}

	public function quote(s:String) : String 
	{
		if (s.contains("\000"))
		{
			return "x'" + Global.bin2hex(s) + "'";
		}
		return "'" + db.escape_string(s) + "'";
	}

	public function lastInsertId() : Int 
	{
		return db.insert_id;
	}

	public function dbName() : String 
	{
		return 'MySQL';
	}

	public function startTransaction() : Void 
	{
		var success = db.begin_transaction();
		if (!success) throw 'Failed to start transaction: ' + db.error;
	}

	public function commit() : Void 
	{
		var success = db.commit();
		if (!success) throw 'Failed to commit transaction: ' + db.error;
	}

	public function rollback() : Void 
	{
		var success = db.rollback();
		if (!success) throw 'Failed to rollback transaction: ' + db.error;
	}
}
