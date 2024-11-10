package;

import crashdumper.SessionData;
import crashdumper.CrashDumper;
import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, TitleState));

		var unique_id:String = SessionData.generateID("FNFCUE");
		// generates unique id: "FNFCUE_YYYY-MM-DD_HH'MM'SS_CRASH"

		var crashDumper = new CrashDumper(unique_id);
		// starts the crashDumper

		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end
	}
}
