package php;

class DatetimeNatives
{
	public static inline function checkdate(month:Int, day:Int, year:Int) : Bool return untyped __call__('checkdate', month, day, year);
	
	public static inline function date_default_timezone_get() : String return untyped __call__('date_default_timezone_get');
	
	public static inline function date_default_timezone_set(timezone_identifier:String) : Bool return untyped __call__('date_default_timezone_set', timezone_identifier);
	
	public static inline function date_parse_from_format(format:String, date:String) : NativeArray return untyped __call__('date_parse_from_format', format, date);
	
	public static inline function date_parse(date:String) : NativeArray return untyped __call__('date_parse', date);
	
	public static inline function date_sun_info(time:Int, latitude:Float, longitude:Float) : NativeArray return untyped __call__('date_sun_info', time, latitude, longitude);
	
	public static function date_sunrise(timestamp:Int, ?format:Int, ?latitude:Float, ?longitude:Float, ?zenith:Float, gmt_offset=0.0) : Dynamic
	{
		if (zenith == null)
		{
			if (longitude == null)
			{
				if (latitude == null)
				{
					if (format == null)
					{
						return untyped __call__('date_sunrise', timestamp);
					}
					else
					{
						return untyped __call__('date_sunrise', timestamp, format);
					}
				}
				else
				{
					return untyped __call__('date_sunrise', timestamp, format, latitude);
				}
			}
			else
			{
				return untyped __call__('date_sunrise', timestamp, format, latitude, longitude);
			}
		}
		else
		{
			return untyped __call__('date_sunrise', timestamp, format, latitude, longitude, zenith, gmt_offset);
		}
	}
	
	public static function date_sunset(timestamp:Int, ?format:Int, ?latitude:Float, ?longitude:Float, ?zenith:Float, gmt_offset=0.0) : Dynamic
	{
		if (zenith == null)
		{
			if (longitude == null)
			{
				if (latitude == null)
				{
					if (format == null)
					{
						return untyped __call__('date_sunset', timestamp);
					}
					else
					{
						return untyped __call__('date_sunset', timestamp, format);
					}
				}
				else
				{
					return untyped __call__('date_sunset', timestamp, format, latitude);
				}
			}
			else
			{
				return untyped __call__('date_sunset', timestamp, format, latitude, longitude);
			}
		}
		else
		{
			return untyped __call__('date_sunset', timestamp, format, latitude, longitude, zenith, gmt_offset);
		}
	}
	
	public static function date(format:String, ?timestamp:Int) : String
	{
		if (timestamp == null)
		{
			return untyped __call__('date', format);
		}
		else
		{
			return untyped __call__('date', format, timestamp);
		}
	}
	
	public static function getdate(?timestamp:Int) : NativeArray
	{
		if (timestamp == null)
		{
			return untyped __call__('getdate');
		}
		else
		{
			return untyped __call__('getdate', timestamp);
		}
	}
	
	public static inline function gettimeofday(return_float=false) : Dynamic return untyped __call__('gettimeofday', return_float);
	
	public static function gmdate(format:String, ?timestamp:Int) : String
	{
		if (timestamp == null)
		{
			return untyped __call__('gmdate', format);
		}
		else
		{
			return untyped __call__('gmdate', format, timestamp);
		}
	}
	
	public static function gmmktime(?hour:Int, ?minute:Int, ?second:Int, ?month:Int, ?day:Int, ?year:Int, is_dst=-1) : Int
	{
		if (year == null)
		{
			if (day == null)
			{
				if (month == null)
				{
					if (second == null)
					{
						if (minute == null)
						{
							if (hour == null)
							{
								return untyped __call__('gmmktime');
							}
							else
							{
								return untyped __call__('gmmktime', hour);
							}
						}
						else
						{
							return untyped __call__('gmmktime', hour, minute);
						}
					}
					else
					{
						return untyped __call__('gmmktime', hour, minute, second);
					}
				}
				else
				{
					return untyped __call__('gmmktime', hour, minute, second, month);
				}
			}
			else
			{
				return untyped __call__('gmmktime', hour, minute, second, month, day);
			}
		}
		else
		{
			return untyped __call__('gmmktime', hour, minute, second, month, day, year, is_dst);
		}
	}
	
	public static function gmstrftime(format:String, ?timestamp:Int) : String
	{
		if (timestamp == null)
		{
			return untyped __call__('gmstrftime', format);
		}
		else
		{
			return untyped __call__('gmstrftime', format, timestamp);
		}
	}
	
	public static function idate(format:String, ?timestamp:Int) : Int
	{
		if (timestamp == null)
		{
			return untyped __call__('idate', format);
		}
		else
		{
			return untyped __call__('idate', format, timestamp);
		}
	}
	
	public static function localtime(?timestamp:Int, is_associative=false) : NativeArray
	{
		if (timestamp == null)
		{
			return untyped __call__('localtime');
		}
		else
		{
			return untyped __call__('localtime', timestamp, is_associative);
		}
	}
	
	public static inline function microtime(get_as_float=false) : Dynamic return untyped __call__('microtime', get_as_float);
	
	public static function mktime(?hour:Int, ?minute:Int, ?second:Int, ?month:Int, ?day:Int, ?year:Int, is_dst=-1) : Int
	{
		if (year == null)
		{
			if (day == null)
			{
				if (month == null)
				{
					if (second == null)
					{
						if (minute == null)
						{
							if (hour == null)
							{
								return untyped __call__('mktime');
							}
							else
							{
								return untyped __call__('mktime', hour);
							}
						}
						else
						{
							return untyped __call__('mktime', hour, minute);
						}
					}
					else
					{
						return untyped __call__('mktime', hour, minute, second);
					}
				}
				else
				{
					return untyped __call__('mktime', hour, minute, second, month);
				}
			}
			else
			{
				return untyped __call__('mktime', hour, minute, second, month, day);
			}
		}
		else
		{
			return untyped __call__('mktime', hour, minute, second, month, day, year, is_dst);
		}
	}
	
	public static function strftime(format:String, ?timestamp:Int) : String
	{
		if (timestamp == null)
		{
			return untyped __call__('strftime', format);
		}
		else
		{
			return untyped __call__('strftime', format, timestamp);
		}
	}
	
	public static inline function strptime(date:String, format:String) : NativeArray return untyped __call__('strptime', date, format);
	
	public static function strtotime(time:String, ?now:Int) : Int
	{
		if (now == null)
		{
			return untyped __call__('strtotime', time);
		}
		else
		{
			return untyped __call__('strtotime', time, now);
		}
	}
	
	public static inline function time() : Int return untyped __call__('time');
	
	public static inline function timezone_name_from_abbr(abbr:String, gmtOffset=-1, isdst=-1) : String return untyped __call__('timezone_name_from_abbr', abbr, gmtOffset, isdst);
	
	public static inline function timezone_version_get() : String return untyped __call__('timezone_version_get');
}
