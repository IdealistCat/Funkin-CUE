package data.jsons;

import haxe.Json;

typedef WeekJSON =
{
	public var list:Array<String>;
	public var asset:String;
}

class JSONmanager
{
	public function new()
	{
		trace('Week JSON Manager init');
	}

	public function initJSON(myjson)
	{
        var json:WeekJSON = myjson;

        json.list ??= ["Tutorial"];
        json.asset ??= "tutorial";

        return json;
	}
}
