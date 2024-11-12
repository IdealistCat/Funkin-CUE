package data.jsons;

import haxe.Json;

typedef FreeplayJSON =
{
	public var songList:Array<String>;
}

class JSONmanager
{
	public function new()
	{
		// trace('Freeplay JSON Manager init');
	}

	public function initJSON(myjson):FreeplayJSON
	{
		var json:FreeplayJSON;

		json = Json.parse(myjson);

		return json;
	}
}
