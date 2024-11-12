package utilities;

class AssetPaths
{

    public static var DATA_FOLDER = "assets/data";
    public static var SONG_DATA_FOLDER = '$DATA_FOLDER/songs';
    public static var WEEK_DATA_FOLDER = '$DATA_FOLDER/weeks';

    public static var FONT_FOLDER = "assets/fonts";

    public static var IMAGE_FOLDER = "assets/images";
    public static var UI_FOLDER = '$IMAGE_FOLDER/ui';

    public static var soundExt:String = #if web ".mp3" #else ".ogg" #end;
    public static var SOUND_FOLDER = "assets/sounds";
    public static var MUSIC_FOLDER = "assets/music";
    public static var SONG_FOLDER = "assets/music/songs";
    
	public static var videoExt = '.mp4';
}