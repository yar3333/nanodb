package php.exceptions;

@:native("LogicException")
extern class LogicException extends Exception
{
	public function new(?message : String, ?code : Int) : Void;
}
