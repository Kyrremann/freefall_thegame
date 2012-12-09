class Intro {
  int height, width;
  List<Star> stars;
  int letterY = -150, letterX = 112, letterBase = 300;


  Intro(int height, int width) {
    this.height = height;
    this.width = width;
    randomSeed(1337^1);
    stars = new ArrayList<Star>();
    for (int i = 0; i < 1000; i++)
      stars.add(new Star((int) random(height), (int) random(width), (int) random(3)));
  }

  void draw() {
    drawBackground();
    drawTitle();
    if (letterY >= letterBase)
      drawTheGame();
  }
  
  void drawTheGame() {
    textAlign(RIGHT);
    text("THE GAME", 887, letterBase + 173);
  }

  void drawTitle() {
    fill(255);
    if (letterY < letterBase)
      letterY += 5;
    F1(letterX, letterY);
    R(letterX, letterY);
    E1(letterX, letterY);
    E2(letterX, letterY);
    F2(letterX, letterY);
    A(letterX, letterY);
    L1(letterX, letterY);
    L2(letterX, letterY);
  }

  void F1(int ox, int oy) {
    rect(ox, oy, 25, 125);
    rect(ox + 25, oy + 0, 50, 25);
    rect(ox + 25, oy + 50, 25, 25);
  }

  void R(int ox, int oy) { 
    rect(ox + 100, oy + 0, 25, 125);
    rect(ox + 125, oy + 0, 25, 25);
    rect(ox + 150, oy + 25, 25, 25);
    rect(ox + 125, oy + 50, 25, 25);
    rect(ox + 150, oy + 75, 25, 50);
  }

  void E1(int ox, int oy) {
    rect(ox + 200, oy + 0, 25, 125);
    rect(ox + 225, oy + 0, 50, 25);
    rect(ox + 225, oy + 50, 25, 25);
    rect(ox + 225, oy + 100, 50, 25);
  }

  void E2(int ox, int oy) {
    rect(ox + 300, oy + 0, 25, 125);
    rect(ox + 325, oy + 0, 50, 25);
    rect(ox + 325, oy + 50, 25, 25);
    rect(ox + 325, oy + 100, 50, 25);
  }

  void F2(int ox, int oy) {
    rect(ox + 400, oy + 0, 25, 125);
    rect(ox + 425, oy + 0, 50, 25);
    rect(ox + 425, oy + 50, 25, 25);
  }

  void A(int ox, int oy) {
    rect(ox + 500, oy + 25, 25, 100);
    rect(ox + 525, oy + 0, 25, 25);
    rect(ox + 550, oy + 25, 25, 100);
    rect(ox + 525, oy + 50, 25, 25);
  }

  void L1(int ox, int oy) {
    rect(ox + 600, oy + 0, 25, 125);
    rect(ox + 625, oy + 100, 50, 25);
  }

  void L2(int ox, int oy) {
    rect(ox + 700, oy + 0, 25, 125);
    rect(ox + 725, oy + 100, 50, 25);
  }

  void drawBackground() {
    fill(255);
    for (Star s : stars)
      s.draw();
  }

  class Star {

    int x, y, trail, size;

    Star(int y, int x, int size) {
      this.x = x;
      this.y = y;
      this.size = size;
      trail = 4;
    }

    void draw() {
      rect(x, y, size, size);
      y -= 3;
      if (y < 0)
        y = height;
    }
  }
}

