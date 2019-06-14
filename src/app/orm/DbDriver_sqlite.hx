package orm;

import php.Exception;
import php.Global;
import php.Syntax;
import php.TypedArray;
import php.calendar.DateTime;
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
		try
		{
			return connection.request(sql);
		}
		catch (e:Dynamic)
		{
			throw DbException.errorOnQuery(sql, e);
		}
    }
	
	public function close() : Void
	{
		try connection.close() catch (_:Dynamic) {}
		connection = null;
	}
	
    public function getTables() : TypedArray<String>
    {
        var rows = query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name");
		return rows.results().map(function(row) return row['name']);
    }
	
	public function isAutoincrement(table:String, field:String) : Bool
	{
        var sql = query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" + table + "'").getResult(0);
		
		var inner = ~/[(]((?:.|\r|\n)*)[)]/m;
		if (!inner.match(sql)) return throw 'Unhandled syntax of "sqlite_master" for table "$table".';
		
		var statement = inner.matched(1).trim();
		var fields = statement.splitNative(",");
		
		var delim = '\\[\\]"\'`';
		var named = fields.filter(function(fld)
		{
			fld = fld.trim().splitNative(" ")[0];//first word in case of field declaration 
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
		
		var isAuto = named[0].splitNative(" ").map(function(x) return StringToolsNative.trim(x)).hasValue("AUTOINCREMENT");
		
		//trace('field $field isAuto $isAuto');
		return isAuto;
	}
	
	public function getFields(table:String) : TypedArray<DbTableFieldData>
    {
        var rows = query("PRAGMA table_info(" + table + ")");
        return rows.results().map(function(row)
			return new DbTableFieldData(
				row['name'],
				row['type'],
				Syntax.equal(row['notnull'], 0),
				row['pk'],
				isAutoincrement(table, row['name'])
			)
		);
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
        var r = new TypedArray<DbTableForeignKey>();
		var sql = query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" + table + "'").getResult(0);
		var reFK = ~/^CONSTRAINT ".+?" FOREIGN KEY [(]"(.+?)"[)] REFERENCES "(.+?)" [(]"(.+?)"[)]/;
		
        Syntax.foreach(sql.replace("\r", "").splitNative("\n"), function(_, s:String)
		{
			if (reFK.match(s))
			{
				r.push(cast Syntax.object(Syntax.assocDecl({ 
					   key: reFK.matched(1)
					 , parentTable: reFK.matched(2)
					 , parentKey: reFK.matched(3)
				})));
			}
		});
		return r;
    }
	
	public function getUniques(table:String) : TypedArray<TypedArray<String>>
	{
        var r = new TypedArray<TypedArray<String>>();
		var sql : String = query("SELECT sql FROM sqlite_master WHERE type='table' AND name='" + table + "'").getResult(0);
		var reUNIQUE = ~/^CONSTRAINT ".+?" UNIQUE [(](.+?)[)]/;
		Syntax.foreach(sql.replace("\r", "").splitNative("\n"), function(_, s:String)
		{
			if (reUNIQUE.match(s))
			{
				var fields: String = reUNIQUE.matched(1);
				r.push(fields.splitNative(",").map(function(s:String)
				{
					s = s.trim();
					if (s.startsWith("\"") && s.endsWith("\"")) s = s.substrNative(1, s.length - 2);
					return s;
				}));
			}
		});
		return r;
	}
}
