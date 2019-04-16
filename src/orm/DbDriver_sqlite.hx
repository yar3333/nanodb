package orm;

import Type;
import php.Exception;
import php.Global;
import php.TypedArray;
import sys.db.Connection;
import sys.db.ResultSet;
import sys.db.Sqlite;
using php.StringToolsNative;

class DbDriver_sqlite implements DbDriver
{
	var connection : Connection;
	
	public function new(dbparams:String) : Void
    {
		connection = Sqlite.open(dbparams);
    }
	
    public function query(sql:String) : ResultSet
    {
		var r = null;
		try r = connection.request(sql)
		catch (e:Dynamic)
		{
			throw new DbException(e);
		}
		return r;
    }
	
	public function close() : Void
	{
		try connection.close() catch (_:Dynamic) {}
		connection = null;
	}
	
    public function getTables() : TypedArray<String>
    {
        var rows = query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name");
		return rows.results().map(function(row) return row.name);
    }
	
	public function isAutoincrement(table:String, field:String) : Bool
	{
        var sql = query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" + table + "'").getResult(0);
		
		var inner = ~/[(]((?:.|\r|\n)*)[)]/m;
		if (!inner.match(sql)) return throw 'Unhandled syntax of "sqlite_master" for table "$table".';
		
		var statement = inner.matched(1).trim();
		var fields = statement.split(",");
		
		var delim = '\\[\\]"\'`';
		var named = fields.filter(function(fld)
		{
			fld = fld.trim().split(" ")[0];//first word in case of field declaration 
			var reg 		= '[$delim]?$field[$delim]?';//maybe delimited
			var fld_reg 	= new EReg(reg, "gm");//multiline
			var matching 	= fld_reg.match(fld);
			var without_delim_word 	= fld.length == field.length; // both words need to be same length
			var with_delim_word 	= fld.length == (field.length + 2); // in one of two ways
			return matching && (without_delim_word 	|| with_delim_word);
		});
		
		if (named.length != 1)
		{
			//trace('field "$field" table "$table" named "$named" fields $fields');
			throw 'Unhandled syntax of "sqlite_master" for table "$table".';
		}		
		
		var isAuto = named[0].split(" ").map(StringTools.trim).indexOf("AUTOINCREMENT") > -1;
		
		//trace('field $field isAuto $isAuto');
		return isAuto;
	}
	
	public function getFields(table:String) : TypedArray<DbTableFieldData>
    {
        var rows = query("PRAGMA table_info(" + table + ")");
        return rows.results().map(function(row)
			return
			{
                 name : row.name
                ,type : row.type
                ,isNull : row.notnull == 0
                ,isKey : row.pk
                ,isAutoInc : isAutoincrement(table, row.name)
			}
		);
    }
	
    public function quote(v:Dynamic) : String
    {
		switch (Type.typeof(v))
        {
            case ValueType.TClass(cls):
                if (Std.is(v, String))
                {
					return connection.quote(v);
                }
                else
                if (Std.is(v, Date))
                {
                    return "'" + v.toString() + "'";
                }
            
            case ValueType.TInt:
                return Std.string(v);
            
            case ValueType.TFloat:
                return Std.string(v);
            
            case ValueType.TNull:
                return "NULL";
            
            case ValueType.TBool:
                return cast(v, Bool) ? "1" : "0";
            
            default:
        }
        
        throw new Exception("Unsupported parameter type '" + Type.getClassName(Type.getClass(v)) + "'.");
    }
	
    public function lastInsertId() : Int
    {
		return connection.lastInsertId();
    }
	
	public function getForeignKeys(table:String) : TypedArray<DbTableForeignKey>
    {
        var r = new TypedArray<DbTableForeignKey>();
		var sql = query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" + table + "'").getResult(0);
		var reFK = ~/^CONSTRAINT ".+?" FOREIGN KEY [(]"(.+?)"[)] REFERENCES "(.+?)" [(]"(.+?)"[)]/;
		for (s in sql.replace("\r", "").split("\n"))
		{
			if (reFK.match(s))
			{
				r.push({ 
					   key: reFK.matched(1)
					 , parentTable: reFK.matched(2)
					 , parentKey: reFK.matched(3)
				});
			}
		}
		return r;
    }
	
	public function getUniques(table:String) : TypedArray<TypedArray<String>>
	{
        var r = new TypedArray<TypedArray<String>>();
		var sql : String = query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" + table + "'").getResult(0);
		var reUNIQUE = ~/^CONSTRAINT ".+?" UNIQUE [(](.+?)[)]/;
		for (s in sql.replace("\r", "").split("\n"))
		{
			if (reUNIQUE.match(s))
			{
				var fields: String = reUNIQUE.matched(1);
				r.push((cast Global.explode(",", fields) : TypedArray<String>).map(function(s:String)
				{
					s = s.trim();
					if (s.startsWith("\"") && s.endsWith("\"")) s = s.substr(1, s.length - 2);
					return s;
				}));
			}
		}
		return r;
	}
}
