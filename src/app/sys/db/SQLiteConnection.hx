package sys.db;

import php.*;
import php.db.*;
import sys.db.*;
using php.StringToolsNative;

class SQLiteConnection implements Connection
{
	var db:SQLite3;

	public function new(file:String) 
	{
		db = new SQLite3(file);
		db.enableExceptions(true);
	}

	public function request(s:String, ?mode:Int) : ResultSet 
	{
		var result = db.query(s);
		return new SQLiteResultSet(result);
	}

	public function close() : Void 
	{
		db.close();
	}

	public function escape(s:String) : String 
	{
		return SQLite3.escapeString(s);
	}

	public function quote( s : String ) : String 
	{
		if (s.contains("\000")) return "x'" + Global.bin2hex(s) + "'";
		return "'" + SQLite3.escapeString(s) + "'";
	}

	public function lastInsertId() : Int 
	{
		return Syntax.int(db.lastInsertRowID());
	}

	public function dbName() : String 
	{
		return 'SQLite';
	}

	public function startTransaction() : Void 
	{
		db.query('BEGIN TRANSACTION');
	}

	public function commit() : Void 
	{
		db.query('COMMIT');
	}

	public function rollback() : Void 
	{
		db.query('ROLLBACK');
	}
}
