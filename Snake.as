package  {
	import flash.display.*;
	public class Snake extends MovieClip
	{
		public var playerScore:Number = 0;
		
		public var snakeFoodVector:Vector.<Food> = new Vector.<Food>();
		
		public var snakePositions:Vector.<Number> = new Vector.<Number>();
		
		public var pos:Number = 120;
		public var recordNumber:Number = 140;
		
		public function Snake(xPosition, yPosition, Colour) 
		{
			// constructor code
			this.x = xPosition;
			this.y = yPosition;
			this.drawSnake(Colour);
			
		}
		public function remove3XorO(){
			for(var i = 2; i < snakeFoodVector.length; i++){
				if(snakeFoodVector[i].mytype == "O" && snakeFoodVector[i-1].mytype == "O" && snakeFoodVector[i-2].mytype == "O"){
					stage.removeChild(snakeFoodVector[i-2]);
					stage.removeChild(snakeFoodVector[i-1]);
					stage.removeChild(snakeFoodVector[i]);
					snakeFoodVector.splice(i-2, 3);
					
				}
			}
			for(var p = 2; p < snakeFoodVector.length; p++){
				if(snakeFoodVector[p].mytype == "X" && snakeFoodVector[p-1].mytype == "X" && snakeFoodVector[p-2].mytype == "X"){
					stage.removeChild(snakeFoodVector[p-2]);
					stage.removeChild(snakeFoodVector[p-1]);
					stage.removeChild(snakeFoodVector[p]);
					snakeFoodVector.splice(p-2, 3);
					
				}
			}
		}
		
		public function incrementScore():void
		{
		this.playerScore = this.playerScore + 100;	
		}
		
		public function decreasementScore():void
		{
		this.playerScore = this.playerScore - 1000;	
		}
		
		
		
		public function initialScore():void
		{
			this.playerScore = 0;
		}
		
		public function getScore()
		{
			return this.playerScore;
		}
		

		public function drawSnake(Colour)
		{
			this.graphics.beginFill(Colour);
			this.graphics.drawCircle(0,0,20);
			
		}
		
		
		public function setY(newY)
		{
			this.y = newY;
		}
		
		
		public function getY()
		{
			return this.y;
		}
		
		
		
		public function setX(newX)
		{
			this.x = newX;
		}
		
		
		
		public function getX()
		{
			return this.x;
		}
		
		public function record(){
			snakePositions.push(this.x);
			snakePositions.push(this.y);
			
			if(snakePositions.length > recordNumber){
				snakePositions.shift();
				snakePositions.shift();
			}
			
		}
		
		public function tail(){
			pos = 120;
			for(var i = 0; i < snakeFoodVector.length; i++){
				snakeFoodVector[i].x = snakePositions[pos];
				//trace(snakePositions[pos]);
				snakeFoodVector[i].y = snakePositions[pos+1];
				//trace(snakePositions[pos+1]);
				
				pos -=10;
				if(pos <= 0){
					pos = 0;
				}
			}


			}
			
		}
		
	}
	
