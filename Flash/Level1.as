package  {
	
	public class Level1 extends GameLevel{
		public function Level1(game:Game) {
			super(game);
			this.WIDTH = 6*Game.SCREEN_WIDTH;
			Backgrounds = new Array;
			for(var i=0;i<WIDTH/Game.SCREEN_WIDTH;i++){
				Backgrounds[i] = new Background3;
			}
			world = new World(Backgrounds);
			world.tiles = [
					 [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
					 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
					 [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
					];
			world.load();
			player = new Player(400,550,game,world,this);
			
			var fantasma = new Fantasma(game,550,400,world,this);
			enemies.push(fantasma);
			world.addChild(fantasma);
			fantasma = new Fantasma(game,1000,400,world,this);
			enemies.push(fantasma);
			world.addChild(fantasma);
			fantasma = new Fantasma(game,1100,400,world,this);
			enemies.push(fantasma);
			world.addChild(fantasma);
			
			potion = new Potion;
			potion.x = world.TILE_WIDTH + world.TILE_WIDTH/2
			potion.y = world.TILE_HEIGHT*10 + world.TILE_HEIGHT;
			world.addChild(potion);
			deadBar.text = (player.deadbar).toString();
			deadBar.x = 0;
			deadBar.y = 0;
			deadBar.width = 20;
		}
		override public function load(){
			game.addChild(world);
			game.addChild(player);
			game.addChild(deadBar);
		}

	}
	
}
