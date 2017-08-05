class Road {
  PVector [] endPoints = new PVector[2];
  int state=-1;
  int player=0;

  Road(Road r) {
    this.endPoints[0] = r.endPoints[0].copy();
    this.endPoints[1] = r.endPoints[1].copy();
    this.state        = r.state;
  }

  Road(PVector v1, PVector v2) {
    this.endPoints[0] = v1.copy();
    this.endPoints[1] = v2.copy();
  }

  Road(PVector v1, PVector v2, int _s) {
    this.endPoints[0] = v1.copy();
    this.endPoints[1] = v2.copy();
    this.state        = _s;
  }

  void setState(int _s) {
    this.state = _s;
    this.player= 1;
  }

  boolean connected(Road r) {
    //baseから延びる道ならつながっていると判定
    if (this.endPoints[0].equals(playerBase)||this.endPoints[1].equals(playerBase))
      return true;
    //存在する道とつながっている 
    if ((this.endPoints[0].equals(r.endPoints[0])||this.endPoints[1].equals(r.endPoints[1])
      ||this.endPoints[0].equals(r.endPoints[1])||this.endPoints[1].equals(r.endPoints[0]))
      &&!this.equals(r) &&r.state!=-1) {
      return true;
    } 
    return false;
  }

  boolean onRoad() {
    return (
      (this.endPoints[0].x<mouseX && mouseX<this.endPoints[1].x
      || this.endPoints[1].x<mouseX && mouseX<this.endPoints[0].x)
      || ((this.endPoints[0].x==this.endPoints[1].x) && abs(this.endPoints[0].x-mouseX)<20))
      && (this.endPoints[0].y<mouseY && mouseY<this.endPoints[1].y
      || this.endPoints[1].y<mouseY && mouseY<this.endPoints[0].y);
  }

  void draw() {
    stroke(255);if(player==1)stroke(#3dfc54);
    switch(this.state) {
    case 0: //歩道
      drawDottedLine();
      break;
    case 1://車道
      drawDoubleLine();
      break;
    case 2://建設中
      drawDoubleLine();
      drawHorizontalstripes();
      break; 
    case 3://線路
      drawDoubleLine();
      drawDottedLine();
      break;
    default://-1:通常
      line(this.endPoints[0].x, this.endPoints[0].y, this.endPoints[1].x, this.endPoints[1].y);
      break;
    }
    //トンネル
  }

  void drawDottedLine() {
    PVector direction=PVector.sub(this.endPoints[1], this.endPoints[0]).div(5);
    for (int i=0; i<3; i++)
      drawLine(PVector.add(this.endPoints[0], direction.copy().mult(2*i)), direction);
  }

  void drawDoubleLine() {
    PVector direction = PVector.sub(this.endPoints[1], this.endPoints[0]);
    PVector normal    = direction.copy().rotate(HALF_PI).setMag(4.0f);
    drawLine(PVector.add(this.endPoints[0], normal), direction);
    drawLine(PVector.sub(this.endPoints[0], normal), direction);
  }

  void drawHorizontalstripes() {
    PVector direction=PVector.sub(this.endPoints[1], this.endPoints[0]);
    PVector normal   =direction.copy().rotate(HALF_PI).setMag(4.0f);
    direction.div(5);
    for (int i=0; i<5; i++) {
      drawLine(PVector.add(this.endPoints[0], direction.copy().mult(i)), normal);
      drawLine(PVector.add(this.endPoints[0], direction.copy().mult(i)), normal.mult(-1));
    }
  }

  void drawLine(PVector begin, PVector direction) {
    line(begin.x, begin.y, begin.x+direction.x, begin.y+direction.y);
  }


  @Override
    public String toString() {
    return "{ " + this.endPoints[0] + ", " + this.endPoints[1] + ", " + this.state + " }";
  }

  @Override
    boolean equals(Object obj) {
    if (!(obj instanceof Road)) return false;
    Road r = (Road) obj;
    return (nearlyEquals(this.endPoints[0], r.endPoints[0]) && nearlyEquals(this.endPoints[1], r.endPoints[1]))
      || (nearlyEquals(this.endPoints[0], r.endPoints[1]) && nearlyEquals(this.endPoints[1], r.endPoints[0]));
  }

  @Override
    public int hashCode() {
    int result = 17;
    result = 31 * result + min(this.endPoints[0].hashCode(), this.endPoints[1].hashCode());
    result = 31 * result + max(this.endPoints[0].hashCode(), this.endPoints[1].hashCode());
    return result;
  }
}

final float ALLOWABLE_ERROR = 1;

boolean nearlyEquals(PVector v1, PVector v2) {
  return abs(v1.x - v2.x) < ALLOWABLE_ERROR
    && abs(v1.y - v2.y) < ALLOWABLE_ERROR;
}