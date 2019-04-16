package php;

import php.interfaces.Traversable;

class TraversableTools
{
	public static function toArray<T>(trav:Traversable) : Array<T>
	{
		var r = untyped __call__("array");
		untyped __php__("foreach ($trav as $k => $v) { $r[$k] = $v; }");
		return r;
	}
}