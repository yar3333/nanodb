package php.imap;

class ImapSortFlags
{
	/**
	 * message Date
	 */
	public static var SORTDATE(get, never) : Int; private static inline function get_SORTDATE() : Int return untyped __php__("SORTDATE");
	
	/**
	 * arrival date
	 */
	public static var SORTARRIVAL(get, never) : Int; private static inline function get_SORTARRIVAL() : Int return untyped __php__("SORTARRIVAL");
	
	/**
	 * mailbox in first From address
	 */
	public static var SORTFROM(get, never) : Int; private static inline function get_SORTFROM() : Int return untyped __php__("SORTFROM");
	
	/**
	 * message subject
	 */
	public static var SORTSUBJECT(get, never) : Int; private static inline function get_SORTSUBJECT() : Int return untyped __php__("SORTSUBJECT");
	
	/**
	 * mailbox in first To address
	 */
	public static var SORTTO(get, never) : Int; private static inline function get_SORTTO() : Int return untyped __php__("SORTTO");
	
	/**
	 * mailbox in first cc address
	 */
	public static var SORTCC(get, never) : Int; private static inline function get_SORTCC() : Int return untyped __php__("SORTCC");
	
	/**
	 * size of message in octets
	 */
	public static var SORTSIZE(get, never) : Int; private static inline function get_SORTSIZE() : Int return untyped __php__("SORTSIZE");
}