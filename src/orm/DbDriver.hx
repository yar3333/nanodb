package orm;

import sys.db.ResultSet;
import php.TypedArray;

interface DbDriver 
{
	function query(sql:String) : ResultSet;
    function quote(s:Dynamic) : String;
    function lastInsertId() : Int;
	function close() : Void;
    
	function getTables() : TypedArray<String>;
    function getFields(table:String) : TypedArray<DbTableFieldData>;
	function getForeignKeys(table:String) : TypedArray<DbTableForeignKey>;
	function getUniques(table:String) : TypedArray<TypedArray<String>>;
}
