package 
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.display.Shape;

	import flash.sampler.Sample;

	public class Player extends MovieClip
	{
		var speed = 1;
		var game:Game;
		var world:World;

		var jumpspeed = 10;

		var vY:int;
		var vX:int;

		var dead:Boolean;

		var jumping = false;

		var canmoveright = true;
		var canmoveleft = true;
		var canmoveup = true;
		var canmovedown = true;
		
		var upcollision = false;
		var downcollision = false;
		var leftcollision = false;
		var rightcollision = false;

		var upkey = false;
		var downkey = false;
		var leftkey = false;
		var rightkey = false;

		public function Player(x:int,y:int,game:Game,world:World)
		{
			gotoAndStop(1);
			this.x = x;
			this.y = y;
			this.game = game;
			this.world = world;
			var rectangle:Shape = new Shape  ;
			rectangle.graphics.beginFill(0x00FFFF);
			rectangle.graphics.drawRect(-this.width/2,-this.height,this.width,this.height);
			rectangle.graphics.endFill();
			addChild(rectangle);
			load();

		}

		public function load()
		{
			game.stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			game.stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
			game.stage.addEventListener(Event.ENTER_FRAME,update);
		}

		
		public function update(e:Event)
		{
			if(!canmoveright){
				trace("right");
			}
			if (rightkey)
			{
				if(canmoveright)
					vX = speed;
			}
			if (leftkey)
			{
				if(canmoveleft)
					vX =  -speed;
			}
			if (rightkey == leftkey)
			{
				vX = 0;
			}
			if(downkey){
				vY = speed;
			}
			if(upkey){
				vY = -speed;
			}
			if(upkey == downkey){
				vY = 0;
			}
			checkCollisions();	
			/*if (canmovedown)
			{
				if (! jumping)
				{
					vY = jumpspeed;
				}
			}
			else
			{
				if (upkey)
				{
					jumping = true;
					vY =  -  jumpspeed;
				}
			}
			if (vY > 0)
			{
				if (!canmovedown)
				{
					vY = 0;
				}
			}
			else if (vY<0)
			{
				vY++;
			}
			else
			{
				jumping = false;
			}
			if (vX >0)
			{
				if (! canmoveright)
				{
					vX = 0;
				}
			}
			else if (vX <0)
			{
				if (! canmoveleft)
				{
					vX = 0;
				}
			}*/
			x +=  vX;
			y +=  vY;
		}

		public function keydown(e:KeyboardEvent)
		{
			if (e.keyCode == Keyboard.RIGHT)
			{
				rightkey = true;
			}
			if (e.keyCode == Keyboard.LEFT)
			{
				leftkey = true;
			}
			if (e.keyCode == Keyboard.DOWN)
			{
				downkey = true;
			}
			if (e.keyCode == Keyboard.UP)
			{
				upkey = true;
			}
			if (e.keyCode == Keyboard.SPACE)
			{
				if (dead)
				{
					dead = false;
					gotoAndStop(1);
				}
				else
				{
					dead = true;
					gotoAndStop(2);
				}
			}
		}

		public function keyup(e:KeyboardEvent)
		{
			if (e.keyCode == Keyboard.RIGHT)
			{
				rightkey = false;
			}
			if (e.keyCode == Keyboard.LEFT)
			{
				leftkey = false;
			}
			if (e.keyCode == Keyboard.DOWN)
			{
				downkey = false;
			}
			if (e.keyCode == Keyboard.UP)
			{
				upkey = false;
			}
		}

		public function checkCollisions()
		{
			var foundleft = false;
			var foundright = false;
			var foundup = false;
			var founddown = false;

			var leftTileX = (int)((this.x -width/2)/world.TILE_WIDTH);
			var rightTileX = (int)((1+this.x+width/2)/world.TILE_WIDTH);
			var upTileY = (int)((this.y - height)/world.TILE_HEIGHT);
			var downTileY = (int)((1+this.y)/world.TILE_HEIGHT);
			for (var y=upTileY; y<=downTileY; y++)
			{
				if (! foundleft)
				{
					if (world.tiles[y][leftTileX] != 0)
					{
						foundleft = true;
						leftcollision = true;
					}
				}
				if (! foundright)
				{
					if (world.tiles[y][rightTileX] != 0)
					{
						foundright = true;
						rightcollision = true;
					}
				}
			}
			for (var x=leftTileX; x<=rightTileX; x++)
			{
				if (! foundup)
				{
					if (world.tiles[upTileY][x] != 0)
					{
						foundup = true;
						upcollision = true;
					}
				}
				if (! founddown)
				{
					if (world.tiles[downTileY][x] != 0)
					{
						founddown = true;
						downcollision = true;
					}
				}
			}
			if(foundleft){
				if(canmoveleft){
					if(vX<0){
						this.x = (leftTileX+1)*world.TILE_WIDTH - world.TILE_WIDTH+this.width/2+3; 
					}
				}
				canmoveleft = false;
			}
			else{
				if(!canmoveleft){
					canmoveleft = true;
				}
			}
			if(foundright){
				if(canmoveright){
					if(vX > 0){
						this.x = (rightTileX - 1)*world.TILE_WIDTH + world.TILE_WIDTH-this.width/2-3; 
					}
				}
				canmoveright = false;
			}
			else{
				if(!canmoveright){
					canmoveright = true;
				}
			}
			if(founddown){
				if(canmovedown){
					if(vY>0){
						this.y = (downTileY - 1)*world.TILE_HEIGHT + world.TILE_HEIGHT-3; 
					}
				}
				canmovedown = false;
			}
			else{
				if(!canmovedown){
					canmovedown = true;
				}
			}
			if(foundup){
				if(canmoveup){
					if(vY<0){
						this.y = (upTileY+1)*world.TILE_HEIGHT  + 3 + this.height;
					}
				}
				canmoveup = false;
			}
			else{
				if(!canmoveup){
					canmoveup = true;
				}
			}
/*
			if(!canmoveup){
				if(foundup){
					this.y += ((world.TILE_HEIGHT - this.y%world.TILE_HEIGHT) -1);
				}
				else{
					canmoveup =true;
				}
			}
			if(!canmovedown){
				if(founddown){
					this.y -= ((this.y%world.TILE_HEIGHT) + 1);
				}
				else{
					canmovedown = true;
				}
			}*/
		}
	}
}