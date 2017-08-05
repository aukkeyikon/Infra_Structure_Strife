class Operation_Screen {
  int    posX,screenWidth;  
  int    roadType;
  String turn[]     = {"Role Dice", "Make Road", "Make Road  \n or \n Bomb!", "Waiting"};
  String ItemName[] = {"Human", "Car", "Construct", "Rail", "Tunnel", "Bomb"};
  Button [] button=new Button [6];

  Operation_Screen(int _posX) {
    roadType=-1;
    posX=_posX;
    screenWidth=width-posX;
    for (int i=0; i<button.length; i++)
      button[i]=new Button(posX, height/3+i*height/9, screenWidth, height/9, ItemName[i]);
  }

  void draw() {
    pushMatrix();
    strokeWeight(1);
    translate(posX, 0);
    stroke(#0a0a0a);
    fill(#F4F5F7);
    rect(-1, height/3, screenWidth, height);
    this.drawTurn();
    popMatrix();
    for (int i=0; i<button.length; i++)
      button[i].draw();
    noFill();
  }

  void drawTurn() {
    stroke(#f4f5f7);
    noFill();
    rect(0, 0, screenWidth, height/3);
    fill(#f4f5f7);
    text(turn[2], (screenWidth)/2, height/8);
  }

  void mousePressed() {
    if (mouseX<posX)return;
    for (int i=0; i<button.length; i++)
      if (button[i].bounds())roadType=i;
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