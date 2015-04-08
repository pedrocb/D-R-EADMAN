package  {
	
	public class LevelManager {
		var game:Game;
		var currentLevel:level;
		public function LevelManager(Game game) {
			this.game = game;
		}
		public function loadLevel(Level level){
			if(currentLevel)currentLevel.dispose();
			level.load();
			currentLevel = level;
		}
	}
	
}
