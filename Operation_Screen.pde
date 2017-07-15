class Operation_Screen {
  float posX;
  float screenWidth;  
  String turn[]={"Role Dice", "Make Road", "Make Road  \n or \n Bomb!", "Waiting"};
  String ItemName[]={"Human", "Car", "Construct", "Rail", "Tunnel", "Bomb"};
  int roadType;
  Item_Button [] button=new Item_Button [6];

  Operation_Screen(float _posX) {
    roadType=-1;
    posX=_posX;
    screenWidth=width-posX;
    for (int i=0; i<button.length; i++)
      button[i]=new Item_Button(ItemName[i], height/3+i*height/9);
  }

  void draw() {
    pushMatrix();
    strokeWeight(1);
    translate(posX, 0);
    stroke(#0a0a0a);
    fill(#F4F5F7);
    rect(-1, height/3, screenWidth, height);
    this.drawTurn();
    for (int i=0; i<button.length; i++)
      button[i].draw((screenWidth)/2);
    if (roadType!=-1)this.drawCursor(roadType);
    popMatrix();
    noFill();
  }

  void drawTurn() {
    stroke(#f4f5f7);
    textSize(40);
    noFill();
    rect(0, 0, screenWidth, height/3);
    fill(255);
    text(turn[2], (screenWidth)/2, height/8);
  }

  void drawCursor(int _i) {
    fill(255, 0, 0);
    rect(0, height/3+_i*height/9, 100, height/9);
    fill(#F4F5F7);
    text("cost \n"+cost(roadType), 50, _i*height/9+height/24*9);
  }

  void mousePressed() {
    if (mouseX<posX)return;
    for (int i=0; i<button.length; i++)
      if (button[i].pressed())roadType=i;
  }

  int cost(int itemType) {
    switch(itemType) {
    case 0:
      return 1;
    case 1:
      return 5;
    case 2:
      return 7;
    case 3:
      return 12;
    case 4:
      return 7;
    case 5:
      return 9;
    }
    return -1;
  }
}