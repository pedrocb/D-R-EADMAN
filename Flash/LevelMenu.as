﻿package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.Loader;
	import flash.events.MouseEvent;
	
	public class LevelMenu extends Level{
		
		var posicoes = [new Point(20.30,99.30),new Point(243.30,105.30),new Point(465.30,105.30),new Point(129.30,150.30),new Point(345.30,150.30)]
		var buttons;
		var tablet;
		public function LevelMenu(game:Game) {
			buttons = [new Button1(80.35,132.30,169.40,35.60),new Button1(301.35,136.30,178.10,35.60),new Button1(524.35,136.30,178.10,35.60),new Button1(193.35,184.30,178.10,35.60),new Button1(405.35,184.30,178.10,35.60)];
			super(game);
			addChild(new Background3);
			tablet = new LevelTablet;
			tablet.x = Game.SCREEN_WIDTH/2 - tablet.width/2;
			tablet.y = Game.SCREEN_HEIGHT/2 - tablet.height/2;
			addChild(tablet);
			for(var i=0;i<posicoes.length;i++){
				if(i>=game.lastlevel){
					var block = new LevelBlocked;
					block.x = posicoes[i].x;
					block.y = posicoes[i].y;
					tablet.addChild(block);
				}
				else{
					tablet.addChild(buttons[i]);
					buttons[i].addEventListener(MouseEvent.CLICK,level);
				}
			}
		}
		
		public function level(e:MouseEvent){
			for(var i=0;i<buttons.length;i++){
				if(e.target == buttons[i]){
					game.levelmanager.loadLevel(new(Object(game.levels[i]).constructor)(game));
				}
			}
		}
		
		override public function dispose(){
			super.dispose();
			for(var i = 0;i<buttons.length;i++){
				buttons[i].removeEventListener(MouseEvent.CLICK,level);
			}
		}

	}
	
}
