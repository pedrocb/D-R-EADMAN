package 
{
	import flashx.textLayout.accessibility.TextAccImpl;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;

	public class GameLevel extends Level
	{
		var player:Player;
		var world:World;
		var Backgrounds:Array;
		var enemies:Array;
		var potions:Array;
		var deadBar:MovieClip;
		var barra:MovieClip;
		var percentage:TextField;
		var grey:Shape;
		var keysGUI:Array;
		var keys:Array;
		var paused:Boolean;
		var door:MovieClip;	

		public function GameLevel(game:Game)
		{
			game.stage.focus = game.stage;
			percentage = new TextField;
			barra = new MovieClip;
			barra.graphics.beginFill(0x000000);
			barra.graphics.drawRect(0,0,Game.SCREEN_WIDTH,50);
			barra.graphics.endFill();
			deadBar = new DeadBar;
			deadBar.x = barra.width/2;
			deadBar.y = barra.height/2 + deadBar.height/2;
			deadBar.Bar.width = 0;
			percentage.y =-deadBar.height/2 - 10 ;
			percentage.text = "0%";
			deadBar.addChild(percentage);
			keysGUI = new Array;
			for(var i=0;i<5;i++){
				var key = new Key;
				key.x = key.width + i*(key.width+5);
				key.y = barra.height/2 + key.height/2;
				key.gotoAndStop(1);
				keysGUI[i] = key;
				barra.addChild(key);
			}
			barra.addChild(deadBar);
			grey = new Shape  ;
			grey.graphics.beginFill(0xE0E0E0);
			grey.graphics.drawRect(0,0,Game.SCREEN_WIDTH,Game.SCREEN_HEIGHT);
			grey.graphics.endFill();
			grey.alpha = 0;
			enemies = new Array  ;
			potions = new Array  ;
			keys = new Array;
			super(game);
			game.stage.addEventListener(Event.ENTER_FRAME,update);
			game.stage.addEventListener(KeyboardEvent.KEY_DOWN,checkkey);
		}
		override public function load()
		{
		}
		
		public function checkkey(e:KeyboardEvent){
			if(e.keyCode == Keyboard.P){
				if(paused){
					unpause();
				}
				else{
					lepause();
				}
			}
			if(e.keyCode == Keyboard.R){
				game.levelmanager.loadLevel(new (Object(game.levelmanager.currentLevel).constructor)(game));
			}
		}
	
		public function update(e:Event)
		{
			if(player.hitTestObject(door) && player.keys == keysGUI.length){
				door.gotoAndStop(2);
			}
			else{
				door.gotoAndStop(1);
			}
			for (var i=0; i<potions.length; i++)
			{
				if (player.hitTestObject(potions[i]) && player.deadbar<100)
				{
					world.removeChild(potions[i]);
					potions[i] = potions[potions.length - 1];
					potions.pop();
					player.deadbar +=  25;
					if(player.deadbar >100){
						player.deadbar = 100;
					}
					deadBar.Bar.width = player.deadbar/100 * deadBar.width;
					percentage.text = (int(player.deadbar)).toString()+"%";
					break;
				}
			}
			for (i=0; i<keys.length; i++)
			{
				if (player.hitTestObject(keys[i]))
				{
					world.removeChild(keys[i]);
					keys[i] = keys[keys.length - 1];
					keys.pop();
					player.keys++;
					keysGUI[player.keys-1].gotoAndStop(2); 
					break;
				}
			}
			for(i=0;i<enemies.length;i++)
			{
				var enemy = enemies[i];
				if (player.hitTestObject(enemy))
				{
					if(!player.attacking){
						if (player.deadbar !=0)
						{
							if (! player.dead)
							{
								player.dead = true;
								player.gotoAndStop(2);
								grey.alpha = 0.3;
							}
						
						}
						else
						{
							game.levelmanager.loadLevel(new StartMenu(game));
						}
					}
					else{
						if(player.attack.pa.hitTestObject(enemy)){
						world.removeChild(enemy);
						enemies[i] = enemies[enemies.length - 1];
						enemies.pop();}
					}
				}
			}
		}
		
		public function lepause(){
			game.stage.frameRate = 0;
			paused = true;
		}
		
		public function unpause(){
			game.stage.frameRate = 60;
			paused = false;
		}
		
		override public function dispose(){
			super.dispose();
			game.stage.removeEventListener(Event.ENTER_FRAME,update);
			game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,checkkey);
			player.dispose();
		}
	}

}