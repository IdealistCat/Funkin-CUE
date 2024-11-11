package data.jsons;

import haxe.Json;

typedef FreeplayJSON =
{
	// Strings \\
	public var songName:String;
	public var charIcon:String;

	// Numbers \\
	public var bpm:Float;
	public var rating:Int;

	// Arrays \\
	public var difficulties:Array<String>;
}

class JSONmanager
{
	public static function initJSON(myjson:FreeplayJSON):FreeplayJSON
	{
		var json:FreeplayJSON;

		json.songName ??= 'unnamed';
		json.charIcon ??= 'face';
		json.bpm ??= 150;
		json.rating ??= 1;
		json.difficulties ??= ['normal'];

		return json;
	}
}
