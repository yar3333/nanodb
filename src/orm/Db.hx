package orm;

import php.Syntax;
import php.TypedAssoc;
import sys.db.ResultSet;
import orm.DbDriver_mysql;
import orm.DbDriver_sqlite;
import php.Exception;

class Db
{
	var connectionString : String;
	
    /**
     * Level of tracing SQL:
	 * 0 - show errors only;
	 * 1 - show queries;
	 * 2 - show queries and times.
     */
	public var logLevel : Int;
	
	public var connection(default , null) : DbDriver;
	
    public function new(connectionString:String, ?logLevel:Int) : Void
	{
		this.connectionString = connectionString;
		this.logLevel = logLevel != null ? logLevel : 0;
		
		var n = connectionString.indexOf("://");
		if (n < 0) throw new Exception("Connection string format must be 'dbtype://params'.");
		var dbtype = connectionString.substr(0, n);
		var dbparams = connectionString.substr(n + "://".length);
		
		#if profiler Profiler.begin("Db.open"); #end
		var klassName = "nanodb.orm.DbDriver_" + dbtype;
		connection = Syntax.construct(klassName, dbparams);
		#if profiler Profiler.end(); #end
		
    }

	public function query(sql:String, ?params:Dynamic) : ResultSet
    {
		try
		{
			#if profiler Profiler.begin('Db.query'); #end
			if (params != null) sql = bind(sql, params);
			if (logLevel >= 1) trace("SQL QUERY: " + sql);
			var startTime = logLevel >= 2 ? Sys.time() : 0;
			var r = connection.query(sql);
			if (logLevel >= 2) trace("SQL QUERY FINISH " + Math.round((Sys.time() - startTime) * 1000) + " ms");
			#if profiler Profiler.end(); #end
			return r;
		}
		catch (e:DbException)
		{
            #if profiler Profiler.end(); #end
			throw new Exception("DATABASE\n\tSQL QUERY: " + sql + "\n\tSQL RESULT: error code = " + e.getCode() + ", message: " + e.getMessage());
		}
		catch (e:Dynamic)
		{
			#if profiler Profiler.end(); #end
			throw e;
		}
    }

    public function quote(v:Dynamic) : String
    {
		return connection.quote(v);
    }

    public function lastInsertId() : Int
    {
        return connection.lastInsertId();
    }
	
	public function close() : Void
	{
		try connection.close() catch (e:Dynamic) {}
		connection = null;
	}
	
	public function bind(sql:String, params:TypedAssoc<String, Dynamic>) : String
	{
		return new EReg("[{]([_a-zA-Z][_a-zA-Z0-9]*)[}]", "").map(sql, function(re) 
		{
			var name = re.matched(1);
			if (params.hasKey(name)) return quote(params[name]);
			throw "Param '" + name + "' not found while binding SQL query '" + sql + "'.";
		});
	}
	
	public function expression(s:String) : SqlValues
	{
		return SqlValues.SqlExpression(s);
	}
	
	public function field(s:String) : SqlValues
	{
		return SqlValues.SqlField(s);
	}
}
