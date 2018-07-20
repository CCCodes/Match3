class Candy {
  color my_color;
  PVector pos;
  
  Candy(int i, int j) {
    my_color = colors[floor(random(colors.length))];
    pos = new PVector(i, j);
  }
  void update() {
  
  }
  void show() {
    fill(my_color);
    rect(pos.x * width / numX, pos.y * width / numY, width/numX, height/numY);
  }
}
