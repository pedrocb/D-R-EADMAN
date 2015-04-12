package 
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;

	public class Player extends MovieClip
	{
		var gravity = 9.8;
		var speed = 10;
		var game:Game;
		var world:World;

		var dead:Boolean;

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
			if (rightkey)
			{
				if (x < Game.SCREEN_WIDTH / 2)
				{
					x = x + speed;
				}
				else
				{
					if (world.xoffset != world.WIDTH - Game.SCREEN_WIDTH)
					{
						world.x = world.x - speed;
						world.xoffset = world.xoffset + speed;
					}
				}

			}
			if (leftkey)
			{
				if (x > Game.SCREEN_WIDTH / 5)
				{
					x = x - speed;
				}
				else
				{
					if (world.xoffset != 0)
					{
						world.x = world.x + speed;
						world.xoffset = world.xoffset - speed;
					}
				}
			}
			if (downkey)
			{
				if (this.y != Game.SCREEN_HEIGHT)
				{
					this.y = this.y + speed;
				}
			}
			if (upkey)
			{
				this.y = this.y - speed;
			}
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

	}
}