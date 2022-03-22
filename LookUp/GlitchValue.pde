class GlitchValue {
  int id, idImg, idGlitch, col;
  int[] p = {0, 0, 0, 0}; // 0:x - 1:y - 2:w - 3:h
  GlitchValue(int id) {
    this.id = id;
  }
  void reload() {
    if (id==0) {
      col = int(random(36, 205));
      idImg = newRand(idImg, basePoolSize);
      idGlitch = (++idGlitch)%glPoolSize;
      p[0] = int(random(width>>2));
      p[1] = int(random(height>>4, height-(height>>1)));
      p[2] = int(random(12, 156));
      p[3] = int(random(48, 164));
    } else {
      col = gCloud.preCol(id);
      idImg = gCloud.preIdImg(id);
      idGlitch = gCloud.preIdGlitch(id);
      int[] g = gCloud.prePos(id);
      p[0] = g[0]+g[2]+max(0, int(random(-32, 10)));
      p[1] = g[1]+int(random(-36, 36));
      p[2] = int(random(12, 96));
      p[3] = g[3]+max(0, int(random(-g[3]-24, 96)));
    }
  }
  int[] getPos() {
    return p;
  }
  int getCol() {
    return col;
  }
  int getIdImg() {
    return idImg;
  }
  int getIdGlitch() {
    return idGlitch;
  }
  void nextGlitch() {
    idGlitch = newRand(idGlitch, glPoolSize);
  }
}
