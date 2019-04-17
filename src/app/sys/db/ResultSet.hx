package sys.db;

import php.TypedArray;
import php.TypedAssoc;

interface ResultSet {

	var length(default, null) : Int;
	var nfields(default, null) : Int;

	function hasNext() : Bool;
	function next() : Dynamic;
	function results() : TypedArray<TypedAssoc<String, Dynamic>>;
	function getResult( n : Int ) : String;
	function getIntResult( n : Int ) : Int;
	function getFloatResult( n : Int ) : Float;
	function getFieldsNames() : TypedArray<String>;
}
