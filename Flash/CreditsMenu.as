package  {
	
	public class CreditsMenu extends Level{
		
		public function CreditsMenu(game:Game) {
			super(game);
		}
		override public function load(){
			var background = new Background5;
			game.addChild(background);
		}
	}
	
}
