package  {
	import flash.display.MovieClip;
	
	public class Game extends MovieClip{
		var levelmanager:LevelManager;
		public function Game() {
			levelmanager = new LevelManager(this);
		}

	}
	
}
