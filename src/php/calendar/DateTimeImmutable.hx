package php.calendar;

@:native("DateTimeImmutable")
extern class DateTimeImmutable implements DateTimeInterface
{
	function new(?time:String, ?timezone:DateTimeZone) : Void;
	function add(interval:DateInterval) : DateTimeImmutable;
	static function createFromFormat(format:String, time:String, ?timezone:DateTimeZone) : DateTimeImmutable;
	static function createFromMutable(datetime:DateTime) : DateTimeImmutable;
	static function getLastErrors() : NativeArray;
	function modify(modify:String) : DateTimeImmutable;
	static function __set_state(arr:NativeArray) : DateTimeImmutable;
	function setDate(year:Int, month:Int, day:Int) : DateTimeImmutable;
	function setISODate(year:Int, week:Int, ?day:Int) : DateTimeImmutable;
	function setTime(hour:Int, minute:Int, ?second:Int) : DateTimeImmutable;
	function setTimestamp(unixtimestamp:Int) : DateTimeImmutable;
	function setTimezone(timezone:DateTimeZone) : DateTimeImmutable;
	function sub(interval:DateInterval) : DateTimeImmutable;
	function diff(datetime2:DateTimeInterface, ?absolute:Bool) : DateInterval;
	function format(format:String) : String;
	function getOffset() : Int;
	function getTimestamp() : Int;
	function getTimezone() : DateTimeZone;
	function __wakeup() : Void;
}
