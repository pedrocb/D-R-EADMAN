package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	import fl.motion.Color;
	
	public class World extends MovieClip{
		var xoffset:Number;
		var background:Array;
		var WIDTH:Number;
		var HEIGHT:Number;
		var enemies:Array;
		var tiles:Array;
		var TILE_WIDTH:Number;
		var TILE_HEIGHT:Number;
		public function World() {
			this.HEIGHT = Game.SCREEN_HEIGHT;
			xoffset = 0;
			TILE_WIDTH = 64;
			TILE_HEIGHT = 64;
		}
		

		
		public function load(){			
			for(var y=0;y<background.length;y++){
				for(var x = 0;x<background[0].length;x++){
					var back:MovieClip = background[y][x];
					back.x = x*Game.SCREEN_WIDTH;
					back.y = y*Game.SCREEN_HEIGHT+ 3*TILE_HEIGHT/4;
					addChild(back);
				}
			}
			for(y=0;y<tiles.length;y++){
				for(x=0;x<tiles[0].length;x++){
					var tile;
					if(tiles[y][x] == 1){
						tile = new Chao;
						tile.width = TILE_WIDTH;
						tile.height = TILE_HEIGHT;
						tile.x = x*tile.width;
						tile.y = tile.height*y;						
						addChild(tile);
					}
					/*else{
						tile = new Tile2;
						tile.width = TILE_WIDTH;
						tile.height = TILE_HEIGHT;
						tile.x = x*tile.width;
						tile.y = y*tile.height;
						addChild(tile);

					}*/
				}
			}
			trace(this.height+" "+this.width);
			this.y = -Game.SCREEN_HEIGHT-3*TILE_HEIGHT/4; 
		}

	}
	
}
