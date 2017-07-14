class Road {
  PVector [] endPoints = new PVector[2];
  int state=-1;

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
      this.endPoints[0].x<mouseX && mouseX<this.endPoints[1].x
      || this.endPoints[1].x<mouseX && mouseX<this.endPoints[0].x
      || ((this.endPoints[0].x==this.endPoints[1].x) && abs(this.endPoints[0].x-mouseX)<10))
      && (this.endPoints[0].y<mouseY && mouseY<this.endPoints[1].y
      || this.endPoints[1].y<mouseY && mouseY<this.endPoints[0].y);
  }

  void draw() {
    beginShape(LINES);
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
      beginShape(LINES);
      vertex(this.endPoints[0].x, this.endPoints[0].y);
      vertex(this.endPoints[1].x, this.endPoints[1].y);
      break;
    }
    endShape(CLOSE);
    //トンネル
  }

  void drawDottedLine() {
    vertex(this.endPoints[0].x, this.endPoints[0].y);
    vertex((4*this.endPoints[0].x+this.endPoints[1].x)/5, (4*this.endPoints[0].y+this.endPoints[1].y)/5);
    vertex((3*this.endPoints[0].x+2*this.endPoints[1].x)/5, (3*this.endPoints[0].y+2*this.endPoints[1].y)/5);
    vertex((2*this.endPoints[0].x+3*this.endPoints[1].x)/5, (2*this.endPoints[0].y+3*this.endPoints[1].y)/5);
    vertex((this.endPoints[0].x+4*this.endPoints[1].x)/5, (this.endPoints[0].y+4*this.endPoints[1].y)/5);
    vertex(this.endPoints[1].x, this.endPoints[1].y);
  }

  void drawDoubleLine() {
    PVector v=PVector.sub(this.endPoints[0], this.endPoints[1]);
    if (this.endPoints[0].x==this.endPoints[1].x) {
      vertex(this.endPoints[0].x-ROAD_LENGTH/24, this.endPoints[0].y);
      vertex(this.endPoints[1].x-ROAD_LENGTH/24, this.endPoints[1].y);
      vertex(this.endPoints[0].x+ROAD_LENGTH/24, this.endPoints[0].y);
      vertex(this.endPoints[1].x+ROAD_LENGTH/24, this.endPoints[1].y);
    } else { 
      vertex(this.endPoints[0].x-v.x/60, this.endPoints[0].y+v.y/12);
      vertex(this.endPoints[1].x-v.x/60, this.endPoints[1].y+v.y/12);
      vertex(this.endPoints[0].x+v.x/60, this.endPoints[0].y-v.y/12);
      vertex(this.endPoints[1].x+v.x/60, this.endPoints[1].y-v.y/12);
    }
  }

  void drawHorizontalstripes() {
    if (this.endPoints[0].x==this.endPoints[1].x) {
      vertex((4*this.endPoints[0].x+this.endPoints[1].x)/5-ROAD_LENGTH/24, (4*this.endPoints[0].y+this.endPoints[1].y)/5);
      vertex((4*this.endPoints[0].x+this.endPoints[1].x)/5+ROAD_LENGTH/24, (4*this.endPoints[0].y+this.endPoints[1].y)/5);
      vertex((3*this.endPoints[0].x+2*this.endPoints[1].x)/5-ROAD_LENGTH/24, (3*this.endPoints[0].y+2*this.endPoints[1].y)/5);
      vertex((3*this.endPoints[0].x+2*this.endPoints[1].x)/5+ROAD_LENGTH/24, (3*this.endPoints[0].y+2*this.endPoints[1].y)/5);
      vertex((2*this.endPoints[0].x+3*this.endPoints[1].x)/5-ROAD_LENGTH/24, (2*this.endPoints[0].y+3*this.endPoints[1].y)/5);
      vertex((2*this.endPoints[0].x+3*this.endPoints[1].x)/5+ROAD_LENGTH/24, (2*this.endPoints[0].y+3*this.endPoints[1].y)/5);
      vertex((this.endPoints[0].x+4*this.endPoints[1].x)/5-ROAD_LENGTH/24, (this.endPoints[0].y+4*this.endPoints[1].y)/5);
      vertex((this.endPoints[0].x+4*this.endPoints[1].x)/5+ROAD_LENGTH/24, (this.endPoints[0].y+4*this.endPoints[1].y)/5);
    } else { 
      PVector v=PVector.sub(this.endPoints[0], this.endPoints[1]);
      vertex((4*this.endPoints[0].x+this.endPoints[1].x)/5+v.x/60, (4*this.endPoints[0].y+this.endPoints[1].y)/5-v.y/12);
      vertex((4*this.endPoints[0].x+this.endPoints[1].x)/5-v.x/60, (4*this.endPoints[0].y+this.endPoints[1].y)/5+v.y/12);
      vertex((3*this.endPoints[0].x+2*this.endPoints[1].x)/5+v.x/60, (3*this.endPoints[0].y+2*this.endPoints[1].y)/5-v.y/12);
      vertex((3*this.endPoints[0].x+2*this.endPoints[1].x)/5-v.x/60, (3*this.endPoints[0].y+2*this.endPoints[1].y)/5+v.y/12);
      vertex((2*this.endPoints[0].x+3*this.endPoints[1].x)/5, (2*this.endPoints[0].y+3*this.endPoints[1].y)/5);
      vertex((2*this.endPoints[0].x+3*this.endPoints[1].x)/5, (2*this.endPoints[0].y+3*this.endPoints[1].y)/5);
      vertex((this.endPoints[0].x+4*this.endPoints[1].x)/5, (this.endPoints[0].y+4*this.endPoints[1].y)/5);
      vertex((this.endPoints[0].x+4*this.endPoints[1].x)/5, (this.endPoints[0].y+4*this.endPoints[1].y)/5);
    }
  }

  @Override
    public String toString() {
    return "{ " + this.endPoints[0] + ", " + this.endPoints[1] + ", " + this.state + " }";
  }

  @Override
    boolean equals(Object obj) {
    if (!(obj instanceof Road)) return false;
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