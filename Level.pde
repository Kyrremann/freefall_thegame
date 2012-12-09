class Level {

  final int ox1, ox2;
  final int MAX_SPEED = 15;
  final int BOX_SIZE = 10;
  int oy;
  int speed = 2;
  int limit = speed * speed * 100;
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
      box.add(new Box((int) random(0, width - BOX_SIZE), (int) random(0, height)));
    }
  }

  void draw() {
    oy += speed;

    if (oy >= limit) {
      for (Box b : box) {
        b.y -= oy;
      }

      oy = 0;
      if (speed < MAX_SPEED) {
        speed++;
        limit = speed * speed * 100;
      }
    }

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
      if (y + BOX_SIZE < oy) {
        y += height + BOX_SIZE;
        x = (int) random(width - BOX_SIZE);
      }

      if (y < oy) {
        rect(x + ox1, 50, BOX_SIZE, BOX_SIZE - oy + y);
        rect(x + ox2, 50, BOX_SIZE, BOX_SIZE - oy + y);
      } 
      else {
        rect(x + ox1, y + 50 - oy, BOX_SIZE, min(height - y + oy, BOX_SIZE));
        rect(x + ox2, y + 50 - oy, BOX_SIZE, min(height - y + oy, BOX_SIZE));
      }
    }

    int getY() {
      return y - oy;
    }
  }
}

