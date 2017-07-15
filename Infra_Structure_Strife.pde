import java.util.HashSet;
final float ROAD_LENGTH = 120;
final float COS[] = {0, -0.8660254, -0.8660254, 0, 0.86602524, 0.86602524, 0};
final float SIN[] = {1, 0.5, -0.5, -1, -0.5, 0.5, 1};
final int fieldSize=1200;


PVector  playerBase=new PVector (600, 480, 0);
Operation_Screen os;
ArrayList<Road> field;


void settings() {
  size(fieldSize+600, fieldSize);
}

void setup() {
  noFill();

  textAlign(CENTER);
  field=fieldRoadList(fieldSize/2, fieldSize/2);
  println(field.size());
  os=new Operation_Screen(fieldSize);
}

void draw() {
  background(0);
  for (Road r : field) {
    r.draw();
  }
  os.draw();
}
//繋がってる道
void mousePressed() {
  for (Road r2 : field) {
    for (Road r : field) {
      if ( r.onRoad()&&r.connected(r2)) {
        println("r  "+r);
        println("r2 "+r2+"\n");
        r.setState(os.roadType);
      }
    }
  }
  os.mousePressed();
}


void keyPressed() {
  for (Road r : field) 
    if (r.state!=-1)println(r);
}