class Level {

  final int ox1, ox2;
  final int MAX_SPEED = 15;
  final int BOX_SIZE = 10;
  int oy;
  int speed = 2;
  int limit = speed * speed * 100;
  int height, width, difficulty;
  List<Box> box;
  int min_width = Ship.SHIP_SIZE * 4, max_width = Ship.SHIP_SIZE * 8;
  int max_bend = BOX_SIZE;
  int x, bend;
  float w;
  final int[] bend_factor = {-2, -1, -1, 0, 0, 0, 1, 1, 2};
  boolean even = false;

  Level(int height, int width, int ox1, int ox2, int difficulty) {
    this.ox2 = ox2;
    this.ox1 = ox1;
    this.height = height;
    this.width = width;
    this.x = width / 2;
    this.w = max_width;
    this.difficulty = difficulty;
    this.box = new ArrayList<Box>();

    int boxes_per_screen = height / BOX_SIZE + 1;
    for (int i = 0; i < boxes_per_screen / 2; i++) {
      box.add(new Box((int)(x - w), i * BOX_SIZE));
      box.add(new Box((int)(x + w), i * BOX_SIZE));
    }
    for (int i = boxes_per_screen / 2; i < boxes_per_screen; i++) {
      bend = max(-max_bend, min(max_bend, bend + bend_factor[(int) random(0, bend_factor.length)]));
      w = max(min_width, min(max_width, w + random(-BOX_SIZE, BOX_SIZE)));
      x += bend;
      box.add(new Box((int)(x - w), i * BOX_SIZE));
      box.add(new Box((int)(x + w), i * BOX_SIZE));
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
      while (x < 0) {
        x += width - BOX_SIZE;
      }
      x %= width - BOX_SIZE;
      this.x = x;
      this.y = y;
    }

    void draw() {
      fill(#6DD8D2);
      if (y + BOX_SIZE < oy) {
        y += height + BOX_SIZE;
        if (even) {
          bend = max(-max_bend, min(max_bend, bend + bend_factor[(int) random(0, bend_factor.length)]));
          w = max(min_width, min(max_width, w + random(-BOX_SIZE, BOX_SIZE)));
          Level.this.x += bend;
          x = Level.this.x - (int)w;
        } else {
          x = Level.this.x + (int)w;
        }
        
        while (x < 0) {
          x += width - BOX_SIZE;
        }
        x %= width - BOX_SIZE;
        even = !even;
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

