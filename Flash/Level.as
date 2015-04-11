package  {
	import flash.display.MovieClip;
	
	public class Level extends MovieClip{
		var game:Game;
		var WIDTH:int;
		public function Level(game:Game) {
			this.game = game;
		}
		public function dispose(){
			while(game.numChildren>0){
				game.removeChildAt(0);
			}
		}
		public function load(){
			
		}
	}
	
}
