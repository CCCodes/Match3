class Board {
  int[][] candies;
  int w;
  int h;
  int score;
  Board() {
    score = 0;
    candies = new int[numX][numY];
    for (int i = 0; i < candies.length; i++) {
      for (int j = 0; j < candies[0].length; j++) {
        candies[i][j] = floor(random(colors.length));
      }
    }
    checkAndClear();
  }
  void update() {
    
  }
  void show() {
    for (int i = 0; i < candies.length; i++) {
      for (int j = 0; j < candies[0].length; j++) {
        fill (colors[candies[i][j]]);
        rect(i * width / numX, j * height / numY, width / numX, height / numY);
      }
    }
  }
  void checkAndClear() {
    for (int i = 0; i < candies.length; i++) {
      for (int j = 0; j < candies[0].length; j++) {
        
        // check across
        int iScan = i + 1;
        while (iScan < candies.length && candies[iScan][j] == candies[i][j]) {
          iScan += 1;
        }
        
        if (iScan - i > 2) {
          score += iScan - i;
          int iReplace = i;
          while (iReplace < iScan) {
            if (j == 0) {
              candies[iReplace][j] = floor(random(colors.length));
            } else {
              candies[iReplace][j] = candies[iReplace][j-1];
            }
            iReplace += 1;
          }
        }
        // check down
        if (j + 1 < candies[0].length && candies[i][j] == candies[i][j+1]) {
          
        }
      }
    }
  }
}
