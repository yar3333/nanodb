package orm;

import sys.db.ResultSet;
import php.TypedArray;

interface DbDriver 
{
	function query(sql:String) : ResultSet;
    function quote(s:Dynamic) : String;
    function lastInsertId() : Int;
	function close() : Void;
    
	function getTables() : TypedArray<Int, String>;
    function getFields(table:String) : TypedArray<Int, DbTableFieldData>;
	function getForeignKeys(table:String) : TypedArray<Int, DbTableForeignKey>;
	function getUniques(table:String) : TypedArray<Int, TypedArray<Int, String>>;
}
