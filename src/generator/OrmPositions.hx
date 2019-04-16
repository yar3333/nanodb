package generator;

import php.TypedArray;
import php.TypedAssoc;

class OrmPositions
{
	var names : TypedArray<String>;
	
	public function new(names:TypedArray<String>) 
	{
		this.names = names;
	}
	
	public function is(v:{ table:String, name:String })
	{
		return names.hasValue(v.table + "." + v.name)
		    || names.hasValue("*." + v.name)
			|| names.hasValue(v.name);
	}
}