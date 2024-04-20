class scrollList {
  PVector size;
  PVector pos;
  int hField;
  int count = 0;
  ArrayList <ArrayList <String>> fields = new ArrayList <ArrayList <String>>();
  ArrayList <String> dummyListRow  = new ArrayList <String>();
  color bg = #CCCCCC;
  color border = #000000;
  private float percY = 0;
  private float percX = 0;
  int strokeW = 1;
  color strokeC = 0;

  Slider sliderV;
  Slider sliderH;

  scrollList(int px, int py, int sx, int sy) {
    size = new PVector(sx, sy);
    pos = new PVector(px, py);
    hField = 60;
    //sliderV = new SliderVer(sx + px, py, 10, sy, 10);
    sliderH = new Slider(px, py + sy, sx, 10, 10, false);
    sliderV = new Slider(sx + px, py, 10, sy, 10, true);
  }

  void addString(String text) {
    dummyListRow.add(text);
  }

  void nextRow() {
    count ++;
    fields.add(dummyListRow);
    dummyListRow  = new ArrayList <String>();
  }

  void update() {
    sliderV.display();
    sliderV.update(10);
    sliderH.display();
    sliderH.update(10);
    percY = sliderV.getPosCalc() - 1;
    percX = 1 - sliderH.getPosCalc();
  }

  void drawList() {
    drawCanvas();
    update();
    drawFields();
  }

  void drawCanvas() {
    stroke(border);
    fill(bg);
    rect(pos.x, pos.y, size.x, size.y);
  }

  void drawFields() {
    fill(0);
    int offsetY = hField;
    int offsetX = hField;
    int posY = round(size.y * percY) + offsetY;
    int posX = round(size.x * percX) + offsetX;
    for (int y = 0; y < fields.size(); y ++) {
      for (int r = 0; r < fields.get(y).size(); r++) {
        if (checkFieldVisible(y, r) == true) {
          if (strokeW > 0) {
            strokeWeight(strokeW);
            stroke(strokeC);
            noFill();
            rect(pos.x + (r - 1) * hField + posX, pos.y + ( y - 1 )* hField +  posY, hField, hField);
          }
          text(fields.get(y).get(r), pos.x + (r - 1) * hField + posX, pos.y + y * hField +  posY);
        }
      }
    }
  }

  void addField(String text) {
    dummyListRow.add(text);
  }

  boolean checkFieldVisible(int nr, int r) {
    float bottom = (size.y / hField) * (1 - percY);
    float right = (size.x / hField) * (1 - percX);
    if (nr + 1 > bottom)    //bottom blend out
      return false;
    if (nr  < bottom - (size.y / hField) )    //bottom blend out
      return false;

    if (r + 1 > right)    //bottom blend out
      return false;
    if (r  < right - (size.x / hField) )    //bottom blend out
      return false;
    return true;
  }

  int[] itemClicked() {
    int[] id = {-1, -1};
    if (mouseX < pos.x || mouseX > pos.x + size.x)
      return id;
    if (mouseY < pos.y || mouseY > pos.y + size.y)
      return id;

    int offsetY = hField;
    int offsetX = hField;
    int posY = round(size.y * percY + pos.y) + offsetY ;
    int posX = round(size.x * percX + pos.x) + offsetX ;

    for (int y = 0; y < fields.size(); y ++) {
      for (int r = 0; r < fields.get(y).size(); r++) {
        if (checkFieldVisible(y, r) == true) {
          if (mouseY > posY + (y - 1) * hField && mouseY < posY + (y ) * hField) {
            id[0] = y;
          }
          if (mouseX > posX + (r - 1 ) * hField && mouseX < posX + (r ) * hField) {
            id[1] = r;
          }
        }
      }
    }
    return id;
  }
}
