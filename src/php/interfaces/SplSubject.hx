package php.interfaces;

@:native("SplSubject")
extern interface SplSubject
{
	function attach(observer:SplObserver) : Void;
	function detach(observer:SplObserver) : Void;
	function notify() : Void;
}
