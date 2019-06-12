package orm;

import php.Global;
import php.Syntax;
import php.TypedAssoc;
import php.TypedArray;
import php.calendar.DateTime;
import sys.db.Connection;
import sys.db.Mysql;
import sys.db.ResultSet;
import php.Exception;

class DbDriver_mysql implements DbDriver
{
	static inline var renewTimeoutSeconds = 120;
	
	var host : String;
	var user : String;
	var pass : String;
	var database : String;
	var port : Int;
	
	var connection : Connection;
	
	var lastAccessTime = 0;
	
	public function new(dbparams:String) : Void
    {
		var re = new EReg('^([_a-zA-Z0-9]+)\\:(.+?)@([-_.a-zA-Z0-9]+)(?:[:](\\d+))?/([-_a-zA-Z0-9]+)$', '');
		if (!re.match(dbparams))
		{
			throw new Exception("Connection string invalid format.");
		}
		
		this.host = re.matched(3);
		this.user = re.matched(1);
		this.pass = re.matched(2);
		this.database = re.matched(5);
		this.port = re.matched(4) != null && re.matched(4) != "" ? Syntax.int(re.matched(4)) : 0;
		
		renew();
    }
	
	function renew()
	{
		if (Global.time() - lastAccessTime > renewTimeoutSeconds)
		{
			if (connection != null)
			{
				try
				{
					connection.request("SELECT 0");
				}
				catch (_:Dynamic)
				{
					close();
				}
			}
			
			if (connection == null)
			{
				connection = Mysql.connect(cast Syntax.object(Syntax.assocDecl({ host:host, user:user, pass:pass, database:database, port:port != 0 ? port : 3306, socket:null })));
				connection.request("set names utf8");
				connection.request("set character_set_client='utf8'");
				connection.request("set character_set_results='utf8'");
				connection.request("set collation_connection='utf8_general_ci'");
			}
		}
		
		lastAccessTime = Global.time();
	}

    public function query(sql:String) : ResultSet
    {
		renew();
		
		try
		{
			return connection.request(sql);
		}
		catch (e:Dynamic)
		{
			throw new DbException(e);
		}
    }
	
	public function close() : Void
	{
		try { connection.close(); } catch (_:Dynamic) { }
		connection = null;
	}
	
    public function getTables() : TypedArray<String>
    {
        var r = new TypedArray<String>();
        var resultSet = query("SHOW TABLES FROM `" + database + "`");
        Syntax.foreach(resultSet.results(), function(_, row:TypedAssoc<String, Dynamic>)
        {
			var fields = Global.array_keys(row);
			r.push(row[fields[0]]);
		});
        return r;
    }

	
	public function getFields(table:String) : TypedArray<DbTableFieldData>
    {
        var r = new TypedArray<DbTableFieldData>();
        var resultSet = query("SHOW COLUMNS FROM `" + table + "`");
        Syntax.foreach(resultSet.results(), function(_, row:TypedAssoc<String, Dynamic>)
        {
			r.push(new DbTableFieldData(
				row["Field"],
				row["Type"],
				row["Null"] == "YES",
				row["Key"] == "PRI",
				row["Extra"] == "auto_increment"
			));
        });
        return r;
    }

    public function quote(v:Dynamic) : String
    {
		if (Global.is_string(v)) return connection.quote(v);
        if (Global.is_int(v)) return connection.quote(v);
        if (Global.is_float(v)) return connection.quote(v);
        if (Global.is_bool(v)) return v ? "1" : "0";
        if (Syntax.strictEqual(v, null)) return "NULL";
		if (Std.is(v, DateTime)) return "'" + (cast v:DateTime).format("Y-m-d H:i:s") + "'";
		if (Std.is(v, SqlTextField)) return "`" + (cast v:SqlTextField).text + "`";
        
        throw new Exception("Unsupported parameter type '" + (cast v:String) + "'.");
    }

    public function lastInsertId() : Int
    {
		return connection.lastInsertId();
    }
	
	public function getForeignKeys(table:String) : TypedArray<DbTableForeignKey>
    {
        var sql = "
  SELECT
   u.table_name AS 'table',
   u.column_name AS 'key',
   u.referenced_table_name AS 'parentTable',
   u.referenced_column_name AS 'parentKey'
  FROM information_schema.table_constraints AS c
  INNER JOIN information_schema.key_column_usage AS u
  USING( constraint_schema, constraint_name )
  WHERE c.constraint_type = 'FOREIGN KEY'
    AND c.table_schema = '" + database + "'
    AND u.table_name = '" + table + "';
";
		return cast query(sql).results().map(function(x) return Syntax.object(x));
    }
	
	public function getUniques(table:String) : TypedArray<TypedArray<String>>
	{
		var resultSet : ResultSet = query("SHOW INDEX FROM `" + table + "` WHERE Non_unique=0 AND Key_name<>'PRIMARY'");
		var r = new TypedAssoc<String, TypedArray<String>>();
        Syntax.foreach(resultSet.results(), function(_, row:TypedAssoc<String, Dynamic>)
		{
			var key:String = row['Key_name'];
            if (!r.hasKey(key)) r[key] = new TypedArray<String>();
            r[key].push(row['Column_name']);
		});
		return r.values();
	}
}
