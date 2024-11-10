package engine;

import engine.modding.ModInit;
import lime.app.Application;

class Version
{
    public static function returnVersion() {
        var versionString:String = 'Funkin C.U.E. v${Application.current.meta.get('version')}'+#if debug GitStuff.developmentString() #else '' #end;

        for (mod in ModInit.MOD_ARRAY)
        {
            versionString += '\n${mod.title} v${mod.modVersion}';
        }

        return versionString;
    }
}