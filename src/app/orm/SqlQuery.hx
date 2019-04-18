package orm;

import php.Global;
import php.Syntax;
import php.TypedArray;
import php.TypedAssoc;
import sys.db.ResultSet;

private typedef Manager<T> =
{
	function getBySqlMany(sql:String) : TypedArray<T>;
	function getBySqlOne(sql:String) : T;
}

class SqlQuery<T>
{
	var table : String;
	var db : Db;
	var manager : Manager<T>;
	
	var conditions = new TypedArray<String>();
	var orderBys = new TypedArray<String>();
	
	public function new(table:String, db:Db, manager:Manager<T>)
	{
		this.table = table;
		this.db = db;
		this.manager = manager;
	}
	
	public function whereField(field:String, op:String, value:Dynamic) : SqlQuery<T>
	{
		conditions.push("`" + field + "` " + op + " " + quoteValue(value));
		return this;
	}
	
	public function where(rawSqlText:String) : SqlQuery<T>
	{
		conditions.push(rawSqlText);
		return this;
	}
	
	public function orderAsc(value:Dynamic) : SqlQuery<T>
	{
		orderBys.push(quoteValue(value));
		return this;
	}
	
	public function orderDesc(value:Dynamic) : SqlQuery<T>
	{
		orderBys.push(quoteValue(value) + " DESC");
		return this;
	}
	
	public function findMany(?limit:Int,?offset:Int) : TypedArray<T>
	{
		var sqlSelect = getSelectSql(null);
		var sqlLimit = getLimitSql(limit);
		var sqlOffset = getOffsetSql(offset);
		return manager.getBySqlMany(sqlSelect + sqlLimit + sqlOffset);
	}
	
	public function findOne() : T
	{
		return manager.getBySqlOne(getSelectSql(null));
	}
	
	public function findManyFields(fields:TypedArray<String>, ?limit:Int, ?offset:Int) : ResultSet
	{
		return db.query(getSelectSql(fields) + getLimitSql(limit) + getOffsetSql(offset));
	}
	
	public function findOneFields(fields:TypedArray<String>) : TypedAssoc<String, Dynamic>
	{
		var rr = db.query(getSelectSql(fields) + "\nLIMIT 1");
		if (rr.hasNext()) return cast rr.next();
		return null;
	}
	
	public function update(fields:TypedAssoc<String, Dynamic>, ?limit:Int, ?offset:Int) : Void
	{
		var sets : TypedArray<String> = Syntax.arrayDecl();
		Syntax.foreach(fields, function(name:String, value:Dynamic)
		{
			sets.push("`" + name + "` = " + quoteValue(value));
		});
		db.query("UPDATE `" + table + "`\nSET\n\t" + sets.join("\n\t") + getWhereSql() + getLimitSql(limit) + getOffsetSql(offset));
	}
	
	public function delete(?limit:Int, ?offset:Int) : Void
	{
		db.query("DELETE FROM `" + table + "`" + getWhereSql() + getLimitSql(limit) + getOffsetSql(offset));
	}
	
	public function count() : Int
	{
		var r = db.query("SELECT COUNT(*) FROM `" + table + "`" + getWhereSql());
		if (!r.hasNext()) return 0;
		return r.getIntResult(0);
	}
	
	public function exists() : Bool
	{
		return findOneFields(Syntax.arrayDecl("1")) != null;
	}
	
	function getSelectSql(fields:TypedArray<String>) : String
	{
		var f: TypedArray<String> = Syntax.arrayDecl(); 
		
		if (fields != null)
		{
			Syntax.foreach(fields, function(_, name) f.push("`" + name + "`"));
		}
		else
		{
			f.push("*");
		}
		
		return "SELECT " + f.join(", ") + "\nFROM `" + table + "`" + getWhereSql() + getOrderBySql();
	}
	
	function getWhereSql() : String
	{
		return conditions.length > 0 ? "\nWHERE " + conditions.join("\n\tAND ") : "";
	}
	
	function getOrderBySql() : String
	{
		return orderBys.length > 0 ? "\nORDER BY " + orderBys.join(", ") : "";
	}
	
	function getLimitSql(limit:Int) : String
	{
		return limit != null ? "\nLIMIT " + limit : "";
	}
	
	function getOffsetSql(offset:Int) : String
	{
		return offset != null ? "\nOFFSET " + offset : "";
	}
	
	function quoteValue(v:Dynamic) : String
	{
		if (Std.is(v, SqlTextRaw)) return (cast v : SqlTextRaw).text;
		if (Std.is(v, SqlTextField)) return "`" + (cast v : SqlTextField).text + "`";
		if (Global.is_array(v))
		{
			return "(" + (cast v:TypedArray<Dynamic>).map(function(x) return db.quote(x)).join(", ") + ")";
		}
		return db.quote(v);
	}
}