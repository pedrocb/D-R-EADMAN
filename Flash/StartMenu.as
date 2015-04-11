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
			var creditsbutton = new Button1(567,513,310,63);
			var exitbutton = new Button1(586,650,191,63);
			var newgamebutton = new Button1(585,269,220,63);
			addChild(background);
			creditsbutton.addEventListener(MouseEvent.CLICK, creditsbuttonpressed);
			exitbutton.addEventListener(MouseEvent.CLICK, quit);
			newgamebutton.addEventListener(MouseEvent.CLICK, startgame);
			addChild(newgamebutton);
			addChild(creditsbutton);
			addChild(exitbutton);
		}
		public function creditsbuttonpressed(e: MouseEvent)
		{
			game.levelmanager.loadLevel(new CreditsMenu(game));
		}
		public function startgame(e:MouseEvent){
			game.levelmanager.loadLevel(new Level1(game));
		}
		public function quit(e:MouseEvent){
			fscommand("quit");
		}
	}
}