package orm;

typedef TypedResultSet<T:{}> =
{
	var length(get, null) : Int;
	var nfields(get, null) : Int;

	function hasNext() : Bool;
	function next() : T;
	function results() : php.iterators. List<T>;
	function getResult(n:Int) : String;
	function getIntResult(n:Int) : Int;
	function getFloatResult(n:Int) : Float;
	function getFieldsNames() : php.TypedArray<Int, String>;
}