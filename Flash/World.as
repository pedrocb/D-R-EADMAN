package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	
	public class World extends MovieClip{
		var xoffset:int;
		var yoffset:int;
		var background:MovieClip;
		var WIDTH:int;
		var HEIGHT:int;
		var enemies:Array;
		var tiles:Array;
		public function World(back:MovieClip,width:int) {
			this.background = back;
			this.WIDTH = width;
			xoffset = 0;
			yoffset = 0;
			load();
		}
		
		public function load(){
			var backgroundtype:Class = background.constructor;
			for(var i=0;i<6;i++){
				var back:MovieClip = new backgroundtype;
				back.x = i*Game.SCREEN_WIDTH;
				back.y = 0;
				addChild(back);
			}
		}

	}
	
}
