package  {
	
	public class Level1 extends GameLevel{
		public function Level1(game:Game) {
			super(game);
			this.WIDTH = 6*Game.SCREEN_WIDTH;
			Backgrounds = new Array;
			for(var i=2;i<WIDTH/Game.SCREEN_WIDTH;i++){
				trace(i);
				Backgrounds[i] = (new Background1).constructor;
			}
			Backgrounds[0] = (new Background2).constructor;
			Backgrounds[1] = (new Background3).constructor;
			world = new World(Backgrounds,WIDTH);
			player = new Player(50,50,game,world);
		}
		override public function load(){
			game.addChild(world);
			game.addChild(player);
		}

	}
	
}
