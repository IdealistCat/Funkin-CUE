package menus.story;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import utilities.AssetPaths;

class MenuCharacter extends FlxSprite
{
	public var character:String;

	public function new(x:Float, character:String = 'bf')
	{
		super(x);

		this.character = character;

		animStuff();
	}

	public function reloadChar(newchar:String = 'bf')
	{
		this.character = newchar;
		animStuff();
	}

	public function animStuff()
	{
		try {var tex = FlxAtlasFrames.fromSparrow('${AssetPaths.STORYMENU_FOLDER}/$character.png', '${AssetPaths.STORYMENU_FOLDER}/$character.xml');
		frames = tex;}catch(e){trace('uhoh');}

		switch (character)
		{
			case 'bf':
				animation.addByPrefix('bf', "BF idle dance white", 24);
				animation.addByPrefix('bfConfirm', 'BF HEY!!', 24, false);
			case 'gf':
				animation.addByPrefix('gf', "GF Dancing Beat WHITE", 24);
			case 'dad':
				animation.addByPrefix('dad', "Dad idle dance BLACK LINE", 24);
			case 'spooky-kids':
				animation.addByPrefix('spooky-kids', "spooky dance idle BLACK LINES", 24);
			case 'pico':
				animation.addByPrefix('pico', "Pico Idle Dance", 24);
			case 'mom':
				animation.addByPrefix('mom', "Mom Idle BLACK LINES", 24);
			case 'parents-christmas':
				animation.addByPrefix('parents-christmas', "Parent Christmas Idle", 24);
			case 'senpai':
				animation.addByPrefix('senpai', "SENPAI idle Black Lines", 24);
			default:
				this.visible = false;
		}
		// Parent Christmas Idle

		try{animation.play(character);
		updateHitbox();}catch(e){trace('uhoh2');}
	}
}
