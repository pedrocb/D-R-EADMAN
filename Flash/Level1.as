package  {
	
	public class Level1 extends GameLevel{
		public function Level1(game:Game) {
			super(game);
			this.WIDTH = 6*Game.SCREEN_WIDTH;
			world = new World(new Background1,WIDTH);
			player = new Player(50,50,game,world);

		}
		override public function load(){
			game.addChild(world);
			game.addChild(player);
		}

	}
	
}
