package php.interfaces;

@:native("Throwable")
extern interface Throwable
{
	function getMessage() : String;
	function getCode() : Int;
	function getFile() : String;
	function getLine() : Int;
	function getTrace() : NativeArray;
	function getTraceAsString() : String;
	function getPrevious() : Throwable;
	function __toString() : String;
}
