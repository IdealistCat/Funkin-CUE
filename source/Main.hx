package;

import flixel.util.typeLimit.NextState.InitialState;
import flixel.FlxBasic;
import menus.TitleState;
import openfl.Assets;
import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		var state:InitialState = TitleState;

		addChild(new FlxGame(0, 0, state));

		#if !mobile
		addChild(new FPS(10, 3, 0xFFFFFF));
		#end
	}
}
