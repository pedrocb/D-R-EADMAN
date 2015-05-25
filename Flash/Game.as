package  {
	import flash.display.MovieClip;
	import flashx.textLayout.formats.BackgroundColor;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	public class Game extends MovieClip{
		var levelmanager:LevelManager;
		static var SCREEN_WIDTH = 1280;
		static var SCREEN_HEIGHT = 720;
		var options:Options;
		var music:Sound;
		var channel:SoundChannel;
		var soundtransformm:SoundTransform;
		var lastlevel = 4;
		var levels;
 		public function Game() {
			levelmanager = new LevelManager(this);
			levelmanager.loadLevel(new StartMenu(this));
			soundtransformm = new SoundTransform(1);
			options = new Options(1,0);
			music = new Sound();
			music.load(new URLRequest('test.mp3'));
			channel = music.play(0,9999,soundtransformm);
			channel.soundTransform = soundtransformm;
			levels = [new Level1(this), new Level2(this)];
		}

	}
	
}
