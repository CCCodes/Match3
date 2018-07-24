Board board;
int numX = 15;
int numY = 15;
color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255),  color(0, 255, 255)};
void setup(){
  size(600,600);
  board = new Board();
  //frameRate(15);
}

void draw(){
  background(100);
  board.update();
  board.show();
}

void mouseClicked() {
  int clickedX = mouseX / (width / numX);
  int clickedY = mouseY / (height / numY);
  println(clickedX);
  println(clickedY);
  if (board.historyX == 100 && board.historyY == 100) {
    board.historyX = clickedX;
    board.historyY = clickedY;
  } else if (abs(board.historyX - clickedX) == 1 && board.historyY == clickedY || abs(board.historyY - clickedY) == 1 && board.historyX == clickedX) {
    int temp;
    temp = board.grid[board.historyX][board.historyY];
    board.grid[board.historyX][board.historyY] = board.grid[clickedX][clickedY];
    board.grid[clickedX][clickedY] = temp;
    boolean checkClicked = board.checkAndClear(clickedX, clickedY);
    boolean checkHistory = board.checkAndClear(board.historyX, board.historyY);
    if (!checkClicked && !checkHistory) {
      temp = board.grid[board.historyX][board.historyY];
      board.grid[board.historyX][board.historyY] = board.grid[clickedX][clickedY];
      board.grid[clickedX][clickedY] = temp;
    }
    board.historyX = 100;
    board.historyY = 100;
  } else {
    board.historyX = 100;
    board.historyY = 100;
  }
}
