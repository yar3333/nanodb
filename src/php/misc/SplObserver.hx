package php.misc;

@:native("SplObserver")
extern interface SplObserver
{
	function update(subject:SplSubject) : Void;
}
