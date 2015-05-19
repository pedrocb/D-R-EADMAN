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
		var speed = 5;
		var game:Game;
		var world:World;

		var jumpspeed = 15;

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
				vX = speed;
			}
			if (leftkey)
			{
				vX =  -speed;
			}
			if (rightkey == leftkey)
			{
				vX = 0;
			}
			if(canmovedown){
				if(vY>=0)
				vY = speed;
			}
			else{
				if(upkey){
					vY = -jumpspeed;
				}
			}
			if(vY<0){
				vY++;
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

			var leftTileX = (int)((this.x+vX-width/2 )/world.TILE_WIDTH);
			var rightTileX = (int)((1+this.x+ vX+width/2)/world.TILE_WIDTH);
			var upTileY = (int)((this.y-height)/world.TILE_HEIGHT);
			var downTileY = (int)((1+this.y)/world.TILE_HEIGHT);
			for (var y=upTileY; y<=downTileY; y++)
			{
				if (! foundleft)
				{
					if (world.tiles[y][leftTileX] != 0)
					{
						foundleft = true;
						trace("Yo",leftTileX);
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
			leftTileX = (int)((this.x-width/2 )/world.TILE_WIDTH);
			rightTileX = (int)((1+this.x+width/2)/world.TILE_WIDTH);
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
					this.x = 2+this.x - ((this.x-this.width/2)%world.TILE_WIDTH);
					canmoveleft = false;
				}
				vX = 0;
			}
			else{
				if(!canmoveleft){
					canmoveleft = true;
				}
			}
			if(foundright){
				if(canmoveright && vX>0){
					this.x = -2+ this.x + (world.TILE_WIDTH - ((this.x+this.width/2)%world.TILE_WIDTH));
					canmoveright = false;
				}
				vX = 0;
			}
			else{
				if(!canmoveright){
					canmoveright = true;
				}
			}
			if(founddown){
				if(canmovedown && vY >0){
					this.y = -2+this.y + (world.TILE_HEIGHT - this.y%world.TILE_HEIGHT); 
					canmovedown = false;
				}
				vY = 0;
			}
			else{
				if(!canmovedown){
					canmovedown = true;
				}
			}
			if(foundup){
				if(canmoveup && vY <0){
					this.y = 2 +this.y + (this.y-this.height)%world.TILE_HEIGHT;
					canmoveup = false;
				}
				vY = 0;
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