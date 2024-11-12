package testing;

import haxe.Json;
import lime.utils.Assets;
import utilities.AssetPaths;
import data.jsons.Week.WeekJSON as WJ;
import data.jsons.Week.WeekJSONmanager;
import flixel.text.FlxText;

class WeekJSON extends MusicBeatState {
    var data:FlxText = new FlxText("Hello", 16);
    
    override public function create()
    {
        var curpath:String = '${AssetPaths.WEEK_DATA_FOLDER}/week1.json';
		var err:String = '"$curpath"'+" doesn't exist";
        try{
            var songJSON:WJ = Json.parse(Assets.getText('$curpath'));
            data.text = songJSON.list[0];
        } catch(e) {
            trace(err);
            data.text = err;
        }
        
        data.screenCenter();
        add(data);

        super.create();
    }
}