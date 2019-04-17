package sys.db;

import sys.db.*;

@:coreApi class Sqlite {
	public static function open( file:String ) : Connection {
		return new SQLiteConnection(file);
	}
}
