package php.interfaces;

@:native("Closure")
extern class Closure
{
	static function bind(closure:Closure, newthis:Dynamic, ?newscope:Dynamic) : Closure;
	function bindTo(newthis:Dynamic, ?newscope:Dynamic) : Closure;
	function call(newthis:Dynamic, ?restArgs:Dynamic) : Dynamic;
}
