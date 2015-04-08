package  {
	
	public class CreditsMenu extends Level{
		import flash.events.MouseEvent;
		public function CreditsMenu(game:Game) {
			super(game);
		}
		override public function load(){
			var background = new Background5;
			game.addChild(background);
			var quitbutton = new Button1;
			quitbutton.x = 1101;
			quitbutton.y = 644;
			quitbutton.width = 177;
			quitbutton.height = 80;
			quitbutton.alpha = 0;
			game.addChild(quitbutton);
			quitbutton.addEventListener(MouseEvent.CLICK, buttonpressed);
		}
		public function buttonpressed(e:MouseEvent){
			game.levelmanager.loadLevel(new StartMenu(game));
		}
	}
	
}
