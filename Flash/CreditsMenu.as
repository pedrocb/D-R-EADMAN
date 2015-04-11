package  {
	
	public class CreditsMenu extends Level{
		import flash.events.MouseEvent;
		public function CreditsMenu(game:Game) {
			super(game);
		}
		override public function load(){
			var background = new Background5;
			game.addChild(background);
			var quitbutton = new Button1(1101,644,177,80);
			game.addChild(quitbutton);
			quitbutton.addEventListener(MouseEvent.CLICK, buttonpressed);
		}
		public function buttonpressed(e:MouseEvent){
			game.levelmanager.loadLevel(new StartMenu(game));
		}
	}
	
}
