package data.jsons;

import haxe.Json;

typedef FreeplayJSON =
{
	public var songName:String;
	public var charIcon:String;
	public var rating:Null<Int>;
	public var order:Null<Int>;
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
		json.rating ??= 1;
		json.order ??= 0;
		json.difficulties ??= ['normal'];

		return json;
	}
}
