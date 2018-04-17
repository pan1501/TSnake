package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.text.*;
	import flash.utils.Timer;
    import flash.events.TimerEvent;

	
	public class Main  extends MovieClip{
		public var player1;
		public var player2;
		var Score:int;
		var Direction:String;
		var Direction2:String;
		var speed:Number = 7;
		
		var timerCount:int = 60;
		var timer:Timer = new Timer(1000, 60);
		
		var mainFoodVector:Vector.<Food> = new Vector.<Food>();
		var player1FoodVector:Vector.<Food> = new Vector.<Food>();
		var player2FoodVector:Vector.<Food> = new Vector.<Food>();	

		

		
		public function Main() {
			winnertext.visible = false;
			
			addPlayer1();
			addPlayer2();
			addFoodO();
			addFoodO();
			addFoodX();
			addFoodX();	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(Event.ENTER_FRAME, movePlayer);
			stage.addEventListener(Event.ENTER_FRAME, checkForCollision);
			timer.addEventListener(TimerEvent.TIMER, min);
			timer.start();
			}
			
			public function selectwinner()
			//this function select a winner for the game
			{
			winner.text = "";
				if(player1Score.text>player1Score.text)
				{
					winner.text = "Player1"
				}
				
				if(player2Score.text>player1Score.text)
				{
					winner.text = "Player2"
				}
				if(player2Score.text==player1Score.text)
				{
					winner.text = "None"
				}
			}
			public function addPlayer1()
			//this function add player 1 to the stage
			{
			player1 = new Snake(150,384, 0x00FFFF );
			stage.addChild(player1);
			}
			
			
			public function addPlayer2()
			//this function add player 2 to the stage
			{
			player2 = new Snake(900,384, 0x00FF00);
			stage.addChild(player2);
			}
			
			
			public function addFoodO()
			//this function add Food O to the stage
			{
			var FoodO = new Food(50 + Math.random()*(stage.stageWidth-50),50 + Math.random()*(stage.stageHeight-150), "O");
			mainFoodVector.push(FoodO);
			FoodO.gotoAndStop(2);
			stage.addChild(FoodO);	
			}
			
			
			public function addFoodX()
			//this function add Food X to the stage
			{
			var FoodX = new Food(50 + Math.random()*(stage.stageWidth-50),50 + Math.random()*(stage.stageHeight-150), "X");
			mainFoodVector.push(FoodX);	
			FoodX.gotoAndStop(1);	
			stage.addChild(FoodX);
			}
			
			public function collision(){
			//this function set up the wall of the stage so that players wont go out of the stage, and also when player it the wall it will trigger some events:
			//	-if have no body vector the score will decrease
			//  -if have body vector the last element of the body vector will disapear.
			if(player1.x <= -10 )
				{
					if(player1.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player1.snakeFoodVector[player1.snakeFoodVector.length-1]);
							player1.snakeFoodVector.splice(player1.snakeFoodVector.length-1, 1);
							

						}
					else{
							recordPunishPoint("player1");
						}
						
						restartposition1();
				}
				else if(player2.x<= -10)
				{
					if(player2.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player2.snakeFoodVector[player2.snakeFoodVector.length-1]);
							player2.snakeFoodVector.splice(player2.snakeFoodVector.length-1, 1);
							
						}
					else{
							recordPunishPoint("player2");
						}
						
						restartposition2();
					
				}			
				else if(player1.x >= stage.stageWidth -30)
				{
					if(player1.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player1.snakeFoodVector[player1.snakeFoodVector.length-1]);
							player1.snakeFoodVector.splice(player1.snakeFoodVector.length-1, 1);
							
						}
					else{
							recordPunishPoint("player1");
						}
						
						restartposition1();
				}
				
				else if(player2.x >= stage.stageWidth -30)
				{
					if(player2.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player2.snakeFoodVector[player2.snakeFoodVector.length-1]);
							player2.snakeFoodVector.splice(player2.snakeFoodVector.length-1, 1);
							
						}
					else{
							recordPunishPoint("player2");
						}
						
						restartposition2();
				}
				
				else if(player1.y <= 0 )
				{
					if(player1.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player1.snakeFoodVector[player1.snakeFoodVector.length-1]);
							player1.snakeFoodVector.splice(player1.snakeFoodVector.length-1, 1);
							
						}
					else{
							recordPunishPoint("player1");
						}
						
						restartposition1();
				}
				
				else if(player2.y <= 0)
				{
					if(player2.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player2.snakeFoodVector[player2.snakeFoodVector.length-1]);
							player2.snakeFoodVector.splice(player2.snakeFoodVector.length-1, 1);
							
						}
					else{
							recordPunishPoint("player2");
						}

						restartposition2();
				}
							
				else if(player1.y >= stage.stageHeight)
				{
					if(player1.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player1.snakeFoodVector[player1.snakeFoodVector.length-1]);
							player1.snakeFoodVector.splice(player1.snakeFoodVector.length-1, 1);
							
						}
					else{
							recordPunishPoint("player1");
						}
						
						restartposition1();
				}
				
				else if(player2.y >= stage.stageHeight)
				{
				if(player2.snakeFoodVector.length > 0 )
					{
						stage.removeChild(player2.snakeFoodVector[player2.snakeFoodVector.length-1]);
						player2.snakeFoodVector.splice(player2.snakeFoodVector.length-1, 1);
						
					}
				else{
						recordPunishPoint("player2");
					}
					
					restartposition2();
				}
				
			
			
		}
		
		public function restartposition1()
		//reset the position of player 1
		{

				player1.x = 150;
				player1.y = 384;
				speed = 7;
		}
		public function restartposition2()
		//reset the position of player 2
		{
				player2.x = 900;
				player2.y = 384;
				speed = 7;
		}
		private function min(e:TimerEvent) {
		//this function set up the timer of the game
			timerCount -= 1;
			timerText.text = timerCount + "";
			if(timerCount == 0)
			//when the time count down to 0 the winner will be selected
				{
				winnertext.visible = true;
				selectwinner();
				speed= 0;
			}
			
		}		
		
		public function movePlayer(e:Event)
		//this function move the player by each frame
		{
			collision();
			player1.record();
			player2.record();
			
			player1.tail();
			player2.tail();

				if(Direction == "Left")
					{
					player1.setX(player1.getX() - speed)
					}
				else if (Direction == "Right")
					{
					player1.setX(player1.getX() + speed)
					}
				else if (Direction == "Up") 
					{
					player1.setY(player1.getY() - speed)
					}
				else if (Direction == "Down")
					{
					player1.setY(player1.getY() + speed)
					}
				else if (Direction == "")
					{
					player1.setY(player1.getY() + 0)
					}
				if(Direction2 == "Left")
					{
					player2.setX(player2.getX() - speed)
					}
				else if (Direction2 == "Right") 
					{
					player2.setX(player2.getX() + speed)
					}
				
				else if (Direction2 == "Up")
					{
					player2.setY(player2.getY() - speed)
					}
				else if (Direction2 == "Down") 
					{
					player2.setY(player2.getY() + speed)
					}
				else if (Direction2 == "")
					{
					player2.setY(player2.getY() + 0)
					
					}
		}
		function KeyDown(event:KeyboardEvent)
		//this function is used to set up the control of each player.
			{
				
				if(event.keyCode == 65)
				{
				   Direction = "Left";
				}
				else if (event.keyCode == 68) 
				{
				   Direction = "Right";

				}
				else if (event.keyCode == 87) 
				{
					Direction = "Up";
				}
				else if (event.keyCode == 83) 
				{
					Direction = "Down";
				}
				else if(event.keyCode == 37)
				{
				   Direction2 = "Left";
				}
				else if (event.keyCode == 39) 
				{
				   Direction2 = "Right";

				}
				else if (event.keyCode == 38) 
				{
					Direction2 = "Up";
				}
				else if (event.keyCode == 40) 
				{
					Direction2 = "Down";

				}
			}
			


			

			
			public function checkForCollision(e:Event):void{
			// this function is used to check for collision of the snakes and the foods
				for(var i = 0; i < mainFoodVector.length; i++){
					if(mainFoodVector[i].hitTestObject(player1)){
						speed += 0.5;//speed increase 0.5 when eat one food(for player2)
						if(speed >= 15)
						{
							speed = 15;
						}//set the max speed which is 15 for player1
						
						if(mainFoodVector[i].mytype == "O"){
							addFoodO();
						}
						else{
							addFoodX();
						}
						transferFood(mainFoodVector[i], player1);
						player1.remove3XorO();
						recordPointWin("player1");

					}
					else if(mainFoodVector[i].hitTestObject(player2)){
						speed += 0.5;//speed increase 0.5 when eat one food(for player2)
						if(speed >= 15)
						{
							speed = 15;
						}
						if(mainFoodVector[i].mytype == "O"){
							addFoodO();
						}//set the max speed which is 15 for player2
						else{
							addFoodX();
						}
						transferFood(mainFoodVector[i], player2);
						player2.remove3XorO();
						recordPointWin("player2");

					}
				}

				if(player2.hitTestObject(player1))
				//this function trigger events when players hit each other
				{
					if(player1.snakeFoodVector.length > 0 && player2.snakeFoodVector.length > 0 )
						{
							stage.removeChild(player1.snakeFoodVector[player1.snakeFoodVector.length-1]);
							player1.snakeFoodVector.splice(player1.snakeFoodVector.length-1, 1);
							stage.removeChild(player2.snakeFoodVector[player2.snakeFoodVector.length-1]);
							player2.snakeFoodVector.splice(player2.snakeFoodVector.length-1, 1);
							
						}
					else if(player1.snakeFoodVector.length > 0 && player2.snakeFoodVector.length == 0 )
						{
							stage.removeChild(player1.snakeFoodVector[player1.snakeFoodVector.length-1]);
							player1.snakeFoodVector.splice(player1.snakeFoodVector.length-1, 1);
							recordPunishPoint("player2");
							
						}
					else if(player1.snakeFoodVector.length == 0 && player2.snakeFoodVector.length > 0 )
						{
							recordPunishPoint("player1");
							stage.removeChild(player2.snakeFoodVector[player2.snakeFoodVector.length-1]);
							player2.snakeFoodVector.splice(player2.snakeFoodVector.length-1, 1);
							
						}
					else 
						{
						recordPunishPoint("player1");
						recordPunishPoint("player2");
						}
					restartposition1();
					restartposition2();
					
				}

			}

			public function recordPointWin(pointToThisPlayer)
			//this function gives player the points to win the game
			{
				if(pointToThisPlayer == "player1")
				{
					player1.incrementScore();
					callingscore();
					trace("Player 1's score increase to: ", player1.getScore());
				}
				else if (pointToThisPlayer =="player2")
				{
					player2.incrementScore();
					callingscore();
					trace("Player 2's score increase to: ", player2.getScore());
				}
			}
			
			public function recordPunishPoint(PunishpointToThisPlayer)
			//this function decrease players points for punishment 
			{
				if(PunishpointToThisPlayer == "player1")
				{
					player1.decreasementScore();
					callingscore();
					trace("Player 1's score increase to: ", player1.getScore());
				}
				else if (PunishpointToThisPlayer =="player2")
				{
					player2.decreasementScore();
					callingscore();
					trace("Player 2's score increase to: ", player2.getScore());
				}
			}
			public function callingscore()
			//this function display the scores and make the score always positive
			{
					if(player1.playerScore <= 0)
					{
						player1.playerScore = 0;
					}
					
					if(player2.playerScore <= 0)
					{
						player2.playerScore = 0;
					}

				player1Score.text = player1.getScore() + "";
				player2Score.text = player2.getScore() + "";
			}
			
			public function transferFood(food, player)
			//this function transfer food from main food vector to players body vector
			{
				for(var i = 0; i < mainFoodVector.length; i++){
					if(mainFoodVector[i] == food){
						player.snakeFoodVector.push(food);
						mainFoodVector.splice(i, 1);

					}
				}
			}
			}

			
		}