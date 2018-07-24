class Board {
  int[][] grid;
  int w;
  int h;
  int score;
  int historyX;
  int historyY;
  Board() {
    score = 0;
    grid = new int[numX][numY];
    historyX = 100;
    historyY = 100;
  }
  void test() {
  }
  void update() {
    for (int j = grid.length - 1; j >= 0; j--) {
      for (int i = 0; i < grid.length; i++) {
        if (grid[i][j] == 0) {
          replace(i, j);
          return;
        }
      }
    }
  }
  void show() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        if (grid[i][j] != 0) {
          fill(colors[grid[i][j] - 1]);
          rect(i * width / numX, j * height / numY, width / numX, height / numY);
        }
      }
    }
    if (historyX != 100 && historyY != 100) {
      fill(0, 0, 0, 100);
      rect(historyX * width / numX, historyY * height / numY, width / numX, height / numY);
    }
    text(score, 0, 0);
  }
  ArrayList<PVector> checkX(int i, int j) {
    ArrayList<PVector> leftRight = new ArrayList<PVector>();
    leftRight.add(new PVector(i, j));
    int iScan;
    // check left
    iScan = i - 1;
    while (iScan >= 0 && grid[iScan][j] == grid[i][j]) {
      leftRight.add(new PVector(iScan, j));
      iScan -= 1;
    }
    // check right
    iScan = i + 1;
    while (iScan < numX && grid[iScan][j] == grid[i][j]) {
      leftRight.add(new PVector(iScan, j));
      iScan += 1;
    }
    return leftRight;
  }
  ArrayList<PVector> checkY(int i, int j) {
    ArrayList<PVector> upDown = new ArrayList<PVector>();
    upDown.add(new PVector(i, j));
    int jScan;

    // check up
    jScan = j - 1;
    while (jScan >= 0 && grid[i][jScan] == grid[i][j]) {
      upDown.add(new PVector(i, jScan));
      jScan -= 1;
    }

    // check down
    jScan = j + 1;
    while (jScan < numY && grid[i][jScan] == grid[i][j]) {
      upDown.add(new PVector(i, jScan));
      jScan += 1;
    }
    return upDown;
  }
  boolean checkAndClear(int i, int j) {
    
    ArrayList<PVector> leftRight = checkX(i, j);
    ArrayList<PVector> upDown = checkY(i, j);
    boolean cleared = false;
    if (leftRight.size() >= 3) {
      cleared = true;
      for (int n = 0; n < leftRight.size(); n++) {
        grid[int(leftRight.get(n).x)][int(leftRight.get(n).y)] = 0;
      }
    }

    if (upDown.size() >= 3) {
      cleared = true;
      for (int n = 0; n < upDown.size(); n++) {
        grid[int(upDown.get(n).x)][int(upDown.get(n).y)] = 0;
      }
    }
    
    return cleared;
  }
  void replace(int i, int j) {
    int scanJ = j - 1;
    while (scanJ >= 0 && grid[i][scanJ] == 0)  {
      scanJ -= 1;
        
    }
    if (scanJ >= 0) {
      grid[i][j] = grid[i][scanJ];
      grid[i][scanJ] = 0;
    } else {
      grid[i][j] = ceil(random(colors.length));
    }
    checkAndClear(i, j);
  }
}
