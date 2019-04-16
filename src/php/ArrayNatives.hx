package php;

class ArrayNatives
{
}
/*	public static function array_change_key_case(arr:NativeArray, ?case_:Int) : NativeArray
	{
		if (case_ == null)
		{
			return untyped __call__('array_change_key_case', arr);
		}
		else
		{
			return untyped __call__('array_change_key_case', arr, case_);
		}
	}
	
	public static inline function is_array(var_:Dynamic) : Bool return untyped __call__('is_array', var_);
	
	public static function explode(delimiter:String, str:String, ?limit:Int) : NativeArray
	{
		if (limit == null)
		{
			return untyped __call__('explode', delimiter, str);
		}
		else
		{
			return untyped __call__('explode', delimiter, str, limit);
		}
	}
	
	public static inline function implode(glue="", pieces:NativeArray) : String return untyped __call__('implode', glue, pieces);
	
	public static inline function split(pattern:String, str:String, ?limit:Int=-1) : NativeArray return untyped __call__('split', pattern, str, limit);
	
	public static inline function preg_split(pattern:String, subject:String, ?limit:Int=-1, flags=0) : NativeArray return untyped __call__('preg_split', pattern, subject, limit, flags);
	
	public static inline function unset(var_:Dynamic) : Void return untyped __call__('unset', var_);
	
	public static inline function array_chunk(arr:NativeArray, size:Int, ?preserve_keys:Bool=false) : NativeArray return untyped __call__('array_chunk', arr, size, preserve_keys);
	
	public static inline function array_column(input:NativeArray, column_key:Dynamic, ?index_key:Dynamic=null) : NativeArray return untyped __call__('array_column', input, column_key, index_key);
	
	public static inline function array_combine(keys:NativeArray, values:NativeArray) : NativeArray return untyped __call__('array_combine', keys, values);
	
	public static inline function array_count_values(arr:NativeArray) : NativeArray return untyped __call__('array_count_values', arr);
	
	public static inline function array_diff_assoc(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_diff_assoc', array1, array2);
	
	public static inline function array_diff_key(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_diff_key', array1, array2);
	
	public static inline function array_diff_uassoc(array1:NativeArray, array2:NativeArray, key_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_diff_uassoc', array1, array2, key_compare_func);
	
	public static inline function array_diff_ukey(array1:NativeArray, array2:NativeArray, key_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_diff_ukey', array1, array2, key_compare_func);
	
	public static inline function array_diff(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_diff', array1, array2);
	
	public static inline function array_fill_keys(keys:NativeArray, value:Dynamic) : NativeArray return untyped __call__('array_fill_keys', keys, value);
	
	public static inline function array_fill(start_index:Int, num:Int, value:Dynamic) : NativeArray return untyped __call__('array_fill', start_index, num, value);
	
	public static inline function array_filter(arr:NativeArray, callback:Dynamic->Bool, flag=0) : NativeArray return untyped __call__('array_filter', arr, callback, flag);
	
	public static inline function array_flip(arr:NativeArray) : NativeArray return untyped __call__('array_flip', arr);
	
	public static inline function array_intersect_assoc(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_intersect_assoc', array1, array2);
	
	public static inline function array_intersect_key(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_intersect_key', array1, array2);
	
	public static inline function array_intersect_uassoc(array1:NativeArray, array2:NativeArray, key_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_intersect_uassoc', array1, array2, key_compare_func);
	
	public static inline function array_intersect_ukey(array1:NativeArray, array2:NativeArray, key_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_intersect_ukey', array1, array2, key_compare_func);
	
	public static inline function array_intersect(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_intersect', array1, array2);
	
	public static inline function array_key_exists(key:Dynamic, arr:NativeArray) : Bool return untyped __call__('array_key_exists', key, arr);
	
	public static inline function array_keys(arr:NativeArray, ?search_value:Dynamic=null, ?strict:Bool=false) : NativeArray return untyped __call__('array_keys', arr, search_value, strict);
	
	public static inline function array_map(callback:Dynamic, array1:NativeArray) : NativeArray return untyped __call__('array_map', callback, array1);
	
	public static inline function array_merge_recursive(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_merge_recursive', array1, array2);
	
	public static inline function array_merge(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_merge', array1, array2);
	public static inline function array_merge_ex(array1:NativeArray, array2:NativeArray, array3:NativeArray) : NativeArray return untyped __call__('array_merge', array1, array2, array3);
	
	public static function array_multisort(array1:NativeArray, ?array1_sort_order:Dynamic, ?array1_sort_flags:Dynamic) : Bool
	{
		if (array1_sort_flags == null)
		{
			if (array1_sort_order == null)
			{
				return untyped __call__('array_multisort', array1);
			}
			else
			{
				return untyped __call__('array_multisort', array1, array1_sort_order);
			}
		}
		else
		{
			return untyped __call__('array_multisort', array1, array1_sort_order, array1_sort_flags);
		}
	}

	
	public static inline function array_pad(arr:NativeArray, size:Int, value:Dynamic) : NativeArray return untyped __call__('array_pad', arr, size, value);
	
	public static inline function array_pop(arr:NativeArray) : Dynamic return untyped __call__('array_pop', arr);
	
	public static inline function array_product(arr:NativeArray) : Float return untyped __call__('array_product', arr);
	
	public static inline function array_push(arr:NativeArray, value1:Dynamic) : Int return untyped __call__('array_push', arr, value1);
	
	public static inline function array_rand(arr:NativeArray, ?num:Int=1) : Dynamic return untyped __call__('array_rand', arr, num);
	
	public static function array_reduce(arr:NativeArray, callback:Dynamic->Dynamic->Dynamic, ?initial:Dynamic) : Dynamic
	{
		if (initial == null)
		{
			return untyped __call__('array_reduce', arr, callback);
		}
		else
		{
			return untyped __call__('array_reduce', arr, callback, initial);
		}
	}

	
	public static inline function array_replace_recursive(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_replace_recursive', array1, array2);
	
	public static inline function array_replace(array1:NativeArray, array2:NativeArray) : NativeArray return untyped __call__('array_replace', array1, array2);
	
	public static inline function array_reverse(arr:NativeArray, ?preserve_keys:Bool=false) : NativeArray return untyped __call__('array_reverse', arr, preserve_keys);
	
	public static inline function array_search(needle:Dynamic, haystack:NativeArray, ?strict:Bool=false) : Dynamic return untyped __call__('array_search', needle, haystack, strict);
	
	public static inline function array_shift(arr:NativeArray) : Dynamic return untyped __call__('array_shift', arr);
	
	public static inline function array_slice(arr:NativeArray, offset:Int) : NativeArray return untyped __call__('array_slice', arr, offset);
	
	public static inline function array_sliceWithLength(arr:NativeArray, offset:Int, length:Int, ?preserve_keys:Bool=false) : NativeArray return untyped __call__('array_slice', arr, offset, length, preserve_keys);
	
	public static inline function array_splice(input:NativeArray, offset:Int, length = 0) : NativeArray return untyped __call__('array_splice', input, offset, length);
	
	public static inline function array_spliceWithReplacement(input:NativeArray, offset:Int, length:Int, replacement:Dynamic) : NativeArray return untyped __call__('array_splice', input, offset, length, replacement);
	
	public static inline function array_sum(arr:NativeArray) : Float return untyped __call__('array_sum', arr);
	
	public static inline function array_udiff_assoc(array1:NativeArray, array2:NativeArray, value_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_udiff_assoc', array1, array2, value_compare_func);
	
	public static inline function array_udiff_uassoc(array1:NativeArray, array2:NativeArray, value_compare_func:Dynamic->Dynamic->Int, key_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_udiff_uassoc', array1, array2, value_compare_func, key_compare_func);
	
	public static inline function array_udiff(array1:NativeArray, array2:NativeArray, value_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_udiff', array1, array2, value_compare_func);
	
	public static inline function array_uintersect_assoc(array1:NativeArray, array2:NativeArray, value_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_uintersect_assoc', array1, array2, value_compare_func);
	
	public static inline function array_uintersect_uassoc(array1:NativeArray, array2:NativeArray, value_compare_func:Dynamic->Dynamic->Int, key_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_uintersect_uassoc', array1, array2, value_compare_func, key_compare_func);
	
	public static inline function array_uintersect(array1:NativeArray, array2:NativeArray, value_compare_func:Dynamic->Dynamic->Int) : NativeArray return untyped __call__('array_uintersect', array1, array2, value_compare_func);
	
	public static function array_unique(arr:NativeArray, ?sort_flags:Int) : NativeArray
	{
		if (sort_flags == null)
		{
			return untyped __call__('array_unique', arr);
		}
		else
		{
			return untyped __call__('array_unique', arr, sort_flags);
		}
	}
	
	public static inline function array_unshift(arr:NativeArray, value1:Dynamic) : Int return untyped __call__('array_unshift', arr, value1);
	
	public static inline function array_values(arr:NativeArray) : NativeArray return untyped __call__('array_values', arr);
	
	public static function array_walk_recursive(arr:NativeArray, callback:Dynamic->Void, ?userdata:Dynamic) : Bool
	{
		if (userdata == null)
		{
			return untyped __call__('array_walk_recursive', arr, callback);
		}
		else
		{
			return untyped __call__('array_walk_recursive', arr, callback, userdata);
		}
	}

	
	public static function array_walk(arr:NativeArray, callback:Dynamic->Void, ?userdata:Dynamic) : Bool
	{
		if (userdata == null)
		{
			return untyped __call__('array_walk', arr, callback);
		}
		else
		{
			return untyped __call__('array_walk', arr, callback, userdata);
		}
	}

	
	public static function arsort(arr:NativeArray, ?sort_flags:Int) : Bool
	{
		if (sort_flags == null)
		{
			return untyped __call__('arsort', arr);
		}
		else
		{
			return untyped __call__('arsort', arr, sort_flags);
		}
	}
	
	public static function asort(arr:NativeArray, ?sort_flags:Int) : Bool
	{
		if (sort_flags == null)
		{
			return untyped __call__('asort', arr);
		}
		else
		{
			return untyped __call__('asort', arr, sort_flags);
		}
	}
	
	public static function compact(varname1:Dynamic, ?restArgs:Dynamic) : NativeArray
	{
		if (restArgs == null)
		{
			return untyped __call__('compact', varname1);
		}
		else
		{
			return untyped __call__('compact', varname1, restArgs);
		}
	}

	
	public static function count(array_or_countable:Dynamic, ?mode:Int) : Int
	{
		if (mode == null)
		{
			return untyped __call__('count', array_or_countable);
		}
		else
		{
			return untyped __call__('count', array_or_countable, mode);
		}
	}
	
	public static inline function current(arr:NativeArray) : Dynamic return untyped __call__('current', arr);
	
	public static inline function each(arr:NativeArray) : NativeArray return untyped __call__('each', arr);
	
	public static inline function end(arr:NativeArray) : Dynamic return untyped __call__('end', arr);
	
	public static function extract(arr:NativeArray, ?flags:Int, ?prefix:String) : Int
	{
		if (prefix == null)
		{
			if (flags == null)
			{
				return untyped __call__('extract', arr);
			}
			else
			{
				return untyped __call__('extract', arr, flags);
			}
		}
		else
		{
			return untyped __call__('extract', arr, flags, prefix);
		}
	}
	
	public static inline function in_array(needle:Dynamic, haystack:NativeArray, ?strict:Bool=false) : Bool return untyped __call__('in_array', needle, haystack, strict);
	
	public static inline function key(arr:NativeArray) : Dynamic return untyped __call__('key', arr);
	
	public static function krsort(arr:NativeArray, ?sort_flags:Int) : Bool
	{
		if (sort_flags == null)
		{
			return untyped __call__('krsort', arr);
		}
		else
		{
			return untyped __call__('krsort', arr, sort_flags);
		}
	}
	
	public static function ksort(arr:NativeArray, ?sort_flags:Int) : Bool
	{
		if (sort_flags == null)
		{
			return untyped __call__('ksort', arr);
		}
		else
		{
			return untyped __call__('ksort', arr, sort_flags);
		}
	}
	
	public static inline function natcasesort(arr:NativeArray) : Bool return untyped __call__('natcasesort', arr);
	
	public static inline function natsort(arr:NativeArray) : Bool return untyped __call__('natsort', arr);
	
	public static inline function next(arr:NativeArray) : Dynamic return untyped __call__('next', arr);
	
	public static inline function prev(arr:NativeArray) : Dynamic return untyped __call__('prev', arr);
	
	public static inline function range(start:Dynamic, end:Dynamic, ?step=1) : NativeArray return untyped __call__('range', start, end, step);
	
	public static inline function reset(arr:NativeArray) : Dynamic return untyped __call__('reset', arr);
	
	public static function rsort(arr:NativeArray, ?sort_flags:Int) : Bool
	{
		if (sort_flags == null)
		{
			return untyped __call__('rsort', arr);
		}
		else
		{
			return untyped __call__('rsort', arr, sort_flags);
		}
	}
	
	public static inline function shuffle(arr:NativeArray) : Bool return untyped __call__('shuffle', arr);
	
	public static inline function sort(arr:NativeArray) : Bool return untyped __call__('sort', arr);
	
	public static inline function sortWithFlags(arr:NativeArray, sort_flags:Int) : Bool return untyped __call__('sort', arr, sort_flags);
	
	public static inline function uasort(arr:NativeArray, value_compare_func:Dynamic->Dynamic->Int) : Bool return untyped __call__('uasort', arr, value_compare_func);
	
	public static inline function uksort(arr:NativeArray, key_compare_func:Dynamic->Dynamic->Int) : Bool return untyped __call__('uksort', arr, key_compare_func);
	
	public static inline function usort(arr:NativeArray, value_compare_func:Dynamic->Dynamic->Int) : Bool return untyped __call__('usort', arr, value_compare_func);
	
	public static inline function exists(arr:NativeArray, callback:Dynamic->Bool) return Global.current(Global.array_filter(arr, callback));
}
*/