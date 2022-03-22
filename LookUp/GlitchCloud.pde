class GlitchCloud {
  int glSize = 9, index;
  int[] imgList = {-4, -3, -2, -1};
  GlitchValue[] gv = new GlitchValue[glSize];
  GlitchCloud() {
    for (int i=0; i<glSize; i++) gv[i] = new GlitchValue(i);
  }
  void display() {
    for (int i=0; i<imgList.length; i++) {
      if (imgList[i]>-1) {
        int[] p = gv[imgList[i]].getPos();
        int imgId = gv[imgList[i]].getIdImg();
        int glId = gv[imgList[i]].getIdGlitch();
        int glCol = gv[imgList[i]].getCol();
        pg.tint(glCol, 241, 255, 156);
        pg.image(pools[0].getImage(glId).get(p[0], p[1], p[2], p[3]), p[0], p[1]);
      }
    }
  }
  void trig() {
    gv[index].reload();
    for (int i=0; i<imgList.length; i++) imgList[i] = (++imgList[i])%glSize;
    index = (++index)%glSize;
  }
  void nextGlitch(){
    for(int i=0; i<gv.length; i++)  gv[i].nextGlitch();
  }
  int[] prePos(int i) {
    return gv[i-1].getPos();
  }
  int preCol(int i){
    return gv[i-1].getCol();
  }
  int preIdImg(int i) {
    return gv[i-1].getIdImg();
  }
  int preIdGlitch(int i){
    return gv[i-1].getIdGlitch();
  }
}
