package php;

class CtypeNatives
{
	public static inline function ctype_alnum(text:String) : Bool return untyped __call__('ctype_alnum', text);
	public static inline function ctype_alpha(text:String) : Bool return untyped __call__('ctype_alpha', text);
	public static inline function ctype_cntrl(text:String) : Bool return untyped __call__('ctype_cntrl', text);
	public static inline function ctype_digit(text:String) : Bool return untyped __call__('ctype_digit', text);
	public static inline function ctype_graph(text:String) : Bool return untyped __call__('ctype_graph', text);
	public static inline function ctype_lower(text:String) : Bool return untyped __call__('ctype_lower', text);
	public static inline function ctype_print(text:String) : Bool return untyped __call__('ctype_print', text);
	public static inline function ctype_punct(text:String) : Bool return untyped __call__('ctype_punct', text);
	public static inline function ctype_space(text:String) : Bool return untyped __call__('ctype_space', text);
	public static inline function ctype_upper(text:String) : Bool return untyped __call__('ctype_upper', text);
	public static inline function ctype_xdigit(text:String) : Bool return untyped __call__('ctype_xdigit', text);
}
