package php;

class JsonNatives
{
	/**
	 * No error has occurred. Available since PHP 5.3.0. 
	 */
	public static var JSON_ERROR_NONE(get, never) : Int; private static inline function get_JSON_ERROR_NONE() : Int return untyped __php__("JSON_ERROR_NONE");

	/**
	 * The maximum stack depth has been exceeded. Available since PHP 5.3.0. 
	 */
	public static var JSON_ERROR_DEPTH(get, never) : Int; private static inline function get_JSON_ERROR_DEPTH() : Int return untyped __php__("JSON_ERROR_DEPTH");

	/**
	 * Occurs with underflow or with the modes mismatch. Available since PHP 5.3.0. 
	 */
	public static var JSON_ERROR_STATE_MISMATCH(get, never) : Int; private static inline function get_JSON_ERROR_STATE_MISMATCH() : Int return untyped __php__("JSON_ERROR_STATE_MISMATCH");

	/**
	 * Control character error, possibly incorrectly encoded. Available since PHP 5.3.0. 
	 */
	public static var JSON_ERROR_CTRL_CHAR(get, never) : Int; private static inline function get_JSON_ERROR_CTRL_CHAR() : Int return untyped __php__("JSON_ERROR_CTRL_CHAR");

	/**
	 * Syntax error. Available since PHP 5.3.0. 
	 */
	public static var JSON_ERROR_SYNTAX(get, never) : Int; private static inline function get_JSON_ERROR_SYNTAX() : Int return untyped __php__("JSON_ERROR_SYNTAX");

	/**
	 * Malformed UTF-8 characters, possibly incorrectly encoded. This constant is available as of PHP 5.3.3. 
	 */
	public static var JSON_ERROR_UTF8(get, never) : Int; private static inline function get_JSON_ERROR_UTF8() : Int return untyped __php__("JSON_ERROR_UTF8");

	/**
	 * The object or array passed to json_encode() include recursive references and cannot be encoded. If the JSON_PARTIAL_OUTPUT_ON_ERROR option was given, NULL will be encoded in the place of the recursive reference.
	 */
	public static var JSON_ERROR_RECURSION(get, never) : Int; private static inline function get_JSON_ERROR_RECURSION() : Int return untyped __php__("JSON_ERROR_RECURSION");

	/**
	 * The value passed to json_encode() includes either NAN or INF. If the JSON_PARTIAL_OUTPUT_ON_ERROR option was given, 0 will be encoded in the place of these special numbers.
	 */
	public static var JSON_ERROR_INF_OR_NAN(get, never) : Int; private static inline function get_JSON_ERROR_INF_OR_NAN() : Int return untyped __php__("JSON_ERROR_INF_OR_NAN");

	/**
	 * A value of an unsupported type was given to json_encode(), such as a resource. If the JSON_PARTIAL_OUTPUT_ON_ERROR option was given, NULL will be encoded in the place of the unsupported value.
	 */
	public static var JSON_ERROR_UNSUPPORTED_TYPE(get, never) : Int; private static inline function get_JSON_ERROR_UNSUPPORTED_TYPE() : Int return untyped __php__("JSON_ERROR_UNSUPPORTED_TYPE");

	/**
	 * All < and > are converted to \u003C and \u003E. Available since PHP 5.3.0. 
	 */
	public static var JSON_HEX_TAG(get, never) : Int; private static inline function get_JSON_HEX_TAG() : Int return untyped __php__("JSON_HEX_TAG");

	/**
	 * All &s are converted to \u0026. Available since PHP 5.3.0. 
	 */
	public static var JSON_HEX_AMP(get, never) : Int; private static inline function get_JSON_HEX_AMP() : Int return untyped __php__("JSON_HEX_AMP");

	/**
	 * All ' are converted to \u0027. Available since PHP 5.3.0. 
	 */
	public static var JSON_HEX_APOS(get, never) : Int; private static inline function get_JSON_HEX_APOS() : Int return untyped __php__("JSON_HEX_APOS");

	/**
	 * All " are converted to \u0022. Available since PHP 5.3.0. 
	 */
	public static var JSON_HEX_QUOT(get, never) : Int; private static inline function get_JSON_HEX_QUOT() : Int return untyped __php__("JSON_HEX_QUOT");

	/**
	 * Outputs an object rather than an array when a non-associative array is used. Especially useful when the recipient of the output is expecting an object and the array is empty. Available since PHP 5.3.0. 
	 */
	public static var JSON_FORCE_OBJECT(get, never) : Int; private static inline function get_JSON_FORCE_OBJECT() : Int return untyped __php__("JSON_FORCE_OBJECT");

	/**
	 * Encodes numeric strings as numbers. Available since PHP 5.3.3. 
	 */
	public static var JSON_NUMERIC_CHECK(get, never) : Int; private static inline function get_JSON_NUMERIC_CHECK() : Int return untyped __php__("JSON_NUMERIC_CHECK");

	/**
	 * Encodes large integers as their original string value. Available since PHP 5.4.0. 
	 */
	public static var JSON_BIGINT_AS_STRING(get, never) : Int; private static inline function get_JSON_BIGINT_AS_STRING() : Int return untyped __php__("JSON_BIGINT_AS_STRING");

	/**
	 * Use whitespace in returned data to format it. Available since PHP 5.4.0. 
	 */
	public static var JSON_PRETTY_PRINT(get, never) : Int; private static inline function get_JSON_PRETTY_PRINT() : Int return untyped __php__("JSON_PRETTY_PRINT");

	/**
	 * Don't escape /. Available since PHP 5.4.0. 
	 */
	public static var JSON_UNESCAPED_SLASHES(get, never) : Int; private static inline function get_JSON_UNESCAPED_SLASHES() : Int return untyped __php__("JSON_UNESCAPED_SLASHES");

	/**
	 * Encode multibyte Unicode characters literally (default is to escape as \uXXXX). Available since PHP 5.4.0. 
	 */
	public static var JSON_UNESCAPED_UNICODE(get, never) : Int; private static inline function get_JSON_UNESCAPED_UNICODE() : Int return untyped __php__("JSON_UNESCAPED_UNICODE");

	/**
	 * Substitute some unencodable values instead of failing. Available since PHP 5.5.0. 
	 */
	public static var JSON_PARTIAL_OUTPUT_ON_ERROR(get, never) : Int; private static inline function get_JSON_PARTIAL_OUTPUT_ON_ERROR() : Int return untyped __php__("JSON_PARTIAL_OUTPUT_ON_ERROR");

	/**
	 * Ensures that float values are always encoded as a float value. Available since PHP 5.6.6. 
	 */
	public static var JSON_PRESERVE_ZERO_FRACTION(get, never) : Int; private static inline function get_JSON_PRESERVE_ZERO_FRACTION() : Int return untyped __php__("JSON_PRESERVE_ZERO_FRACTION");
	
	public static inline function json_decode(json:String, ?assoc:Bool=false, ?depth:Int=512, options=0) : Dynamic return untyped __call__('json_decode', json, assoc, depth, options);
	public static inline function json_encode(value:Dynamic, options=0, ?depth:Int=512) : String return untyped __call__('json_encode', value, options, depth);
	public static inline function json_last_error_msg() : String return untyped __call__('json_last_error_msg');
	public static inline function json_last_error() : Int return untyped __call__('json_last_error');
}
