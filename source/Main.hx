package;

import openfl.Assets;
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

		//Here is where you would load your config and/or save data from file
		//(in this example, we just grab a fake config.xml from assets, 
		//but you should load them from wherever your app stores them)
		#if (windows || mac || linux)
			var fakeConfigFile:String = Assets.getText("assets/config.xml");
			crashDumper.session.files.set("config.xml", fakeConfigFile);
		#end

		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end
	}
}
