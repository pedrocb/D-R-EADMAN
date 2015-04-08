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
			button.x = 567;
			button.y = 513;
			button.alpha = 0;
			button.addEventListener(MouseEvent.CLICK, buttonpressed);
			game.addChild(button);
		}
		public function buttonpressed(e: MouseEvent){
			game.levelmanager.loadLevel(new Level1(game));
		}

	}
	
}
