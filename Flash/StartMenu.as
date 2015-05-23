package 
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	public class StartMenu extends Level
	{
		import flash.system.fscommand;
		var player:MovieClip;
		var ghost:MovieClip;
		var speed = 3;
		public function StartMenu(game:Game)
		{
			super(game);
		}
		override public function load()
		{
			player = new PlayerS;
			player.x = 300;
			player.y = 676;
			player.gotoAndStop(3);
			ghost = new PlayerS;
			ghost.x = 980;
			ghost.y = 676;
			ghost.rotationY = 180;
			ghost.gotoAndStop(2);
			var background = new Background4();
			var creditsbutton = new Button1(567,513,310,63);
			var exitbutton = new Button1(586,650,191,63);
			var newgamebutton = new Button1(585,269,220,63);
			addChild(background);
			creditsbutton.addEventListener(MouseEvent.CLICK, creditsbuttonpressed);
			exitbutton.addEventListener(MouseEvent.CLICK, quit);
			newgamebutton.addEventListener(MouseEvent.CLICK, startgame);
			game.stage.addEventListener(Event.ENTER_FRAME,update);
			addChild(newgamebutton);
			addChild(creditsbutton);
			addChild(exitbutton);
			addChild(player);
			addChild(ghost);
		}
		public function creditsbuttonpressed(e: MouseEvent)
		{
			game.levelmanager.loadLevel(new CreditsMenu(game));
		}
		public function startgame(e:MouseEvent){
			game.levelmanager.loadLevel(new Level1(game));
		}
		
		public function update(e:Event){
			trace(player.x+" "+((speed/Math.abs(speed)*(player.width/2-20))));
			if((player.x-player.width/2) > Game.SCREEN_WIDTH+20){
				ghost.x = -player.width/2;
				player.x = Game.SCREEN_WIDTH+player.width/2;
				speed*=-1;
			}
			else if(player.x+player.width/2 < -20){
				player.x = -player.width/2;
				ghost.x = Game.SCREEN_WIDTH+player.width/2;
				speed*=-1;
			}
			if (speed <0)
			{
				player.rotationY = 180;
				ghost.rotationY = 0;

			}
			else if (speed >0)
			{
				player.rotationY = 0;
				ghost.rotationY = 180;
			}			
			player.x+=speed;
			ghost.x-=speed;
		}
		public function quit(e:MouseEvent){
			fscommand("quit");
		}
	}
}