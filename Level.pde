class Level {

  final int ox1, ox2;
  int oy;
  int height, width, difficulty;
  List<Box> box;

  Level(int height, int width, int ox1, int ox2, int difficulty) {
    this.ox2 = ox2;
    this.ox1 = ox1;
    this.height = height;
    this.width = width;
    this.difficulty = difficulty;
    this.box = new ArrayList<Box>();

    for (int i = 0; i < difficulty; i++) {
      box.add(new Box((int) random(0, width - 10), (int) random(0, height)));
    }
  }

  void draw() {
    oy += 15;
    for (Box b : box)
      b.draw();
  }

  class Box {
    int x, y;
    Box(int x, int y) {
      this.x = x;
      this.y = y;
    }

    void draw() {
      fill(#6DD8D2);
      if (y < oy) {
        y += height;
        x = (int) random(width - 10);
      }
      
      rect(x + ox1, y + 50 - oy, 10, min(height - y + oy, 10));
      rect(x + ox2, y + 50 - oy, 10, min(height - y + oy, 10));
    }

    int getY() {
      return y - oy;
    }
  }
}

