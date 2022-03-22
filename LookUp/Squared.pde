int cow, row = -1, squares = 36, sqSize = 20;
BufferedReader reader;
StringList lines = new StringList();
void drawSquares() {
  sq.beginDraw();
  sq.noStroke();
  if (cow<20 && row>-1) {
    if (lines.get(19-cow).charAt(row)=='1') sq.fill(255);
    else sq.fill(20, 56, random(220), random(120, 255));
    sq.rect(row*sqSize, height-(cow*sqSize), sqSize, -sqSize-int(random(10)));
  }
   sq.endDraw();
}
void loadLogo() {
  reader = createReader("logo.txt");
  String line;
  try {
    while ((line = reader.readLine()) != null) {
      lines.append(line);
    }
  }
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }
}
