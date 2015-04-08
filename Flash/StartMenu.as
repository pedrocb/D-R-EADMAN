package 
{
	import flash.events.MouseEvent;
	public class StartMenu extends Level
	{
		import flash.system.fscommand;
		public function StartMenu(game:Game)
		{
			super(game);
		}
		override public function load()
		{
			var background = new Background4();
			var creditsbutton = new Button1  ;
			game.addChild(background);
			creditsbutton.x = 567;
			creditsbutton.y = 513;
			creditsbutton.alpha = 0;
			creditsbutton.addEventListener(MouseEvent.CLICK, buttonpressed);
			var exitbutton = new Button1;
			exitbutton.x = 586;
			exitbutton.y = 650;
			exitbutton.width = 191;
			exitbutton.height = 63;
			exitbutton.alpha = 0;
			exitbutton.addEventListener(MouseEvent.CLICK, quit);
			game.addChild(creditsbutton);
			game.addChild(exitbutton);
		}
		public function buttonpressed(e: MouseEvent)
		{
			game.levelmanager.loadLevel(new CreditsMenu(game));
		}
		public function quit(e:MouseEvent){
			fscommand("quit");
		}
	}
}