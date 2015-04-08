package  {
	import flash.display.MovieClip;
	import flashx.textLayout.formats.BackgroundColor;
	
	public class Game extends MovieClip{
		var levelmanager:LevelManager;
		public function Game() {
			levelmanager = new LevelManager(this);
			levelmanager.loadLevel(new StartMenu(this));
		}

	}
	
}
