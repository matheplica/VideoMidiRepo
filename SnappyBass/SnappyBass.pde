import rwmidi.*;
MidiInput input;
ArrayList<Buble> bubles = new ArrayList<Buble>();
ArrayList<Accord> acr = new ArrayList<Accord>();
ArrayList<Basse> bass = new ArrayList<Basse>();
PImage fond, logo;
PGraphics pg, pgc;
boolean moveLogo;
PFont font;
int noteBasse = 72, alphaLogo = 32, alphaTitle = 420, rideau, step;
float rotation;
void setup() {
  size(720, 400, P2D);
  pg = createGraphics(width, height, P2D);
  pgc = createGraphics(width, height, P2D);
  fond = loadImage("studio.png");
  logo = loadImage("logo.png");
  font = createFont("right.ttf", 78);
  MidiInputDevice devices[] = RWMidi.getInputDevices();
  for (int i = 0; i < devices.length; i++) println(i + ": " + devices[i].getName());
  input = RWMidi.getInputDevices()[1].createInput(this);
  //hint(ENABLE_KEY_REPEAT);
}
void noteOnReceived(Note note) {
  println("note on "+note.getChannel()+"  "+note.getPitch()+"  "+note.getVelocity());
  if (step!=2 && note.getChannel()==0) {
    step = 1;
    bubles.add(new Buble(color((note.getPitch()-50)*24, 160, random(200, 320))));
  } else if (note.getChannel()==1) acr.add(new Accord(note.getPitch()));
  else if (note.getChannel()==2) {
    bass.add(new Basse(note.getPitch()-44));
    step = 2;
  }
}
void noteOffReceived(Note note) {
  if (note.getChannel()==1) for (int i=0; i<acr.size(); i++) acr.get(i).decline(note.getPitch());
}
void draw() {
  pgc.beginDraw();
  pgc.image(fond, 0, 0);
  for (int i=0; i< acr.size(); i++) {
    acr.get(i).display();
    if (acr.get(i).isFinish()) acr.remove(i);
  }
  if (alphaTitle>0 && step!=2) {
    if (step==1) alphaTitle-=2;
    pgc.fill(255, alphaTitle);
    pgc.textFont(font);
    pgc.text("snappy bass", 116, 208);
  }
  pgc.endDraw();
  pg.beginDraw();
  pg.background(255, 0);
  pg.pushMatrix();
  pg.translate(width>>1, height>>1);
  for (int i=0; i< bubles.size(); i++) {
    bubles.get(i).display();
    if (bubles.get(i).isFinish()) bubles.remove(i);
  }
  pg.popMatrix();
  for (int i=0; i< bass.size(); i++) {
    bass.get(i).display();
    if (bass.get(i).isFinish()) bass.remove(i);
  }
  pg.endDraw();
  image(pgc, 0, 0);
  image(pg, 0, 0);
  if (moveLogo) {
    if (alphaLogo<325) alphaLogo += 4;
    tint(255, alphaLogo);
    stroke(264, 197, 88, alphaLogo-60);
    strokeWeight(9);
    strokeCap(SQUARE);
    if (rideau<height) rideau += 4;
    for (float i=0; i<rideau; i+=23) {
      line(0, i, width, i);
    }
    image(logo, 160, 0);
  }
}

void keyPressed() {
  if (key=='a') acr.add(new Accord(98));
  else if (key=='s') bubles.add(new Buble(color(160, 160, random(200, 320))));
  else if (key=='d') bass.add(new Basse(int(random(60, 90))));
  else if (key=='l') moveLogo = true;
  else if (key==' ') {
    step = (++step)%3;
    alphaTitle = 255;
  }
}
