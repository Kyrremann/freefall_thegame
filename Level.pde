class Level {

  final int ox1, ox2;
  final int MAX_SPEED = 15;
  final int BOX_SIZE = 10;
  int speed = 2;
  int limit = speed * speed * 100;
  int height, width, difficulty;
  List<Box> box;
  int min_width = Ship.SHIP_SIZE * 4, max_width = Ship.SHIP_SIZE * 8;
  int max_bend = BOX_SIZE;
  int x, y, bend;
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
      box.add(new Wall((int)(x - w), i * BOX_SIZE));
      box.add(new Wall((int)(x + w), i * BOX_SIZE));
    }
    for (int i = boxes_per_screen / 2; i < boxes_per_screen; i++) {
      bend = max(-max_bend, min(max_bend, bend + bend_factor[(int) random(0, bend_factor.length)]));
      w = max(min_width, min(max_width, w + random(-BOX_SIZE / 2, BOX_SIZE / 2)));
      x += bend;
      box.add(new Wall((int)(x - w), i * BOX_SIZE));
      box.add(new Wall((int)(x + w), i * BOX_SIZE));
    }
  }

  void draw() {
    y += speed;

    if (y >= limit) {
      y = 0;
      if (speed < MAX_SPEED) {
        speed++;
        limit = speed * speed * 100;
      }
    }

    for (Box b : box)
      b.draw();
  }

  class Wall extends Box {
    Wall(int x, int y) {
      super(x, y, Level.this.height, Level.this.width, ox1, 50, BOX_SIZE, color(112, 208, 208));
      while (x < 0) {
        x += width;
      }
      x %= width;
      this.x = x;
    }

    void draw() {
      y -= speed;

      if (y < -size) {
        y += height + size;
        if (even) {
          bend = max(-max_bend, min(max_bend, bend + bend_factor[(int) random(0, bend_factor.length)]));
          w = max(min_width, min(max_width, w + random(-BOX_SIZE / 2, BOX_SIZE / 2)));
          Level.this.x += bend;
          x = Level.this.x - w;
        } else {
          x = Level.this.x + w;
        }
        
        while (x < 0) {
          x += width;
        }
        x %= width;
        even = !even;
      }

      ox = ox1;
      super.draw();
      ox = ox2;
      super.draw();
    }
  }
}

