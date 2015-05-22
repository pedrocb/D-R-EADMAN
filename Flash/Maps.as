package
{
	var myTextLoader:URLLoader = new URLLoader();
	public var map1Matrix:Array;
	
	myTextLoader.addEventListener(Event.COMPLETE, onLoaded);
	
	function onLoaded(e:Event):void
	{
		var lines:Array = e.target.data.split(/\n/);
		for(var i:String in lines)
		{
			map1Matrix.push(i.split());
		}
	}
	
	myTextLoader.load(new URLRequest("../Maps/Map1.txt"));
}