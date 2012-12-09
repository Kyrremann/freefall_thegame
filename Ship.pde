class Ship {

  float x, y;
  int height, width;
  int down = 0;
  final int SHIP_SIZE = 15;
  final int oy, ox;
  final String name;
  int horizontal = 0;
  int score = 0;
  Level level;
  float shipColor = 1;

  Ship(String name, int x, int y, int height, int width, int ox, int oy, Level level) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.oy = oy;
    this.ox = ox;
    this.height = height;
    this.width = width;
    this.level = level;
  }

  void draw() {
    x += horizontal == 0 ? .0 : horizontal == LEFT ? -6. : 6.;
    y += this.down == 0 ? 0.5 : this.down == UP ? -2. : 2.;
    score += y;

    fill(255, 255 * shipColor, 255 * shipColor);
    text(score, 200 + ox, 50);
    hittingWalls();
    if (!hittingBoxes()) {
      if (x < 0) {
        rect(0 + ox, y + oy, SHIP_SIZE - x, SHIP_SIZE);
        rect(width + x + ox, y + oy, -x, SHIP_SIZE);
      } else if (x > width - SHIP_SIZE) {
        rect(x + ox, y + oy, width - x, SHIP_SIZE);
        rect(0 + ox, y + oy, SHIP_SIZE - (width - x), SHIP_SIZE);
      } else {
        rect(x + ox, y + oy, SHIP_SIZE, SHIP_SIZE);
      }
    } else {
       shipColor -= .15;
       if (shipColor < .30)
       text("YOU DIED!", 100, 100);
    }
  }

  boolean hittingBoxes() {

    for (Level.Box b : level.box) {
      if ((x + SHIP_SIZE) < b.x)
        continue;
      if (x > (b.x + 10))
        continue;
      if ((y + SHIP_SIZE) < b.getY())
        continue;
      if (y > (b.getY() + 10))
        continue;

      return true;
    }

    return false;
  }

  void moveUp(int yPos) {
    y -= yPos;
  }

  void moveDown(int yPos) {
    y += yPos;
  }

  void moveLeft(int xPos) {
    x -= xPos;
  }

  void moveRight(int xPos) {
    x += xPos;
  }

  void hittingWalls() {
    if (y > height)
      y = 0;
    else if (x >= (width))
      x = -8;
    else if ((x + 7.5) < 0)
      x = width - 5;
  }
}

