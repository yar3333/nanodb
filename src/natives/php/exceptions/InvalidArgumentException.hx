package php.exceptions;

@:native("InvalidArgumentException")
extern class InvalidArgumentException extends LogicException
{
	public function new(?message : String, ?code : Int) : Void;
}
