class Cloud{
  int id;
  PImage base, transform;
  Cloud(int id, PImage base) {
    pools[id] = new GlitchPool(id, base.get());
    if(id==0) transform = dotBlue(base);
    else transform = dotTone(base);
  }
  void display() {
    pg.image(transform, 0, 0);
  }
  PImage getImg(){
    return transform;
  }
  PImage dotTone(PImage img){
    img.filter(INVERT);
    img = Halftone.apply(img, 5, color(255), color(random(355), random(205), 84)).get(0, 0, width, height);
    return img;
  }
  PImage dotBlue(PImage img) {
    img.filter(INVERT);
    img = Halftone.apply(img, 5, color(255), color(48, 32, 126)).get(0, 0, width, height);
    return img;
  }
}
