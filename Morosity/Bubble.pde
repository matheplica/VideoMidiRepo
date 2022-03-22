class Bubble {
  int x, y, w = 64, h = w;
  int id, alpha = int(random(120, 195));
  color col;
  boolean mooving;
  Bubble(int x, int y, int id) {
    this.x = x;
    this.y = y;
    this.id = id;
    col = color(255);
  }
  void display() {
    stroke(255, alpha);
    if (h>64) {
      h--;
      w = h;
      fill(col, 215);
    } else {
      if (frameCount%6==0) changeCol(16);
      fill(col, alpha);
    }
    if (w<60) w += 4;
    ellipse(x, y, w, h);
  }
  void changeCol(int range) {
    col = color(((col>>16) & 0xFF)+random(-range, range*2), ((col>>8) & 0xFF)+random(-range, range*2), (col&0xFF)+random(-range, range*2));
  }
  void darkCol(int range) {
    col = color(((col>>16) & 0xFF)-random(range*4), ((col>>8) & 0xFF)-random(range*4), (col&0xFF)-random(range*4));
  }
  void redCol(int range) {
    col = color(244, random(-range, range*2), random(-range, range*2));
  }
  void greenCol(int range) {
    col = color(random(-range, range*2), 244, random(-range, range*2));
  }
  void blueCol(int range) {
    col = color(random(-range, range*2), random(-range, range*2), 244);
  }
  void yellowCol(int range) {
    col = color(244, 244+random(-range, range), random(-range, range*2));
  }
  void blackCol(int range) {
    col = color(random(-range, range), random(-range, range), random(-range, range*2));
  }
  void hit(int i) {
    if (i==0) {
      w = h = 132;
      blueCol(96);
    } else if (i==1) {
      w = h = 100;
      redCol(92);
    } else if (i==2) {
      w = h = 118;
      greenCol(64);
    } else if (i==3) {
      w = h = 104;
      yellowCol(64);
    } else if (i==4) {
      w = h = 88;
      blackCol(144);
    } else if (i==5) {
      col = color(85, 205, 239);
      h = 112;
    } else if (i==6) {
      col = color(221, 34, 198);
      h = 124;
    } else if (i==7) {
      w = h = 144;
      blackCol(98);
    }
  }
}
