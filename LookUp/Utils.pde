int newRand(int initial, int max) {
  int result;
  do result = int(random(max));
  while (result == initial);
  return result;
}
int newRand(int initial, int min, int max) {
  int result;
  do result = int(random(min, max));
  while (result == initial);
  return result;
}
void noteOn(int channel, int pitch, int velocity) {
  if (channel == midiChannel[0]) {
    if (swipNote[0]) switchGlitch();
    swipNote[0] =! swipNote[0];
  } else if (channel == midiChannel[1]) {
    if (swipNote[1]) moveGlitch();
    swipNote[1] =! swipNote[1];    
  } else if (channel == midiChannel[2]) {
    if (swipNote[2]) switchCloud(); 
    swipNote[2] =! swipNote[2];  
  }
}
