package  {
	
	public class Level1 extends GameLevel{

		public function Level1(game:Game) {
			super(game);
			player = new Player(50,50,game);
			world = new World(new Background1);
		}
		override public function load(){
			game.addChild(world);
			game.addChild(player);
		}

	}
	
}
