int step;
int[] bassPath =  {34, 19, 36, 51, 66, 83};
class Event {
  int mc, selBubble;
  Event(int midiChannel, int start) {
    mc = midiChannel;
    selBubble = start;
  }
  void hit() {
    if (mc==0) selBubble = bassPath[step++%bassPath.length];//bassPath[step = newRand(step, bassPath.length)];//
    else if (mc==1) selBubble = (selBubble>17) ? selBubble-17 : selBubble+118;
    else if (mc==3) selBubble = (++selBubble)%total;
    bubbles.get(selBubble).hit(mc);
  }
  void hit(int p) {
    if (p==76) bubbles.get(93).hit(2);
    else if (p==50) bubbles.get(107).hit(7);
    else if (p==61) {
      bubbles.get(57).hit(4);
    } else if (p==58) {
      bubbles.get(61).hit(4);
    } else if (p==60) {
      bubbles.get(59).hit(4);
    } else if (p==59) {
      bubbles.get(59).hit(4);
    } else if (p==62) {
      bubbles.get(55).hit(4);
    }
  }
}
