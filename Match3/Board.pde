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
  }
  void checkAndClear() {
    replace(0, 0);
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {

        // check across
        int iScan = i + 1;
        while (iScan < grid.length && grid[iScan][j] == grid[i][j]) {
          iScan += 1;
        }

        if (iScan - i > 2) {
          score += iScan - i;
          int iReplace = i;
          while (iReplace < iScan) {
            if (j == 0) {
              grid[iReplace][j] = ceil(random(colors.length));
            } else {
              grid[iReplace][j] = grid[iReplace][j-1];
            }
            iReplace += 1;
          }
        }
        // check down
        if (j + 1 < grid[0].length && grid[i][j] == grid[i][j+1]) {
        }
      }
    }
  }
  void replace(int i, int j) {
    if (j - 1 >= 0 && grid[i][j-1] != 0) {
      grid[i][j] = grid[i][j-1];
      grid[i][j-1] = 0;
    } else {
      grid[i][j] = ceil(random(colors.length));
    }

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

    if (leftRight.size() >= 3) {
      println("Size leftRight >= 3");
      for (int n = 0; n < leftRight.size(); n++) {
        grid[int(leftRight.get(n).x)][int(leftRight.get(n).y)] = 0;
      }
      return;
    }

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
      upDown.add(new PVector(jScan, i));
      jScan += 1;
    }

    if (upDown.size() >= 3) {
      println("Size upDown >= 3");
      for (int n = 0; n < upDown.size(); n++) {
        grid[int(upDown.get(n).x)][int(upDown.get(n).y)] = 0;
      }
      return;
    }
    return;
  }
}
