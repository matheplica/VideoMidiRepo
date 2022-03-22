import themidibus.*;
PImage logo, lavis;
PFont title;
String txt = "morosity";
MidiBus myBus;
boolean titleGo;
int[] midiChannel = {0, 1, 2, 3, 4, 5}; //catch noteOn from these midi channel
Event[] events = new Event[midiChannel.length];
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
int total, line = 67, selTurn = 49, alphaLogo, alphaTxt = 320;//||
void setup() {
  size(720, 400);
  frameRate(60);
  logo = loadImage("logoU.png");
  lavis = loadImage("lavis.png");
  for (int i=0; i<9; i++) {
    for (int j=0; j<16; j++) {
      bubbles.add(new Bubble(j*48, i*48, total));
      total++;
    }
  }
  title = loadFont("CartonSix-102.vlw");
  MidiBus.list();
  myBus = new MidiBus(this, 1, -1); // model:sample
  for (int i=0; i<events.length; i++) events[i] = new Event(midiChannel[i], 67+i*3);
  ellipseMode(CENTER);
  hint(ENABLE_KEY_REPEAT);
}
void draw() {
  background(128);
  strokeWeight(3);
  for (Bubble b : bubbles) b.display();
  tint(256, 255, 208, 208);
  if (alphaTxt>0 && titleGo) alphaTxt--;
  textFont(title);
  fill(29, 23, 153, alphaTxt);
  text(txt, 179, 229);
  image(lavis, 0, 0);
  if (alphaLogo>0) {
    alphaLogo+=3;
    tint(255, alphaLogo);
    image(logo, 0, 0);
  }
}
void keyPressed() {
  if (key=='v') moveLine();
  else if (key=='l') alphaLogo = 1;
  else if (key=='f') liner(3);
  else if (key=='t') titleGo =! titleGo;
}
void liner(int h) {
  //if (h==2) moveLine();
  events[h].hit();
}
void liner(int h, int p) {
  events[h].hit(p);
}
void moveLine() {
  line = (line+16)%total;
}
void quarter(int pitch) {
  if (pitch<51) bubbles.get(selTurn).hit(6);
  else {
    bubbles.get((selTurn+17)%total).hit(5);
    bubbles.get((selTurn+34)%total).hit(5);
    bubbles.get((selTurn+51)%total).hit(5);
    bubbles.get((selTurn+68)%total).hit(5);
    selTurn = (selTurn+2)%total;
  }
}
