package gameplay;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import utilities.AssetPaths;
import menus.*;

class GameOverSubstate extends MusicBeatSubstate
{
	var bf:Boyfriend;
	var extrabf:Boyfriend = null;

	var camFollow:FlxObject;

	var stageSuffix:String = "";

	public function new(x:Float, y:Float)
	{
		var daStage = PlayState.curStage;
		var daBf:String = '';
		switch (daStage)
		{
			case 'school' | 'schoolEvil':
				stageSuffix = '-pixel';
				daBf = 'bf-pixel-dead';

			default:
				daBf = 'bf';

				if (FlxG.random.bool((1 / 4096) * 100) && GameOverState.faked == false)
				{
					daBf = 'fakeoutBf';
					GameOverState.faked = true;
				}

				if (GameOverState.faked == true)
					GameOverState.faked = false;
		}

		super();

		Conductor.songPosition = 0;

		bf = new Boyfriend(x, y, daBf);
		add(bf);

		camFollow = new FlxObject(bf.getGraphicMidpoint().x, bf.getGraphicMidpoint().y, 1, 1);
		add(camFollow);

		Conductor.changeBPM(100);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		if (daBf != "fakeoutBf")
		{
			FlxG.sound.play('${AssetPaths.SOUND_FOLDER}/fnf_loss_sfx' + stageSuffix + AssetPaths.soundExt);
			bf.playAnim('firstDeath');
			return;
		}

		bf.playAnim('suspence');
		FlxG.sound.play('${AssetPaths.SOUND_FOLDER}/fakeout_death' + AssetPaths.soundExt);

		FlxG.camera.follow(camFollow, LOCKON, 0.01);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();

			if (PlayState.isStoryMode)
				FlxG.switchState(new StoryMenuState());
			else
				FlxG.switchState(new FreeplayState());
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			FlxG.sound.playMusic('assets/music/gameOver' + stageSuffix + AssetPaths.soundExt);
		}

		if (bf.animation.curAnim.name == 'suspence' && bf.animation.finished && extrabf != null)
		{
			if (extrabf.animation.curAnim.name == 'firstDeath' && extrabf.animation.curAnim.finished)
			{
				FlxG.sound.playMusic('assets/music/gameOver' + stageSuffix + AssetPaths.soundExt);
			}
		}

		if (bf.animation.curAnim.name == 'suspence' && bf.animation.finished && extrabf == null)
		{
			extrabf = new Boyfriend(bf.x, bf.y, 'bf');
			add(extrabf);
			bf.visible = false;

			FlxG.sound.play('${AssetPaths.SOUND_FOLDER}/fnf_loss_sfx' + stageSuffix + AssetPaths.soundExt);
			extrabf.playAnim('firstDeath');
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
	}

	override function beatHit()
	{
		super.beatHit();

		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			bf.playAnim('deathConfirm', true);
			try
			{
				extrabf.playAnim('deathConfirm', true);
			}
			catch (e)
			{
				FlxG.log.add("extrabf doesn't exist");
			}
			FlxG.sound.music.stop();
			FlxG.sound.play('assets/music/gameOverEnd' + stageSuffix + AssetPaths.soundExt);
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					FlxG.switchState(new PlayState());
				});
			});
		}
	}
}
