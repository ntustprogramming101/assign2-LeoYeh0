float robotX;
float robotY;
float robotSpeedX;
float soldierX=0;
float soldierY;
float soldierWidth=80;
float soldierSpeedX=5;
PImage title,restartHovered,startHovered,startNormal,restartNormal;
PImage groundhogDown;
PImage soil,bg,groundhogIdle,life,life2,life3,cabbage,gameover,soldier,groundhogLeft,groundhogRight;
int floorNumberY=floor(random(3))+1;
int floorNumberX=floor(random(8));
final int BUTTON_LEFT=248,BUTTON_RIGHT=392,BUTTON_TOP=360, BUTTON_BOTTOM=420;
int groundhogDownX=1000,groundhogDownY=-1000;
int groundhogLeftX=1000,groundhogLeftY=-1000;
int groundhogRightX=1000,groundhogRightY=-1000;
boolean downMove=false,rightMove=false,leftMove=false,move=false;
boolean upPressed, downPressed, rightPressed, leftPressed;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_WIN = 3;
int gameState = GAME_START;

float life1X=10;
float life2X=80;
float life3X=1000;
final int LIFE1 = 1;
final int LIFE2 = 2;
final int LIFE3 = 3;
int lifeCount =LIFE2;

float groundhogIdleX=320;
float groundhogIdleY=80;
float groundhogIdleSpeed=80;
float groundhogIdleWidth=80;
float groundhogIdleHeight=80;

float cabbageX;
float cabbageY;
float cabbageWidth=80;

final int TOTAL_LIFE=3;


void setup() {
  size(640, 480, P2D);//set canvans
  bg=loadImage("img/bg.jpg");
  soil= loadImage("img/soil.png");
 
  groundhogDown= loadImage("img/groundhogDown.png");
  groundhogIdle= loadImage("img/groundhogIdle.png");
  cabbage= loadImage("img/cabbage.png");
  life3= loadImage("img/life.png");
  life= loadImage("img/life.png");
  life2= loadImage("img/life.png");
  gameover= loadImage("img/gameover.jpg");
  soldier= loadImage("img/soldier.png");
  groundhogLeft= loadImage("img/groundhogLeft.png");
  groundhogRight= loadImage("img/groundhogRight.png");
  restartHovered= loadImage("img/restartHovered.png");
  restartNormal= loadImage("img/restartNormal.png");
  startHovered= loadImage("img/startHovered.png");
  startNormal= loadImage("img/startNormal.png");
  title=loadImage("img/title.jpg");
	// Enter Your Setup Code Here
//soldier position
soldierY=160+80*floor(random(4));
cabbageX=80*(floor(random(3))+1);;
cabbageY=160+(floor(random(8)));
}

void draw() {
	// Switch Game State
switch(gameState){
  // Game Start
case GAME_START:
       image(groundhogDown,groundhogDownX,groundhogDownY);
      image(groundhogLeft,groundhogLeftX,groundhogLeftY);
      image(groundhogRight,groundhogRightX,groundhogRightY);


image(title,0,0);
image(startNormal,BUTTON_LEFT,BUTTON_TOP);
  if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
&& mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
image(startHovered,BUTTON_LEFT,BUTTON_TOP);
if(mousePressed){
gameState = GAME_RUN;
}
}else{
image(startNormal,BUTTON_LEFT,BUTTON_TOP);
}
break;
// Game Run
case GAME_RUN:
  
   
   image (bg ,0,0);
  //soil
   image (soil ,0,160);
  //grass
  fill(124, 204, 25);
  noStroke();
  rect(0,145,640,15);
  
  //life
  image (life,life1X,10,50,50);
  image (life2,life2X,10,50,50);
  
  image (life3,life3X,10,50,50);
  //sun set up
  stroke(255, 255, 0);
  strokeWeight(5);
  fill(253, 184, 19);
  ellipse(590,50,120,120);
  
  //groundhogIdle movement
  image(groundhogIdle,groundhogIdleX,groundhogIdleY);
if(downPressed){
  
  groundhogDownY+=5;
 groundhogDownY=min(groundhogDownY,400);
groundhogIdleY += groundhogIdleSpeed;
downPressed=false;
if(groundhogIdleY + groundhogIdleHeight> height) 
{groundhogIdleY = height - groundhogIdleHeight;}
}
if(leftPressed){
groundhogIdleX -= groundhogIdleSpeed;
if(groundhogIdleX< 0){ groundhogIdleX= 0;}
leftPressed=false;
}
if(rightPressed){
groundhogIdleX+= groundhogIdleSpeed;
if(groundhogIdleX + groundhogIdleWidth > width)
{
groundhogIdleX = width -groundhogIdleWidth;}
rightPressed=false;

}
  //soldier cabbage detact

    
  
 
  switch(lifeCount){
     
    case LIFE2:
     life2X=80;

    if((groundhogIdleX<soldierX+soldierWidth&&groundhogIdleX + groundhogIdleWidth>soldierX)&&
  (groundhogIdleY<soldierY+soldierWidth&&groundhogIdleY+groundhogIdleWidth>soldierY)){
    groundhogIdleX=width/2;
    groundhogIdleY=80;
    life2X=1000;
    
    lifeCount=LIFE1;
    
  }
  if((groundhogIdleX<cabbageX+cabbageWidth&&groundhogIdleX + groundhogIdleWidth>cabbageX)&&
  (groundhogIdleY<cabbageY+cabbageWidth&&groundhogIdleY+groundhogIdleWidth>cabbageY)){
  cabbageX=1000;
  life3X=150;
  
   lifeCount=LIFE3;
  
  }
  break;
    case LIFE1:
    if((groundhogIdleX<soldierX+soldierWidth&&groundhogIdleX + groundhogIdleWidth>soldierX)&&
  (groundhogIdleY<soldierY+soldierWidth&&groundhogIdleY+groundhogIdleWidth>soldierY)){
    
  
    gameState = GAME_OVER;
    lifeCount=LIFE2;
  }
  if((groundhogIdleX<cabbageX+cabbageWidth&&groundhogIdleX + groundhogIdleWidth>cabbageX)&&
  (groundhogIdleY<cabbageY+cabbageWidth&&groundhogIdleY+groundhogIdleWidth>cabbageY)){
  cabbageX=1000;
  life2X=80;
  
   lifeCount=LIFE2;
  }
    break;
    
    
    
    case LIFE3:
 if((groundhogIdleX<soldierX+soldierWidth&&groundhogIdleX + groundhogIdleWidth>soldierX)&&
  (groundhogIdleY<soldierY+soldierWidth&&groundhogIdleY+groundhogIdleWidth>soldierY)){
    groundhogIdleX=width/2;
    groundhogIdleY=80;
    life3X=1000;
    
    lifeCount=LIFE2;
    }
    break;
   }
  
  //cabbage
  image(cabbage,cabbageX,cabbageY);
  //eating cabbage
  /*if((groundhogIdleX>=cabbageX&&groundhogIdleX + groundhogIdleWidth<=cabbageX+cabbageWidth)&&
  (groundhogIdleY>=cabbageY&&groundhogIdleY+groundhogIdleWidth<=cabbageY+cabbageWidth)){
 
   cabbageX=1000;
  image (life3,life3X,10,50,50);
  }*/
  //soldier
  image (soldier ,soldierX,soldierY);
  soldierX+= soldierSpeedX;
  soldierX%=720;
break;


	

		


		// Game Lose
case GAME_OVER:
soldierY=160+80*floor(random(4));
cabbageX=80*floor(random(8));
cabbageY=160+floor(random(3))+10;
groundhogIdleX=320;
groundhogIdleY=80;
image(gameover,0,0);
image(restartNormal,BUTTON_LEFT,BUTTON_TOP);
  if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
&& mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
image(restartHovered,BUTTON_LEFT,BUTTON_TOP);
if(mousePressed){
  
gameState = GAME_RUN;
lifeCount=LIFE2;
}
}else{
image(restartNormal,BUTTON_LEFT,BUTTON_TOP);
}

break;}

}
void keyPressed(){
  switch(keyCode){
case DOWN:
downPressed = true;

break;
case RIGHT:
rightPressed = true;

break;
case LEFT:
leftPressed = true;

break;}
}

void keyReleased(){
  switch(keyCode){
case UP:
upPressed = false;
break;
case DOWN:
downPressed = false;
break;
case RIGHT:
rightPressed = false;
break;
case LEFT:
leftPressed = false;
break;

  }
}
