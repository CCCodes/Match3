Board board;
int numX = 15;
int numY = 15;
color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255),  color(0, 255, 255)};
void setup(){
  size(600,600);
  board = new Board();
  frameRate(1);
}

void draw(){
  background(100);
  board.update();
  board.show(); 
}
