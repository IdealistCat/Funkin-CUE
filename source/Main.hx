package;

import engine.modding.ModInit;
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

		ModInit.init();

		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end
	}
}
