package  {
	import flash.display.MovieClip;
	
	public class Food extends MovieClip {	

		public var mytype;

		public function Food(xPosition, yPosition, mytype) {
			// this function set up the food x (frame 1) and food O (frame 2)
			this.x = xPosition;
			this.y = yPosition;
			this.mytype = mytype;
			if(mytype == "O"){
				this.gotoAndStop(2)
				
			}
			else if(mytype == "X")
			{
				this.gotoAndStop(1)
			}

		}

		
			


	}
	
}
