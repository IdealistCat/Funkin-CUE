package utilities;

class AssetPaths
{
    public static var soundExt:String = #if web ".mp3" #else ".ogg" #end;
    public static var DATA_FOLDER = "assets/data";
    public static var FONT_FOLDER = "assets/fonts";
    public static var IMAGE_FOLDER = "assets/images";
    public static var SOUND_FOLDER = "assets/sounds";
    public static var MUSIC_FOLDER = "assets/music";
}