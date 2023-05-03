class Accord {
  int len, startPosition, pitch;
  boolean play = true;
  Accord(int pitch) {
    this.pitch = pitch;
    startPosition = int(random(width-100));
  }
  void display() {
    //if (len>210) play = false;
    if (play) len+=2;
    else len--;
    if (len>0) {
      for (int i=0; i<height; i++) {
        pgc.stroke(fond.get((startPosition+len)%width, i));
        pgc.line(startPosition, i, startPosition+len, i);
      }
    }
  }
  void decline(int p) {
    if (p==pitch) play = false;
  }
  boolean isFinish() {
    return (len==0) ? true : false;
  }
}
