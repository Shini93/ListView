scrollList list = new scrollList(350,200,400,400);

void setup(){
   size(800,800);
   list.addField("10");
   list.addField("20");
   list.addField("30");
   list.addField("10");
   list.addField("20");
   list.addField("30");
   list.addField("10");
   list.addField("20");
   list.addField("30");
   
   list.nextRow();
   
   list.addField("40");
   list.addField("50");
   list.addField("60");
   list.addField("40");
   list.addField("50");
   list.addField("60");
   list.addField("40");
   list.addField("50");
   list.addField("60");
   list.nextRow();
   
   list.addField("70");
   list.addField("80");
   list.addField("90");
   list.addField("70");
   list.addField("80");
   list.addField("90");
   list.addField("70");
   list.addField("80");
   list.addField("90");
   list.nextRow();
   
   list.addField("10");
   list.addField("20");
   list.addField("30");
   list.addField("10");
   list.addField("20");
   list.addField("30");
   list.addField("10");
   list.addField("20");
   list.addField("30");
   
   list.nextRow();
   
   list.addField("40");
   list.addField("50");
   list.addField("60");
   list.addField("40");
   list.addField("50");
   list.addField("60");
   list.addField("40");
   list.addField("50");
   list.addField("60");
   list.nextRow();
   
   list.addField("70");
   list.addField("80");
   list.addField("90");
   list.addField("70");
   list.addField("80");
   list.addField("90");
   list.addField("70");
   list.addField("80");
   list.addField("90");
   list.nextRow();

   textSize(30);
}

void draw(){
  list.drawList();
  
  
}

void mousePressed(){
  println(list.itemClicked());
}
