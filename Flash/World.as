package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	
	public class World extends MovieClip{
		var xoffset:int;
		var yoffset:int;
		var background:Array;
		var WIDTH:int;
		var HEIGHT:int;
		var enemies:Array;
		var tiles:Array;
		public function World(back:Array,width:int) {
			this.background = back;
			this.WIDTH = width;
			xoffset = 0;
			yoffset = 0;
			load();
		}
		
		public function load(){
			for(var i=0;i<background.length;i++){
				var back:MovieClip = new background[i];
				back.x = i*Game.SCREEN_WIDTH;
				back.y = 0;
				addChild(back);
			}
		}

	}
	
}
