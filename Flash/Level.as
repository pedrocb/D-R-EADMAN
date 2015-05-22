package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class Level extends MovieClip{
		var game:Game;
		var WIDTH:int;
		var tilesArray:Array;
		public function Level(game:Game) {
			this.game = game;
			this.addEventListener("loadedFile",complete);
		}
		public function dispose(){
			while(game.numChildren>0){
				game.removeChildAt(0);
			}
		}
		public function load(){
			
		}
		public function loadMap(file:String)
		{
			trace("Running loadMap");
			var myTextLoader:URLLoader = new URLLoader();
			
			myTextLoader.addEventListener(Event.COMPLETE, this.onLoaded);
			
			myTextLoader.load(new URLRequest(file));
		}
		
		function onLoaded(e:Event):void
		{
			trace("Running onLoaded");
			var lines:Array = e.target.data.split(/\n/);
			for(var i:String in lines)
			{
				this.tilesArray.push(i.split());
			}
			dispatchEvent(new Event("loadedFile"));
		}
		public function complete()
		{
			
		}
	}
	
}
