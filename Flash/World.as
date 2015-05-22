package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	import fl.motion.Color;
	
	public class World extends MovieClip{
		var xoffset:Number;
		var yoffset:Number;
		var background:Array;
		var WIDTH:int;
		var HEIGHT:int;
		var enemies:Array;
		var tiles:Array;
		var TILE_WIDTH;
		var TILE_HEIGHT;
		public function World(back:Array) {
			this.background = back;
			this.HEIGHT = Game.SCREEN_HEIGHT;
			xoffset = 0;
			yoffset = 0;
			TILE_WIDTH = 64;
			TILE_HEIGHT = 64;
		}
		
		public function load(){
			for(var i=0;i<background.length;i++){
				var back:MovieClip = background[i];
				back.x = i*Game.SCREEN_WIDTH;
				back.y = 0;
				addChild(back);
			}
			for(var y=0;y<tiles.length;y++){
				for(var x=0;x<tiles[0].length;x++){
					var tile;
					if(tiles[y][x] == 1){
						tile = new Chao;
						tile.width = TILE_WIDTH;
						tile.height = TILE_HEIGHT;
						tile.x = x*tile.width;
						tile.y = y*tile.height;
						addChild(tile);
					}
				}
			}
			//trace(tiles[9][10]);
		}

	}
	
}
