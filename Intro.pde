class Intro {
  int height, width;
  List<Star> stars;
  int letterY = -150, letterX = 112, letterBase = 150;
  boolean selectedOne;
  int playerState = 1;


  Intro(int height, int width) {
    this.height = height;
    this.width = width;
    this.selectedOne = true;
    randomSeed(1337^1);
    stars = new ArrayList<Star>();
    for (int i = 0; i < 1000; i++)
      stars.add(new Star(random(height), random(width), random(3)));
  }

  void draw() {
    drawBackground();
    drawTitle();
    if (letterY >= letterBase) {
      drawTheGame();
      drawMenu();
    }
  }

  int select() {
    if (letterY >= letterBase) {
      if (keyCode == UP || keyCode == DOWN) {
        selectedOne = !selectedOne;
      } else if (key == ENTER) {
        return playerState;
      }
      
    } else if (key == ENTER) {
      letterY = letterBase;
    }
    
    return 0;
  }

  void drawMenu() {
    textAlign(CENTER);
    if (selectedOne) {
      fill(255);
      text("- One player -", width / 2, height/2 + 48);
      fill(128);
      text("Two player", width / 2, height/2 + 96);
      playerState = 1;
      
    } else {
      fill(128);
      text("One player", width / 2, height/2 + 48);
      fill(255);
      text("- Two player -", width / 2, height/2 + 96);
      playerState = 2;
    }
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

    float x, y, trail, size;

    Star(float y, float x, float size) {
      this.x = x;
      this.y = y;
      this.size = size;
      trail = size * 2;
    }

    void draw() {
      //rect(x, y, size, size);
      triangle(x, y, x + size, y, x + (size / 2), y + size + trail);
      y -= size / 2;
      if (y < 0)
        y = height;
    }
  }
}

