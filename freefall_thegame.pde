int height = 700, width = 1000;
Level level = new Level(600, 400, 50, 550, 20);
Ship playerOne = new Ship("KHE", 200, 0, 600, 400, 50, 50, level);
Ship playerTwo = new Ship("SIG", 200, 0, 600, 400, 550, 50, level);
Intro intro;
int gameState;

void setup() {
  size(width, height);
  background(#000000);
  noStroke();
  textAlign(CENTER);
  textFont(loadFont("ComicSansMS-48.vlw"), 48);
  intro = new Intro(height, width);
  gameState = 0;
}

void draw() {
  switch (gameState) {
  case 0:
    background(0);
    intro.draw();
    break;
  case 1:
    fill(000);
    rect(0, 0, width, 50);
    stroke(255);
    rect(50, 50, 400, 600);
    rect(550, 50, 400, 600);
    noStroke();
    level.draw();
    playerOne.draw();
    break;
  case 2:
    fill(000);
    rect(0, 0, width, 50);
    stroke(255);
    rect(50, 50, 400, 600);
    rect(550, 50, 400, 600);
    noStroke();
    level.draw();
    playerOne.draw();
    playerTwo.draw();
    break;
  }
}

void keyPressed() {
  switch (keyCode) {
  case UP:
    if (intro != null) {
      intro.up();
      break;
    }
    playerTwo.down = UP;
    break;
  case DOWN:
    if (intro != null) {
      intro.down();
      break;
    }
    playerTwo.down = DOWN;
    break;
  case LEFT:
    playerTwo.horizontal = LEFT;
    break;
  case RIGHT:
    playerTwo.horizontal = RIGHT;
    break;
  }

  switch (key) {
  case 'w':
    playerOne.down = UP;
    break;
  case 's':
    playerOne.down = DOWN;
    break;
  case 'a':
    playerOne.horizontal = LEFT;
    break;
  case 'd':
    playerOne.horizontal = RIGHT;
    break;
  case ENTER:
    if (gameState == 0) {
      gameState = intro.playerState;
      intro = null;
    }
    break;
  }
}

void keyReleased() {
  switch (keyCode) {
  case UP:
  case DOWN:
    playerTwo.down = 0;
    break;
  case LEFT:
  case RIGHT:
    playerTwo.horizontal = 0;
    break;
  }

  switch (key) {
  case 'w':
  case 's':
    playerOne.down = 0;
    break;
  case 'a':
  case 'd':
    playerOne.horizontal = 0;
    break;
  }
}

