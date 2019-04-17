package generator;

import php.TypedArray;
import orm.DbTableFieldData;

class OrmTools 
{
	static function sqlTypeCheck(checked:String, type:String) : Bool
	{
		var re = new EReg("^" + type + "(\\(|$)", "");
		return re.match(checked);
	}
	
	public static function sqlType2phpType(sqlType:String) : String
	{
		sqlType = sqlType.toUpperCase();
		if (sqlType == "TINYINT(1)")            return "bool";
		if (sqlTypeCheck(sqlType, "TINYINT"))   return "int";
		if (sqlTypeCheck(sqlType, "SMALLINT"))  return "int";
		if (sqlTypeCheck(sqlType, "MEDIUMINT")) return "int";
		if (sqlTypeCheck(sqlType, "SHORT"))     return "int";
		if (sqlTypeCheck(sqlType, "LONG"))      return "int";
		if (sqlTypeCheck(sqlType, "INT"))       return "int";
		if (sqlTypeCheck(sqlType, "INTEGER"))   return "int";
		if (sqlTypeCheck(sqlType, "INT24"))     return "int";
		if (sqlTypeCheck(sqlType, "BIGINT"))    return "float";
		if (sqlTypeCheck(sqlType, "LONGLONG"))  return "float";
		if (sqlTypeCheck(sqlType, "DECIMAL"))   return "float";
		if (sqlTypeCheck(sqlType, "FLOAT"))     return "float";
		if (sqlTypeCheck(sqlType, "DOUBLE"))    return "float";
		if (sqlTypeCheck(sqlType, "REAL"))      return "float";
		if (sqlTypeCheck(sqlType, "DATE"))      return "DateTime";
		if (sqlTypeCheck(sqlType, "DATETIME"))  return "DateTime";
		return "string";
	}
	
	static function field2var(table:String, f:DbTableFieldData, positions:OrmPositions) : OrmPhpVar
	{
		var r = new OrmPhpVar(f.name, sqlType2phpType(f.type), positions.is(table, f.name) ? "null" : null);
		
		r.table = table;
		r.name = f.name;
		r.type = f.type;
		r.isNull = f.isNull;
		r.isKey = f.isKey;
		r.isAutoInc = f.isAutoInc;
		
		return r;
	}
	
	public static function fields2vars(table:String, fields:TypedArray<DbTableFieldData>, positions:OrmPositions) : TypedArray<OrmPhpVar>
	{
		return fields.map(function(x) return OrmTools.field2var(table, x, positions));
	}
}