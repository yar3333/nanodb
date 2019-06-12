package orm;

import php.TypedAssoc;
import sys.db.ResultSet;

import orm.DbDriver_mysql;
import orm.DbDriver_sqlite;

@:native("nanodb.orm.Db")
extern class Db
{
    /**
     * Level of tracing SQL:
	 * 0 - show errors only;
	 * 1 - show queries;
	 * 2 - show queries and times.
     */
	public var logLevel : Int;
	
	public var connection(default , null) : DbDriver;
	
    public function new(connectionString:String, ?logLevel:Int) : Void;
	public function query(sql:String, ?params:TypedAssoc<String, Dynamic>) : ResultSet;
    public function quote(v:Dynamic) : String;
    public function lastInsertId() : Int;
	public function close() : Void;
	public function bind(sql:String, params:TypedAssoc<String, Dynamic>) : String;
}
