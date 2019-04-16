package php;

class MathNatives
{
	public static inline function abs(number:Float) : Float return untyped __call__('abs', number);
	
	public static inline function acos(arg:Float) : Float return untyped __call__('acos', arg);
	
	public static inline function acosh(arg:Float) : Float return untyped __call__('acosh', arg);
	
	public static inline function asin(arg:Float) : Float return untyped __call__('asin', arg);
	
	public static inline function asinh(arg:Float) : Float return untyped __call__('asinh', arg);
	
	public static inline function atan2(y:Float, x:Float) : Float return untyped __call__('atan2', y, x);
	
	public static inline function atan(arg:Float) : Float return untyped __call__('atan', arg);
	
	public static inline function atanh(arg:Float) : Float return untyped __call__('atanh', arg);
	
	public static inline function base_convert(number:String, frombase:Int, tobase:Int) : String return untyped __call__('base_convert', number, frombase, tobase);
	
	public static inline function bindec(binary_string:String) : Float return untyped __call__('bindec', binary_string);
	
	public static inline function ceil(value:Float) : Float return untyped __call__('ceil', value);
	
	public static inline function cos(arg:Float) : Float return untyped __call__('cos', arg);
	
	public static inline function cosh(arg:Float) : Float return untyped __call__('cosh', arg);
	
	public static inline function decbin(number:Int) : String return untyped __call__('decbin', number);
	
	public static inline function dechex(number:Int) : String return untyped __call__('dechex', number);
	
	public static inline function decoct(number:Int) : String return untyped __call__('decoct', number);
	
	public static inline function deg2rad(number:Float) : Float return untyped __call__('deg2rad', number);
	
	public static inline function exp(arg:Float) : Float return untyped __call__('exp', arg);
	
	public static inline function expm1(arg:Float) : Float return untyped __call__('expm1', arg);
	
	public static inline function floor(value:Float) : Dynamic return untyped __call__('floor', value);
	
	public static inline function fmod(x:Float, y:Float) : Float return untyped __call__('fmod', x, y);
	
	public static inline function getrandmax() : Int return untyped __call__('getrandmax');
	
	public static inline function hexdec(hex_string:String) : Float return untyped __call__('hexdec', hex_string);
	
	public static inline function hypot(x:Float, y:Float) : Float return untyped __call__('hypot', x, y);
	
	public static inline function intdiv(dividend:Int, divisor:Int) : Int return untyped __call__('intdiv', dividend, divisor);
	
	public static inline function is_finite(val:Float) : Bool return untyped __call__('is_finite', val);
	
	public static inline function is_infinite(val:Float) : Bool return untyped __call__('is_infinite', val);
	
	public static inline function is_nan(val:Float) : Bool return untyped __call__('is_nan', val);
	
	public static inline function lcg_value() : Float return untyped __call__('lcg_value');
	
	public static inline function log10(arg:Float) : Float return untyped __call__('log10', arg);
	
	public static inline function log1p(number:Float) : Float return untyped __call__('log1p', number);
	
	public static function log(arg:Float, ?base:Float) : Float
	{
		if (base == null)
		{
			return untyped __call__('log', arg);
		}
		else
		{
			return untyped __call__('log', arg, base);
		}
	}
	
	public static inline function max(values:NativeArray) : Dynamic return untyped __call__('max', values);
	
	public static inline function min(values:NativeArray) : Dynamic return untyped __call__('min', values);
	
	public static inline function mt_getrandmax() : Int return untyped __call__('mt_getrandmax');
	
	public static inline function mt_rand(?min:Int, ?max:Int) : Int
	{
		if (untyped __physeq__(min, null) || __physeq__(max, null))
		{
			return untyped __call__('mt_rand');
		}
		else
		{
			return untyped __call__('mt_rand', min, max);
		}
	}
	
	public static function mt_srand(?seed:Int) : Void
	{
		if (seed == null)
		{
			untyped __call__('mt_srand');
		}
		else
		{
			untyped __call__('mt_srand', seed);
		}
	}
	
	public static inline function octdec(octal_string:String) : Float return untyped __call__('octdec', octal_string);
	
	public static inline function pi() : Float return untyped __call__('pi');
	
	public static inline function pow(base:Float, exp:Float) : Float return untyped __call__('pow', base, exp);
	
	public static inline function rad2deg(number:Float) : Float return untyped __call__('rad2deg', number);
	
	public static inline function rand() : Int return untyped __call__('rand');
	
	public static function round(val:Float, precision=0, ?mode:Int) : Float
	{
		if (mode == null)
		{
			return untyped __call__('round', val, precision);
		}
		else
		{
			return untyped __call__('round', val, precision, mode);
		}
	}
	
	public static inline function sin(arg:Float) : Float return untyped __call__('sin', arg);
	
	public static inline function sinh(arg:Float) : Float return untyped __call__('sinh', arg);
	
	public static inline function sqrt(arg:Float) : Float return untyped __call__('sqrt', arg);
	
	public static function srand(?seed:Int) : Void
	{
		if (seed == null)
		{
			untyped __call__('srand');
		}
		else
		{
			untyped __call__('srand', seed);
		}
	}
	
	public static inline function tan(arg:Float) : Float return untyped __call__('tan', arg);
	
	public static inline function tanh(arg:Float) : Float return untyped __call__('tanh', arg);
}
