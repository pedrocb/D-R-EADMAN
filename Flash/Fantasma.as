package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Fantasma extends MovieClip{
		var world:World;
		var game:Game;
		var level:GameLevel;
		
		var canmoveright = true;
		var canmoveleft = true;
		var canmoveup = true;
		var canmovedown = true;
		var speed = 2;
		var gravity = 2;
		
		
		var vX,vY:int;

		
		public function Fantasma(game:Game,x:int,y:int,world:World,level:GameLevel) {
			this.x = x;
			this.y = y;
			this.world = world;
			this.game = game;
			this.level = level;
			load();
		}
		
		public function load(){
			game.stage.addEventListener(Event.ENTER_FRAME,update);
		}
		
		public function checkfall():Boolean{
			var direction = speed/Math.abs(speed);
			var tile = (int)((1+this.x+world.xoffset+((speed/Math.abs(speed))*width/2))/world.TILE_WIDTH);
			var downTileY = (int)((1+this.y)/world.TILE_HEIGHT);
			if(world.tiles[downTileY+1][tile]==0){
				return true;
			}
			else{
				return false;
			}
		}

		public function update(e:Event)
		{
			if(canmovedown){
				if(vY>=0)
				vY = gravity;
				vX =0;
			}
			else{
				if(checkfall()){
					speed*=-1;
				}
				vX = speed;
			}
			checkCollisions();
			this.x+=vX;
			this.y+=vY;
		}
		
		public function checkCollisions()
		{
			var foundleft = false;
			var foundright = false;
			var foundup = false;
			var founddown = false;

			var leftTileX = (int)((this.x+world.xoffset+vX-width/2 )/world.TILE_WIDTH);
			var rightTileX = (int)((1+this.x+world.xoffset+ vX+width/2)/world.TILE_WIDTH);
			var upTileY = (int)((this.y-height)/world.TILE_HEIGHT);
			var downTileY = (int)((1+this.y)/world.TILE_HEIGHT);
			for (var y=upTileY; y<=downTileY; y++)
			{
				if (! foundleft)
				{
					if (world.tiles[y][leftTileX] != 0)
					{
						foundleft = true;
					}
				}
				if (! foundright)
				{
					if (world.tiles[y][rightTileX] != 0)
					{
						foundright = true;
					}
				}
			}
			leftTileX = (int)((this.x+world.xoffset-width/2 )/world.TILE_WIDTH);
			rightTileX = (int)((1+this.x+world.xoffset+width/2)/world.TILE_WIDTH);
			upTileY = (int)((this.y+vY-height)/world.TILE_HEIGHT);
			downTileY = (int)((1+this.y+vY)/world.TILE_HEIGHT);
			for (var x=leftTileX; x<=rightTileX; x++)
			{
				if (! foundup)
				{
					if (world.tiles[upTileY][x] != 0)
					{
						foundup = true;
					}
				}
				if (! founddown)
				{
					if (world.tiles[downTileY][x] != 0)
					{
						founddown = true;
					}
				}
			}
			if(foundleft){
				if(canmoveleft && vX <0){
					if(((this.x+world.xoffset-this.width/2)%world.TILE_WIDTH) < world.TILE_WIDTH/2){
						vX = 2- ((this.x+world.xoffset-this.width/2)%world.TILE_WIDTH); 
					}
					canmoveleft = false;
				}
				else{
					vX = 0;
				}
			}
			else{
				if(!canmoveleft){
					canmoveleft = true;
				}
			}
			if(foundright){
				if(canmoveright && vX>0){
					if((world.TILE_WIDTH - ((this.x+world.xoffset+this.width/2)%world.TILE_WIDTH)) < world.TILE_WIDTH/2){
						vX = -2+(world.TILE_WIDTH - ((this.x+world.xoffset+this.width/2)%world.TILE_WIDTH));
					}
					canmoveright = false;
				}
				else{
					vX = 0;				
				}
			}
			else{
				if(!canmoveright){
					canmoveright = true;
				}
			}
			if(founddown){
				if(canmovedown && vY >0){
					if((world.TILE_HEIGHT - this.y%world.TILE_HEIGHT) <this.height/3){
						vY = -2 + (world.TILE_HEIGHT - this.y%world.TILE_HEIGHT); 
					}
					canmovedown = false;
				}
				else{
					vY = 0;	
				}
			}
			else{
				if(!canmovedown){
					canmovedown = true;
				}
			}
			if(foundup){
				if(canmoveup && vY <0){
					if((this.y-this.height)%world.TILE_HEIGHT <this.height/3){
						vY = 2 + (this.y-this.height)%world.TILE_HEIGHT;
					}
					canmoveup = false;
				}
				else{
					vY = 0;				
				}
			}
			else{
				if(!canmoveup){
					canmoveup = true;
				}
			}
		}
	}
	
}
