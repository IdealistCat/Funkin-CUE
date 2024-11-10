package engine.modding;

#if polymod
import polymod.Polymod;
import polymod.PolymodConfig;
#end

class ModInit
{
	/**
	 * Amount of mods loaded
	 */
	public static var MOD_AMOUNT:Int = 0;
	/**
	 * Current modding api version
	 */
	public static var MOD_API:String = "0.0.1";

	/**
	 * Mod api rule
	 * Mods have to follow this otherwise they get unloaded
	 */
	public static var MOD_APIRULE:String = "<0.1.0"; // mod api version is less than 0.1

	/**
	 * Array filles with all the mod stuff
	 */
	public static var MOD_ARRAY:Array<ModMetadata> = [];

	/**
	 * Initalization function
	 * This does the behind the scenes loading shit
	 */
	public static function init()
	{
		#if polymod
        trace('Funkin C.U.E.Modding API v$MOD_API');

		Polymod.init({
			modRoot: 'mods/',
			framework: OPENFL,
			errorCallback: function(error:PolymodError)
			{
				#if POLYMOD_ERRORS_ENABLED
				trace(error.message);
				#end
			}
		});
		PolymodConfig.scriptExt = '.hscript';

		MOD_ARRAY = Polymod.scan({
			modRoot: "mods/",
			apiVersionRule: MOD_APIRULE, // violating apiVersionRule will result in unloaded mod
			errorCallback: function(error:PolymodError)
			{
				#if POLYMOD_ERRORS_ENABLED
				trace(error.message);
				#end
			}
		});

		MOD_AMOUNT = MOD_ARRAY.length;

		trace('${MOD_AMOUNT} mods found and loaded.');
		var index:Int = 1;
		for (mod in MOD_ARRAY)
		{
			trace('#$index - ${mod.title}');
			index++;
		}

		#end
	}
	/**
	 * returnMods
	 * returns the mod array variable which gives all the juicy mod data
	 * @return current mod array
	 */
	public static function returnMods(?key:String):Array<Dynamic>
	{
		var return_array:Array<Dynamic> = MOD_ARRAY;

		switch (key)
		{
			case 'title':
				return_array = [];
				for (mod in MOD_ARRAY)
				{
					return_array.push(mod.title);
				}
			case 'modver':
				return_array = [];
				for (mod in MOD_ARRAY)
				{
					return_array.push(mod.modVersion);
				}
			case 'apiver':
				return_array = [];
				for (mod in MOD_ARRAY)
				{
					return_array.push(mod.apiVersion);
				}
			case 'license':
				return_array = [];
				for (mod in MOD_ARRAY)
				{
					return_array.push(mod.license);
				}
		}

		return return_array;
	}
}