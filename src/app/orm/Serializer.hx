package orm;

import php.Global;
import php.NativeArray;
import php.Syntax;
import php.TypedArray;
import php.TypedAssoc;

class Serializer implements ISerializer
{
	public function serializeObject(src:Dynamic, properties:TypedArray<String> = null) : NativeArray
	{
		if (properties == null) properties = cast Global.array_keys(Global.get_object_vars(src));
		
		var r: TypedAssoc<String, Dynamic> = cast Syntax.arrayDecl();
		Syntax.foreach(properties, function(k, v) {
			r[v] = Syntax.field(src, v);
		});
		return r;
	}
	
	public function deserializeObject(src:NativeArray, dest:Dynamic, properties:TypedArray<String> = null) : Void
	{
		if (properties == null) properties = cast Global.array_keys(Global.get_object_vars(dest));
		
		Syntax.foreach(properties, function(k, v) {
			Syntax.setField(dest, v, src[v]);
		});
	}
}