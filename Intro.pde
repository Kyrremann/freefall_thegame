class Intro {
  int height, width;
  List<Star> stars;

  Intro(int height, int width) {
    this.height = height;
    this.width = width;
    randomSeed(1337);
    stars = new ArrayList<Star>();
    for (int i = 0; i < 100; i++)
    stars.add(new Star((int) random(height), (int) random(width)));
  }

  void draw() {
    drawBackground();
    drawTitle();
  }

  void drawBackground() {
    for (Star s : stars)
      s.draw();
  }

  void drawTitle() {
  }

  class Star {

    int x, y, trail;

    Star(int y, int x) {
      this.x = x;
      this.y = y;
      trail = 4;
    }

    void draw() {
      rect(x, y--, 5, 5);
      for (int i = trail; i >= 0; i--)
        rect(x + 1, y + 5, i, i);
    }
  }
}

