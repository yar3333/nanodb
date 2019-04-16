package php.calendar;

import php.interfaces.Traversable;

@:native("DatePeriod")
extern class DatePeriod implements Traversable
{
	static var EXCLUDE_START_DATE(default, null) : Int;

	@:overload(function(start:DateTimeInterface, interval:DateInterval, end:DateTimeInterface, ?options:Int):Void{})
	@:overload(function(isostr:String, ?options:Int):Void{})
	function new(start:DateTimeInterface, interval:DateInterval, recurrences:Int, ?options:Int) : Void;
}
