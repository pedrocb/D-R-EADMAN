package  {
	import flash.display.MovieClip;
	import flashx.textLayout.formats.BackgroundColor;
	
	public class Game extends MovieClip{
		var levelmanager:LevelManager;
		static var SCREEN_WIDTH = 1280;
		static var SCREEN_HEIGHT = 720;
		public function Game() {
			levelmanager = new LevelManager(this);
			levelmanager.loadLevel(new StartMenu(this));
		}

	}
	
}
