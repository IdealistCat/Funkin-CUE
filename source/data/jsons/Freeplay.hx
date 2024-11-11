package data.jsons;

import haxe.Json;

typedef FreeplayJSON =
{
	// Strings \\
	public var songName:String;
	public var charIcon:String;

	// Numbers \\
	public var rating:Int;

	// Arrays \\
	public var difficulties:Array<String>;
}

class JSONmanager
{
	public function new()
	{
		trace('Freeplay JSON Manager init');
	}

	public function initJSON(myjson):FreeplayJSON
	{
		var json:FreeplayJSON;

		json = Json.parse(myjson);

		json.songName ??= 'unnamed';
		json.charIcon ??= 'face';
		if (json.rating == null) json.rating = 1;
		json.difficulties ??= ['normal'];

		return json;
	}
}
