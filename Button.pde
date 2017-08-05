class Button {
  int    posX, posY, width, height;
  String   title          = "";
  boolean  anable         = true;
  Behavior behavior       = new Behavior();

  Button(int x, int y, int w, int h, String t) {
    this.posX   = x;
    this.posY   = y;
    this.width  = w;
    this.height = h;
    this.title  = t;
  }

  void draw() {
    stroke(#cccccc);
    fill(this.bounds() ? #cccccc : #f4f5f7);
    rect(this.posX, this.posY, this.width, this. height, 4);
    fill(#0c0d05);
    text(this.title, this.posX, this.posY+this.height/3, this.width, this.height);
    //
    //noStroke();
    //fill(this.bounds() ? #691624 : #9f111b);    
    //rect(this.posX, this.posY, this.width/6, this.height);
    fill(#F4F5F7);
    text("cost", this.posX, this.posY, this.width/6, this.height);
  }

  boolean bounds() {
    return (anable && this.posX <= mouseX && mouseX <= this.posX + this.width && 
      this.posY <= mouseY && mouseY <= this.posY + this.height);
  }

  void setBehave(Behavior _newBehavior) {
    this.behavior = _newBehavior;
  }

  void setTitle(String _title) {
    this.title = _title;
  }

  void setAnable(boolean flag) {
    this.anable = flag;
  }

  void pressed() {
    if (this.behavior != null) this.behavior.behave();
  }
}

// This class is setup behave on Button.
// We can make it inner class this class.
//このクラスはButton上で動作するように設定されています。
//このクラスを内部クラスにすることができます。
class Behavior {
  public void behave() {
  }
}