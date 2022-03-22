PGraphics pgIntro;
PImage cloud;
int modulo, celSize = 72000;
int[] cache = new int[celSize];
void createIntro() {
  pgIntro = createGraphics(width, height, P2D);
  cloud = clouds[0].getImg();//loadImage(nf(int(random(12))+1, 2)+".jpg");
  for (int i=0; i<width>>1; i++) {
    for (int j=0; j<height>>1; j++) {
      cache[i+(j*width>>1)] = int(random(320));
    }
  }
}
void drawIntro() {
  pgIntro.beginDraw();
  pgIntro.image(cloud, 0, 0);
  pgIntro.noStroke();
  for (int i=0; i<width>>1; i++) {
    for (int j=0; j<height>>1; j++) {
      if (modulo%3==0) cache[i+(j*width>>1)]++;
      pgIntro.fill(cache[i+(j*width>>1)]);
      pgIntro.rect(i*2, j*2, 2, 2);    
    }
  }
  modulo++;
  pgIntro.endDraw();
}
