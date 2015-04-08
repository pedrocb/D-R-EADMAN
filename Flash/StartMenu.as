package  {
	import flash.events.MouseEvent;
	public class StartMenu extends Level{
		public function StartMenu(game:Game) {
			super(game);
		}
		override public function load(){
			var background = new Background4();		
			var button = new Button1;
			game.addChild(background);
			button.x = 214;
			button.y = 109;
			button.addEventListener(MouseEvent.CLICK, buttonpressed);
			game.addChild(button);
		}
		public function buttonpressed(e: MouseEvent){
			game.levelmanager.loadLevel(new CreditsMenu(game));
		}

	}
	
}
