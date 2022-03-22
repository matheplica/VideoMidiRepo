class GlitchPool {
  PImage base;
  boolean up;
  PImage[] transform = new PImage[glPoolSize];
  GlitchPool(int id, PImage base) {
    for (int i=0; i<glPoolSize; i++) transform[i] = transform(base).get(0, 0, width, height);
  }
  PImage getImage(int i){
    return transform[i];
  }
  PImage transform(PImage img) {
    img.filter(POSTERIZE, 2);
    img = InvertColors.apply(img, boolean(int(random(2))), boolean(int(random(2))), boolean(int(random(2))));
    img = (Glitch.apply(img, int(random(3, 25)), 2)).get(0, 0, width, height);
    return img;
  }
}
