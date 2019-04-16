package php.calendar;

@:native("DateTime")
extern class DateTime implements DateTimeInterface
{
	static var ATOM(default, null) : String;
	static var COOKIE(default, null) : String;
	static var ISO8601(default, null) : String;
	static var RFC822(default, null) : String;
	static var RFC850(default, null) : String;
	static var RFC1036(default, null) : String;
	static var RFC1123(default, null) : String;
	static var RFC2822(default, null) : String;
	static var RFC3339(default, null) : String;
	static var RSS(default, null) : String;
	static var W3C(default, null) : String;

	function new(?time:String, ?timezone:DateTimeZone) : Void;
	function add(interval:DateInterval) : DateTime;
	static function createFromFormat(format:String, time:String, ?timezone:DateTimeZone) : DateTime;
	static function getLastErrors() : NativeArray;
	function modify(modify:String) : DateTime;
	static function __set_state(arr:NativeArray) : DateTime;
	function setDate(year:Int, month:Int, day:Int) : DateTime;
	function setISODate(year:Int, week:Int, ?day:Int) : DateTime;
	function setTime(hour:Int, minute:Int, ?second:Int) : DateTime;
	function setTimestamp(unixtimestamp:Int) : DateTime;
	function setTimezone(timezone:DateTimeZone) : DateTime;
	function sub(interval:DateInterval) : DateTime;
	function diff(datetime2:DateTimeInterface, ?absolute:Bool) : DateInterval;
	function format(format:String) : String;
	function getOffset() : Int;
	function getTimestamp() : Int;
	function getTimezone() : DateTimeZone;
	function __wakeup() : Void;
}
