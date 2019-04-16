package sys.db;

import php.TypedAssoc;

interface ResultSet {

	var length(get,null) : Int;
	var nfields(get,null) : Int;


	function hasNext() : Bool;
	function next() : Dynamic;
	function results() : TypedAssoc<Int, Dynamic>;
	function getResult( n : Int ) : String;
	function getIntResult( n : Int ) : Int;
	function getFloatResult( n : Int ) : Float;
	function getFieldsNames() : TypedAssoc<Int, String>;
}
