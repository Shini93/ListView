scrollList list;
PGraphics test;

void setup(){
   size(800,800);
   list = new scrollList(150,200,400,400, 30,30);
   //list.hFieldY = 80;
   list.setFieldSize(5,5);
   
   for(int i = 0; i < list.maxX * list.maxY; i++)
     list.addField(str((i % 30)));
   list.nextRow();
   
   test = createGraphics(width,height);
   list.setGraphicContext(test);
  
   textSize(30);
}

void draw(){
  background(125);
  test.beginDraw();
  list.drawList();
  test.endDraw();
  image(test,0,0);
}

void mousePressed(){
  println(list.itemClicked());
}
