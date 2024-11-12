package menus;

import haxe.Log;
import data.jsons.Freeplay.JSONmanager as FPJSONmanager;
import sys.io.File;
import data.jsons.Freeplay.FreeplayJSON;
import sys.FileSystem;
import utilities.AssetPaths;
import gameplay.PlayState;
import gameplay.Song;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import Sys;

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<String> = [];

	var selector:FlxText;
	var curSelected:Int = 0;
	var curDifficulty:Int = 1;

	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	override function create()
	{
		var freeplay_song_path:String = '${AssetPaths.DATA_FOLDER}';

		// init this only once!!!!!!!!!!!!
		var jsonmanager:FPJSONmanager = new FPJSONmanager();
		var songlist:Array<String> = [];

		var curpath:String = '$freeplay_song_path/Freeplay.json';
		var err:String = '"$curpath"' + " doesn't exist";

		try
		{
			trace(curpath);
			var songJSON = Assets.getText('$curpath');

			while (!songJSON.endsWith("}"))
			{
				songJSON = songJSON.substr(0, songJSON.length - 1);
				// LOL GOING THROUGH THE BULLSHIT TO CLEAN IDK WHATS STRANGE
			}

			songlist = jsonmanager.initJSON(songJSON).songList;
			trace(songlist);
		}
		catch (e)
		{
			trace(err);
		}

		try
		{
			for (i in 0...songlist.length)
			{
				songs.push(songlist[i]);
			}
		}
		catch (e)
		{
			trace(e);
			songs = ['Tutorial'];
		}

		var bg:FlxSprite = new FlxSprite().loadGraphic('${AssetPaths.IMAGE_FOLDER}/menuBGBlue.png');
		add(bg);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i], true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);
		}

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(AssetPaths.FONT_FOLDER + "/vcr.ttf", 32, FlxColor.WHITE, RIGHT);

		var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 6, 0).makeGraphic(Std.int(FlxG.width * 0.35), 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		add(diffText);

		add(scoreText);

		changeSelection();
		changeDiff();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;

		scoreText.text = "PERSONAL BEST:" + lerpScore;

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.LEFT_P)
			changeDiff(-1);
		if (controls.RIGHT_P)
			changeDiff(1);

		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}

		if (accepted)
		{
			var poop:String = Highscore.formatSong(songs[curSelected].toLowerCase(), curDifficulty);

			trace(poop);

			PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].toLowerCase());
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty;
			FlxG.switchState(new PlayState());
			if (FlxG.sound.music != null)
				FlxG.sound.music.stop();
		}
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = 2;
		if (curDifficulty > 2)
			curDifficulty = 0;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected], curDifficulty);
		#end

		if (curDifficulty > 0)
			diffText.text = "< ";
		else
			diffText.text = "";

		switch (curDifficulty)
		{
			case 0:
				diffText.text += "EASY";
			case 1:
				diffText.text += 'NORMAL';
			case 2:
				diffText.text += "HARD";
		}

		if (curDifficulty < 2)
			diffText.text += " >";
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play('${AssetPaths.SOUND_FOLDER}/scrollMenu' + AssetPaths.soundExt, 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected], curDifficulty);
		#end

		try
		{
			FlxG.sound.playMusic('${AssetPaths.SONG_FOLDER}/' + songs[curSelected] + "_Inst" + AssetPaths.soundExt, 0);
		}
		catch (e)
		{
			var song:String = songs[curSelected];
			trace('cant find the $song track');
		}

		var bullShit:Int = 0;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
	}
}
