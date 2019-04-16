package php.calendar;

@:native("DateTimeZone")
extern class DateTimeZone
{
	static var AFRICA(default, null) : Int;
	static var AMERICA(default, null) : Int;
	static var ANTARCTICA(default, null) : Int;
	static var ARCTIC(default, null) : Int;
	static var ASIA(default, null) : Int;
	static var ATLANTIC(default, null) : Int;
	static var AUSTRALIA(default, null) : Int;
	static var EUROPE(default, null) : Int;
	static var INDIAN(default, null) : Int;
	static var PACIFIC(default, null) : Int;
	static var UTC(default, null) : Int;
	static var ALL(default, null) : Int;
	static var ALL_WITH_BC(default, null) : Int;
	static var PER_COUNTRY(default, null) : Int;

	function new(timezone:String) : Void;
	function getLocation() : NativeArray;
	function getName() : String;
	function getOffset(datetime:DateTime) : Int;
	function getTransitions(?timestamp_begin:Int, ?timestamp_end:Int) : NativeArray;
	static function listAbbreviations() : NativeArray;
	static function listIdentifiers(?what:Int, ?country:String) : NativeArray;
}
