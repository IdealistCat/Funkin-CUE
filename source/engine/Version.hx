package engine;

import lime.app.Application;

class Version
{
    public static function returnVersion() {
        var versionString:String = 'Funkin C.U.E. v${Application.current.meta.get('version')}'+#if debug GitStuff.developmentString() #else '' #end;

        return versionString;
    }
}