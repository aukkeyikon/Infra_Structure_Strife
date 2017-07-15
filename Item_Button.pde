class Item_Button {
  String ItemName;
  float posY;
  Item_Button(String _ItemName, float _posY) {
    posY=_posY;
    ItemName=_ItemName;
  }

  void draw(float _posX) {
    fill(0);
    text(ItemName, _posX, posY+(textAscent()+textDescent())+height/36);
    noFill();
  }

  boolean pressed() {
    if (posY<mouseY && mouseY<posY+height/9)return true;
    else return false;
  }
}