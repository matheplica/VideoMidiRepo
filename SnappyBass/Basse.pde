class Basse {
  int x, y, s, contour;
  color col;
  Basse(int x) {
    col = color(255, random(220), random(120, 200));
    s = int(random(40, 80));
    this.x = x*42;
    y = height>>1;
    contour = int(random(12, 20));
  }
  void display() {
    pg.strokeWeight(contour);
    pg.stroke(255, 160);
    pg.fill(col, 140);
    pg.circle(x, y, s);
    if (contour>0) contour--;
    if (y<(height+160)) {
      x-=2;
      y+=2;
    }
  }
  boolean isFinish() {
    return (y>=height+160) ? true : false;
  }
}
