package php.calendar;

@:native("DateTimeInterface")
extern interface DateTimeInterface
{
	function diff(datetime2:DateTimeInterface, ?absolute:Bool) : DateInterval;
	function format(format:String) : String;
	function getOffset() : Int;
	function getTimestamp() : Int;
	function getTimezone() : DateTimeZone;
	function __wakeup() : Void;
}
