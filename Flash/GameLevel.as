package  {
	import flashx.textLayout.accessibility.TextAccImpl;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class GameLevel extends Level{
		var player:Player;
		var world:World;
		var Backgrounds:Array;
		var enemies:Array;
		var potion:Potion;
		var deadBar:TextField;
		
		public function GameLevel(game:Game){
			deadBar = new TextField;
			enemies = new Array;
			super(game);
			game.stage.addEventListener(Event.ENTER_FRAME,update);
		}
		override public function load(){
		}
		public function update(e:Event){
			if(player.hitTestObject(potion)){
				world.removeChild(potion);
				player.deadbar += 50;
				deadBar.text = player.deadbar.toString();
			}
			for each(var enemy in enemies){
				if(player.hitTestObject(enemy)){
					if(!player.dead){
						player.dead = true;
						player.gotoAndStop(2);
					}
				}
			}		
		}
	}
	
}
