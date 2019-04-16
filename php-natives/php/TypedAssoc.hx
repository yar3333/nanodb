package php;
import haxe.extern.EitherType;

abstract TypedAssoc<K, V>(NativeArray) from NativeArray to NativeArray
{
	public inline function new()
	{
		this = new NativeArray();
	}
	
	public var length(get, never) : Int;
	inline function get_length() : Int return Global.count(this);
	
	@:arrayAccess
	public inline function get(k:K) : V
	{
		return this[cast k];
	}
	
	@:arrayAccess
	public inline function set(k:K, v:V) : V
	{
		return this[cast k] = v;
	}
	
	@:from
	public static inline function fromIndexedArray<V>(arr:NativeIndexedArray<V>) : TypedAssoc<Int, V>
	{
		return cast arr;
	}
	
	public inline function toIndexedArray() : NativeIndexedArray<V>
	{
		return cast this;
	}
	
	public inline function push(v:V) : Int
	{
		return Global.array_push(this, v);
	}
	
	public inline function pop() : V
	{
		return Global.array_pop(this);
	}
	
	public inline function unshift(v:V) : Int
	{
		return Global.array_unshift(this, v);
	}
	
	public inline function shift() : V
	{
		return Global.array_shift(this);
	}
	
	public inline function join(glue="") : String
	{
		return Global.implode(glue, this);
	}
	
	public function splice(offset:Int, ?length:Int, ?replacement:TypedAssoc<K, V>) : TypedAssoc<K, V>
	{
		if (length == null) length = Global.count(this) - offset;
		if (replacement == null) replacement = new TypedAssoc<K, V>();
		return Global.array_splice(this, offset, length, replacement);
	}
	
	//public inline function asort() : Void
	//{
	//	Global.asort(this);
	//}
	
	public inline function hasKey(k:K) : Bool
	{
		return Global.array_key_exists(cast k, this);
	}
	
	public inline function hasValue(v:V, strict=false) : Bool
	{
		return Global.in_array(v, this, strict);
	}
	
	public inline function removeKey(k:K) : Void
	{
		Global.unset(this[cast k]);
	}
	
	public inline function keys() : TypedAssoc<Int, K>
	{
		return cast Global.array_keys(this);
	}
	
	public inline function values() : TypedAssoc<Int, V>
	{
		return cast Global.array_values(this);
	}
	
	@:op(A + B)
	inline function plus(arr:TypedAssoc<K, V>) : TypedAssoc<K, V>
	{
		return cast((cast this) + (cast arr));
	}
	
	public inline function exists(callback:V->Bool) : Bool
	{
		return Global.current(Global.array_filter(this, callback));
	}
	
	public inline function filter(callback:V->Bool) : TypedAssoc<K, V>
	{
		return Global.array_filter(this, callback);
	}
	
	public inline function copy() : TypedAssoc<K, V>
	{
		return Global.array_slice(this, 0);
	}
	
	public inline function map<V2>(callback:V->V2) : TypedAssoc<K, V2>
	{
		return cast Global.array_map(callback, this);
	}
	
	public inline function concat(arr:TypedAssoc<K, V>) : TypedAssoc<K, V>
	{
		return cast Global.array_merge(this, arr);
	}
	
	public inline function slice(offset:Int, ?length:Int) : TypedAssoc<K, V>
	{
		return Global.array_slice(this, offset, length);
	}
	
	public inline function indexOfNative(item:V) : EitherType<Int, Bool>
	{
		return cast Global.array_search(item, this, true);
	}
}
