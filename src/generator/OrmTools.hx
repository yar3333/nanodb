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
		return "String";
	}
	
	public static function createVar(haxeName:String, haxeType:String, ?haxeDefVal:String) : HaxeVar
	{
		return
		{
			 haxeName : haxeName
			,haxeType : haxeType
			,haxeDefVal : haxeDefVal
		};
	}
	
	static function field2var(table:String, f:DbTableFieldData, positions:OrmPositions) : OrmHaxeVar
	{ 
		return
		{
			 table : table
			,haxeName : f.name
			,haxeType : sqlType2phpType(f.type)
			,haxeDefVal : positions.is({ table:table, name:f.name}) ? "null" : null
			
			,name : f.name
			,type : f.type
			,isNull : f.isNull
			,isKey : f.isKey
			,isAutoInc : f.isAutoInc
		};
	}
	
	public static function fields2vars(table:String, fields:TypedArray<DbTableFieldData>, positions:OrmPositions) : TypedArray<OrmHaxeVar>
	{
		return fields.map(function(x) return OrmTools.field2var(table, x, positions));
	}
}