class Ship extends Box{

  int down = 0;
  static final int SHIP_SIZE = 15;
  final String name;
  int horizontal = 0;
  int score = 0;
  Level level;
  float hp = 1;

  Ship(String name, int x, int y, int height, int width, int ox, int oy, Level level) {
    super(x, y, height, width, ox, oy, SHIP_SIZE, color(255, 255, 255));
    this.name = name;
    this.level = level;
  }

  void draw() {
    x += horizontal == 0 ? .0 : horizontal == LEFT ? -6. : 6.;
    y += this.down == 0 ? 0.5 : this.down == UP ? -2. : 2.;
    score += y;

    fill(c);
    text(score, 200 + ox, 50);
    hittingWalls();
    
    super.draw();
    
    if(hittingBoxes()) {
       hp -= .15;
       setColor(255, int(255 * hp), int(255 * hp));
       if (hp < .30)
       text("YOU DIED!", 100, 100);
    }
  }

  boolean hittingBoxes() {

    for (Box b : level.box) {
      if (collides(b))
        return true;
    }

    return false;
  }

  void hittingWalls() {
    if (y > height)
      y = 0;
    else if (x >= (width))
      x = 0;
    else if (x < 0)
      x = width + x;
  }
}

