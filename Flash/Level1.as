include Maps.as

package  {
	
	public class Level1 extends GameLevel{
		public function Level1(game:Game) {
			super(game);
			this.WIDTH = 6*Game.SCREEN_WIDTH;
			Backgrounds = new Array;
			for(var i=0;i<WIDTH/Game.SCREEN_WIDTH;i++){
				Backgrounds[i] = new Background1;
			}
			world = new World(Backgrounds);
			world.tiles = map1Matrix;
            world.load();
			player = new Player(400,550,game,world,this);
			fantasma = new Fantasma;
			fantasma.x = 500;
			fantasma.y = 400;
			deadBar.text = (player.deadbar).toString();
			deadBar.x = 0;
			deadBar.y = 0;
			deadBar.width = 20;
			game.addChild(fantasma);
		}
		override public function load(){
			game.addChild(world);
			game.addChild(player);
			game.addChild(fantasma);
			game.addChild(deadBar);
		}

	}
	
}
