package sys.db;

import php.TypedArray;

interface ResultSet {

	var length(get,null) : Int;
	var nfields(get,null) : Int;


	function hasNext() : Bool;
	function next() : Dynamic;
	function results() : TypedArray<Dynamic>;
	function getResult( n : Int ) : String;
	function getIntResult( n : Int ) : Int;
	function getFloatResult( n : Int ) : Float;
	function getFieldsNames() : TypedArray<String>;
}
