package generator;

import php.TypedArray;

class OrmPositions
{
	var names : TypedArray<String>;
	
	public function new(names:TypedArray<String>) 
	{
		this.names = names;
	}
	
	public function is(table:String, name:String)
	{
		return names.hasValue(table + "." + name)
		    || names.hasValue("*." + name)
			|| names.hasValue(name);
	}
}