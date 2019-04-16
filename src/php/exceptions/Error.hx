package php.exceptions;

@:native("Error")
extern class Error implements php.interfaces.Throwable
{
	private var message : String;
	private var code : Int;
	private var file : String;
	private var line : Int;

	function new(?message:String, ?code:Int, ?previous:php.interfaces.Throwable) : Void;
	function getMessage() : String;
	function getPrevious() : php.interfaces.Throwable;
	function getCode() : Dynamic;
	function getFile() : String;
	function getLine() : Int;
	function getTrace() : NativeArray;
	function getTraceAsString() : String;
	function __toString() : String;
	private function __clone() : Void;
}
