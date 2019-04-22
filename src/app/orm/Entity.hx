package orm;

import php.TypedArray;
import php.TypedAssoc;

extern class Entity
{
    private function serializeProperty(methodSuffix:String, property:String, dest:TypedAssoc<String, Dynamic>) : Void;
    private function deserializeProperty(methodSuffix:String, property:String, src:TypedAssoc<String, Dynamic>) : Void;

    private function serializePropertyIgnoreNull(data:TypedAssoc<String, Dynamic>, property:String) : Void;

    function jsonSerialize() : TypedAssoc<String, Dynamic>;
    function jsonDeserialize(data:TypedAssoc<String, Dynamic>) : Void;

    function dbSerialize(excludeProperties:TypedArray<String>): TypedAssoc<String, Dynamic>;
    function dbDeserialize(data:TypedAssoc<String, Dynamic>) : Void
}