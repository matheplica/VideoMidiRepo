class Buble {
  int x, s, contour;
  float rotation, rotPulse;
  color col;
  Buble(color c) {
    rotation = random(TWO_PI);
    rotPulse = random(0.12);
    col = c;
    s = int(random(20, 60));
    x = int(random(36, 200));
    contour = int(random(12, 20));
  }
  void display() {
    pg.pushMatrix();
    pg.strokeWeight(contour);
    pg.stroke(255, 160);
    pg.fill(col, 140);
    pg.rotate(rotation);
    rotation += rotPulse;
    pg.circle(x, 0, s);
    pg.popMatrix();
    if (contour>0) contour--;
    else if (s>0) s--;
  }
  boolean isFinish() {
    return (s==0) ? true : false;
  }
}
