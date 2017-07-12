class Road {
  PVector [] endPoints = new PVector[2];

  int state;

  Road(Road r) {
    this.endPoints[0] = r.endPoints[0].copy();
    this.endPoints[1] = r.endPoints[1].copy();
    this.state        = r.state;
  }

  //Road(PVector v1, PVector v2) {
  //  this.endPoints[0] = v1.copy();
  //  this.endPoints[1] = v2.copy();
  //}

  Road(PVector v1, PVector v2, int _s) {
    this.endPoints[0] = v1.copy();
    this.endPoints[1] = v2.copy();
    this.state        = _s;
  }

  void setState(int _s) {
    this.state = _s;
  }

  boolean onRoad() {
    return (
      this.endPoints[0].x<mouseX && mouseX<this.endPoints[1].x
      || this.endPoints[1].x<mouseX && mouseX<this.endPoints[0].x
      || ((this.endPoints[0].x==this.endPoints[1].x) && abs(this.endPoints[0].x-mouseX)<10))
      && (this.endPoints[0].y<mouseY && mouseY<this.endPoints[1].y
      || this.endPoints[1].y<mouseY && mouseY<this.endPoints[0].y);
  }

  void draw() {
    //2:車道
    //3:建設中
    //4:線路
    beginShape();
    switch(this.state) {
    case 1: //1:歩道
      vertex(this.endPoints[0].x-5, this.endPoints[0].y-5);
      vertex(this.endPoints[0].x+5, this.endPoints[0].y+5);
      vertex(this.endPoints[1].x+5, this.endPoints[1].y+5);
      vertex(this.endPoints[1].x-5, this.endPoints[1].y-5);
      break;
    default://-1:通常
      vertex(this.endPoints[0].x, this.endPoints[0].y);
      vertex(this.endPoints[1].x, this.endPoints[1].y);
      break;
    }
    endShape(CLOSE);
    //トンネル
  }


  @Override
    public String toString() {
    return "{ " + this.endPoints[0] + ", " + this.endPoints[1] + ", " + this.state + " }";
  }

  @Override
    boolean equals(Object obj) {
    if (obj instanceof Road) return false;
    Road r = (Road) obj;
    return (this.endPoints[0].equals(r.endPoints[0]) && this.endPoints[1].equals(r.endPoints[1]))
      || (this.endPoints[0].equals(r.endPoints[1]) && this.endPoints[1].equals(r.endPoints[0]));
  }

  @Override
    public int hashCode() {
    int result = 17;
    result = 31 * result + min(this.endPoints[0].hashCode(), this.endPoints[1].hashCode());
    result = 31 * result + max(this.endPoints[0].hashCode(), this.endPoints[1].hashCode());
    return result;
  }
}