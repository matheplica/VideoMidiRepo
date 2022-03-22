import themidibus.*;
import milchreis.imageprocessing.*;
MidiBus myBus;
PGraphics pg, sq;
int currentCloud = -1, currentGlitch, col, basePoolSize = 12, glPoolSize = 3;
Cloud[] clouds = new Cloud[basePoolSize];
GlitchPool[] pools = new GlitchPool[basePoolSize];
GlitchCloud gCloud;
int[] midiChannel = {1, 2, 5}; //catch noteOn from these midi channel
boolean[] swipNote = {true, true, true};
boolean goSquare;
void setup() {
  size(720, 400, P2D);
  frameRate(60);
  noCursor();
  pg = createGraphics(width, height, P2D);
  sq = createGraphics(width, height, P2D);
  for (int i=0; i<basePoolSize; i++) clouds[i] = new Cloud(i, loadImage(nf((i+1), 2)+".jpg"));
  gCloud = new GlitchCloud();
  createIntro();
  loadLogo();
  MidiBus.list();
  myBus = new MidiBus(this, 1, -1); // model:sample
  hint(ENABLE_KEY_REPEAT);
  background(0, 0, 100);
}
void draw() {
  if (currentCloud<0) {
    drawIntro();
    image(pgIntro, 0, 0);
  } else {
    pg.beginDraw();
    pg.tint(255, 18);
    clouds[currentCloud].display();
    pg.noStroke();
    gCloud.display();
    pg.endDraw();
    noTint();
    image(pg, 0, 0);
    drawSquares();
    if(goSquare && frameCount%2==0) moreSquare();
    image(sq, 0, 0);
  }
}
void switchCloud() {
  currentCloud = newRand(currentCloud, basePoolSize); //++currentCloud%poolImgSize;
}
void moveGlitch() {
  gCloud.nextGlitch();
}
void switchGlitch() {
  gCloud.trig();
}
void moreSquare() {
  if (row<squares-1) row ++;
  else {
    cow++;
    row = 0;
  }
}
void keyPressed() {
  if (key=='i') switchCloud();
  else if (key=='m') moveGlitch();
  else if (key=='p') switchGlitch();
  else if (key=='l') goSquare =! goSquare;
}
