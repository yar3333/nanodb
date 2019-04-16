package php.interfaces;

@:native("SplObserver")
extern interface SplObserver
{
	function update(subject:SplSubject) : Void;
}
