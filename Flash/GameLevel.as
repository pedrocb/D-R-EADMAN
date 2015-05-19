package  {
	import flashx.textLayout.accessibility.TextAccImpl;
	import flash.text.TextField;
	
	public class GameLevel extends Level{
		var player:Player;
		var world:World;
		var Backgrounds:Array;
		var fantasma:Fantasma;
		var deadBar:TextField;
		
		public function GameLevel(game:Game){
			deadBar = new TextField;
			super(game);
		}
		override public function load(){
		}
	}
	
}
