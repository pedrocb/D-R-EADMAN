package  {
	import flashx.textLayout.accessibility.TextAccImpl;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Shape;
	
	public class GameLevel extends Level{
		var player:Player;
		var world:World;
		var Backgrounds:Array;
		var enemies:Array;
		var potions:Array;
		var deadBar:DeadBar;
		var grey:Shape;
		
		public function GameLevel(game:Game){
			grey = new Shape  ;
			grey.graphics.beginFill(0xE0E0E0);
			grey.graphics.drawRect(0,0,Game.SCREEN_WIDTH,Game.SCREEN_HEIGHT);
			grey.graphics.endFill();
			grey.alpha=0;
			enemies = new Array;
			potions = new Array;
			super(game);
			game.stage.addEventListener(Event.ENTER_FRAME,update);
		}
		override public function load(){
		}
		public function update(e:Event){
			for(var i=0;i<potions.length;i++){
				if(player.hitTestObject(potions[i])){
					world.removeChild(potions[i]);
					potions[i] = potions[potions.length -1];
					potions.pop();
					player.deadbar += 50;
					deadBar.width = player.deadbar;
					break;
				}
			}
			for each(var potion in potions){
				
			}
			for each(var enemy in enemies){
				if(player.hitTestObject(enemy)){
					if(!player.dead){
						player.dead = true;
						player.gotoAndStop(2);
						grey.alpha = 0.3;
					}
				}
			}		
		}
	}
	
}
