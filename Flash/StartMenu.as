﻿package 
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.system.fscommand;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;


	public class StartMenu extends Level
	{
		var player:MovieClip;
		var speed = 3;		
		var grey:Shape;
		var playin;
		var barravolume;
		var creditsbutton = new Button1(611,441,175,42);
		var exitbutton = new Button1(626,486,94,39);
		var newgamebutton = new Button1(622,310,113,39);
	
		public function StartMenu(game:Game)
		{
			super(game);
		}
		override public function load()
		{
			grey = new Shape  ;
			grey.graphics.beginFill(0xE0E0E0);
			grey.graphics.drawRect(0,0,Game.SCREEN_WIDTH,Game.SCREEN_HEIGHT);
			grey.graphics.endFill();
			grey.alpha = 0;
			player = new PlayerS;
			player.x = Game.SCREEN_WIDTH/2;
			player.y = Game.SCREEN_HEIGHT-64/4;
			player.gotoAndStop(3);
			var background = new Menu1();
			addChild(background);
			creditsbutton.addEventListener(MouseEvent.CLICK, creditsbuttonpressed);
			exitbutton.addEventListener(MouseEvent.CLICK, quit);
			newgamebutton.addEventListener(MouseEvent.CLICK, startgame);
			game.stage.addEventListener(Event.ENTER_FRAME,update);
			game.stage.addEventListener(MouseEvent.CLICK,updatevolume);
			addChild(newgamebutton);
			addChild(creditsbutton);
			addChild(exitbutton);
			addChild(grey);
			addChild(player);
			barravolume = new DeadBar;
			barravolume.x = barravolume.width/2;
			barravolume.y = barravolume.height/2;
			barravolume.Bar.width = 0;
			addChild(barravolume);
		}
		
		public function creditsbuttonpressed(e: MouseEvent)
		{
			game.levelmanager.loadLevel(new CreditsMenu(game));
		}
		public function startgame(e:MouseEvent){
			game.levelmanager.loadLevel(new LevelMenu(game));
		}
		
		override public function dispose(){
			super.dispose();
			creditsbutton.removeEventListener(MouseEvent.CLICK, creditsbuttonpressed);
			exitbutton.removeEventListener(MouseEvent.CLICK, quit);
			newgamebutton.removeEventListener(MouseEvent.CLICK, startgame);
			game.stage.removeEventListener(Event.ENTER_FRAME,update);
			game.stage.removeEventListener(MouseEvent.CLICK,updatevolume);
			//playin.stop();
		}
		
		public function updatevolume(e:MouseEvent){
			barravolume.Bar.width = e.stageX  - barravolume.x+barravolume.width/2;
			game.soundtransformm.volume = barravolume.Bar.width/barravolume.width;
			trace(game.soundtransformm.volume);
			game.options.vol = game.soundtransformm.volume;
			game.channel.soundTransform = game.soundtransformm;
			
		}
		
		public function update(e:Event){
			if((player.x-player.width/2) > Game.SCREEN_WIDTH+20){
				player.gotoAndStop(2);
				grey.alpha = 0.3;
				player.x = Game.SCREEN_WIDTH+player.width/2;
				speed*=-1;
			}
			else if(player.x+player.width/2 < -20){
				player.gotoAndStop(3);
				grey.alpha = 0;
				player.x = -player.width/2;
				speed*=-1;
			}
			if (speed <0)
			{
				player.rotationY = 180;

			}
			else if (speed >0)
			{
				player.rotationY = 0;
			}			
			player.x+=speed;
		}
		public function quit(e:MouseEvent){
			fscommand("quit");
		}
	}
}