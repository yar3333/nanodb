package php.exceptions;

@:native("ErrorException")
extern class ErrorException extends Exception
{
	private var severity : Int;

	function new(?message:String, ?code:Int, ?severity:Int, ?filename:String, ?lineno:Int, ?previous:Exception) : Void;
	function getSeverity() : Int;
}
