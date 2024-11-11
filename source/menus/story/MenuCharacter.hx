package menus.story;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import utilities.AssetPaths;

class MenuCharacter extends FlxSprite
{
	public var character:String;

	var file:String = 'storymenu/characters/';

	public function new(x:Float, character:String = 'bf')
	{
		super(x);

		this.character = character;

		file += character;

		var tex:FlxAtlasFrames = try { spritesheet(); } catch(e) { file = 'campaign_menu_UI_characters'; spritesheet(); }
		frames = tex;

		animation.addByPrefix('bf', "BF idle dance white", 24);
		animation.addByPrefix('bfConfirm', 'BF HEY!!', 24, false);
		animation.addByPrefix('gf', "GF Dancing Beat WHITE", 24);
		animation.addByPrefix('dad', "Dad idle dance BLACK LINE", 24);
		animation.addByPrefix('spooky', "spooky dance idle BLACK LINES", 24);
		animation.addByPrefix('pico', "Pico Idle Dance", 24);
		animation.addByPrefix('mom', "Mom Idle BLACK LINES", 24);
		animation.addByPrefix('parents-christmas', "Parent Christmas Idle", 24);
		animation.addByPrefix('senpai', "SENPAI idle Black Lines", 24);
		// Parent Christmas Idle

		animation.play(character);
		updateHitbox();
	}

	public function spritesheet()
	{
		return FlxAtlasFrames.fromSparrow('${AssetPaths.IMAGE_FOLDER}/$file.png', '${AssetPaths.IMAGE_FOLDER}/$file.xml');
	}
}
