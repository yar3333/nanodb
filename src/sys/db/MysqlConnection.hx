package sys.db;

import php.*;
import php.db.Mysqli;

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
		if (params.port == null) params.port = Std.parseInt(Global.ini_get('mysqli.default_port'));
		if (params.socket == null) params.socket = Global.ini_get('mysqli.default_socket');
		if (params.database == null) params.database = "";

		db = new Mysqli(params.host, params.user, params.pass, params.database, params.port, params.socket);
	}

	public function request( s : String ) : ResultSet {
		var result = db.query(s);
		if (result == false) throw 'Failed to perform db query: ' + db.error;
		if (result == true) return null;

		return new MysqlResultSet(result);
	}

	public function close() : Void {
		db.close();
	}

	public function escape( s : String ) : String {
		return db.escape_string(s);
	}

	public function quote( s : String ) : String {
		if (s.indexOf("\000") >= 0) return "x'" + Global.bin2hex(s) + "'";
		return "'" + db.escape_string(s) + "'";
	}

	public function addValue( s : StringBuf, v : Dynamic ) : Void {
		if (Global.is_int(v)
		|| Global.is_null(v)) {
			s.add(v);
		} else if (Global.is_bool(v)) {
			s.add(v ? 1 : 0);
		} else {
			s.add(quote(Std.string(v)));
		}
	}

	public function lastInsertId() : Int {
		return db.insert_id;
	}

	public function dbName() : String {
		return 'MySQL';
	}

	public function startTransaction() : Void {
		var success = db.begin_transaction();
		if (!success) throw 'Failed to start transaction: ' + db.error;
	}

	public function commit() : Void {
		var success = db.commit();
		if (!success) throw 'Failed to commit transaction: ' + db.error;
	}

	public function rollback() : Void {
		var success = db.rollback();
		if (!success) throw 'Failed to rollback transaction: ' + db.error;
	}

}
