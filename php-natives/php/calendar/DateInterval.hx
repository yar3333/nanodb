package php.calendar;

@:native("DateInterval")
extern class DateInterval
{
	var y : Int;
	var m : Int;
	var d : Int;
	var h : Int;
	var i : Int;
	var s : Int;
	var invert : Int;
	var days : Dynamic;

	function new(interval_spec:String) : Void;
	static function createFromDateString(time:String) : DateInterval;
	function format(format:String) : String;
}
