package gameplay;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import utilities.AssetPaths;

class BackgroundGirls extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		// BG fangirls dissuaded
		frames = FlxAtlasFrames.fromSparrow('${AssetPaths.IMAGE_FOLDER}/weeb/bgFreaks.png', '${AssetPaths.IMAGE_FOLDER}/weeb/bgFreaks.xml');

		animation.addByIndices('danceLeft', 'BG girls group', CoolUtil.numberArray(14), "", 24, false);
		animation.addByIndices('danceRight', 'BG girls group', CoolUtil.numberArray(30, 15), "", 24, false);

		animation.play('danceLeft');
	}

	var danceDir:Bool = false;

	public function getScared():Void
	{
		animation.addByIndices('danceLeft', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
		animation.addByIndices('danceRight', 'BG fangirls dissuaded', CoolUtil.numberArray(30, 15), "", 24, false);
		dance();
	}

	public function dance():Void
	{
		danceDir = !danceDir;

		if (danceDir)
			animation.play('danceRight', true);
		else
			animation.play('danceLeft', true);
	}
}
