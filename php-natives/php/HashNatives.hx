package php;

class HashNatives
{
	public static inline function hash_algos() : NativeArray return untyped __call__('hash_algos');
	
	public static inline function hash_copy(context:Resource) : Resource return untyped __call__('hash_copy', context);
	
	public static inline function hash_equals(known_string:String, user_string:String) : Bool return untyped __call__('hash_equals', known_string, user_string);
	
	public static inline function hash_file(algo:String, filename:String, raw_output=false) : String return untyped __call__('hash_file', algo, filename, raw_output);
	
	public static inline function hash_final(context:Resource, raw_output=false) : String return untyped __call__('hash_final', context, raw_output);
	
	public static inline function hash_hmac_file(algo:String, filename:String, key:String, raw_output=false) : String return untyped __call__('hash_hmac_file', algo, filename, key, raw_output);
	
	public static inline function hash_hmac(algo:String, data:String, key:String, raw_output=false) : String return untyped __call__('hash_hmac', algo, data, key, raw_output);
	
	public static function hash_init(algo:String, options=0, ?key:String) : Resource
	{
		if (key == null)
		{
			return untyped __call__('hash_init', algo, options);
		}
		else
		{
			return untyped __call__('hash_init', algo, options, key);
		}
	}
	
	public static inline function hash_pbkdf2(algo:String, password:String, salt:String, iterations:Int, length=0, raw_output=false) : String return untyped __call__('hash_pbkdf2', algo, password, salt, iterations, length, raw_output);
	
	public static function hash_update_file(hcontext:Resource, filename:String, ?scontext:Resource) : Bool
	{
		if (scontext == null)
		{
			return untyped __call__('hash_update_file', hcontext, filename);
		}
		else
		{
			return untyped __call__('hash_update_file', hcontext, filename, scontext);
		}
	}
	
	public static inline function hash_update_stream(context:Resource, handle:Resource, length=-1) : Int return untyped __call__('hash_update_stream', context, handle, length);
	
	public static inline function hash_update(context:Resource, data:String) : Bool return untyped __call__('hash_update', context, data);
	
	public static inline function hash(algo:String, data:String, raw_output=false) : String return untyped __call__('hash', algo, data, raw_output);
}
