package menus.options;

import funkin.ui.AtlasText;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import utilities.AssetPaths;

class OptionsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var optionmenus:Array<String> = [
		"Graphics",
		"Gameplay",
		"UI"
	];

	private var grpControls:FlxTypedGroup<AtlasText>;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic('${AssetPaths.IMAGE_FOLDER}/menuDesat.png');
		menuBG.color = 0x7F006666;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<AtlasText>();
		add(grpControls);

		for (i in 0...optionmenus.length)
		{
			var controlLabel:AtlasText = new AtlasText(0, (70 * i) + 30, optionmenus[i], AtlasFont.BOLD);
			controlLabel.ID = i;
			controlLabel.screenCenter();
			grpControls.add(controlLabel);
		}
		
		changeSelection(0);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			var selected:String = optionmenus[curSelected];
			switch(selected)
			{
				default:
					trace('No case for section: "$selected"');
			}
		}

		if (controls.BACK)
			FlxG.switchState(new MainMenuState());
		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play('${AssetPaths.SOUND_FOLDER}/scrollMenu' + AssetPaths.soundExt, 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		for (item in grpControls.members)
		{
			item.alpha = 0.6;
			if (item.ID == curSelected)
			{
				item.alpha = 1;
			}
		}
	}
}
