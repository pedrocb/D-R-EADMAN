package  {
	import flash.display.MovieClip;
	
	public class World extends MovieClip{
		var xoffset:int;
		var yoffset:int;
		var background:MovieClip;
		var WIDTH:int;
		var HEIGHT:int;
		var enemies:Array;
		var tiles:Array;
		public function World(back:MovieClip) {
			this.background = back;
			xoffset = 0;
			yoffset = 0;
			addChild(back);
		}

	}
	
}
