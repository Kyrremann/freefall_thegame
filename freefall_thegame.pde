// import processing.opengl.*;

int height = 700, width = 1000;
Level level = new Level(600, 400, 50, 550, 20);
Ship playerOne = new Ship("KHE", 200, 0, 600, 400, 50, 50, level);
Ship playerTwo = new Ship("SIG", 200, 0, 600, 400, 550, 50, level);

Intro intro;

void setup() {
  size(width, height);
  background(#000000);
  noStroke();
  textAlign(CENTER);
  textFont(loadFont("ComicSansMS-48.vlw"), 48);
  intro = new Intro(height, width);
}

void draw() {
  background(0);
  intro.draw();
  /*
  fill(000);
  rect(0, 0, width, 50);
  stroke(255);
  rect(50, 50, 400, 600);
  rect(550, 50, 400, 600);
  noStroke();
  level.draw();
  playerOne.draw();
  playerTwo.draw();
  */
}

void keyPressed() {
  if (keyCode == UP) {
    playerOne.down = UP;
    playerTwo.down = UP;
  }
  else if (keyCode == DOWN) {
    playerOne.down = DOWN;
    playerTwo.down = DOWN;
  }
  else if (keyCode == LEFT) {
    playerOne.horizontal = LEFT;
    playerTwo.horizontal = LEFT;
  } 
  else if (keyCode == RIGHT) {
    playerOne.horizontal = RIGHT;
    playerTwo.horizontal = RIGHT;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    playerOne.down = 0;
    playerTwo.down = 0;
  }
  else if (keyCode == DOWN) {
    playerOne.down = 0;
    playerTwo.down = 0;
  }
  else if (keyCode == LEFT) {
    playerOne.horizontal = 0;
    playerTwo.horizontal = 0;
  }
  else if (keyCode == RIGHT) {
    playerOne.horizontal = 0;
    playerTwo.horizontal = 0;
  }
}

