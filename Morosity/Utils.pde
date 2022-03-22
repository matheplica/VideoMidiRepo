boolean swip;
void noteOn(int channel, int pitch, int velocity) {
  if (channel == midiChannel[0]) liner(0);
  else if (channel == midiChannel[1])liner(1);
  else if (channel == midiChannel[2]) liner(2, pitch);
  else if (channel == midiChannel[3]) liner(3);
  else if (channel == midiChannel[4]) liner(4, pitch);
  else if (channel == midiChannel[5]) {
    if(swip) quarter(pitch);
    swip =! swip;
  }
}
int newRand(int initial, int max) {
  int result;
  do result = int(random(max));
  while (result == initial);
  return result;
}
/*void noteOn(int channel, int pitch, int velocity) {
 if (channel == midiChannel[0]) {
 if (swipNote[0]) bubbles.get(140).hit();
 swipNote[0] =! swipNote[0];
 } else if (channel == midiChannel[1]) {
 if (swipNote[1]) bubbles.get(141).hit();
 swipNote[1] =! swipNote[1];
 } else if (channel == midiChannel[2]) {
 if (swipNote[2]) bubbles.get(142).hit();
 swipNote[2] =! swipNote[2];
 }else if (channel == midiChannel[3]) {
 if (swipNote[3]) bubbles.get(143).hit();
 swipNote[3] =! swipNote[3];
 }
 }*/
