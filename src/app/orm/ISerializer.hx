package orm;

import php.NativeArray;
import php.TypedArray;

interface ISerializer
{
	function serializeObject(src:Dynamic, properties:TypedArray<String>=null) : NativeArray;
	function deserializeObject(src:NativeArray, dest:Dynamic, properties:TypedArray<String>=null) : Void;
}