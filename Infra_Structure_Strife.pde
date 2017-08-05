import java.util.HashSet;
final int FIELD_SIZE=1200;

PVector  playerBase=new PVector (600, 480, 0);
Operation_Screen operationScreen;
ArrayList<Road> field;

void settings() {
  size(FIELD_SIZE/2*3, FIELD_SIZE);
}

void setup() {
  noFill();
  textSize(FIELD_SIZE/30);
  textAlign(CENTER);
  field=fieldRoadList(FIELD_SIZE/2, FIELD_SIZE/2);
  operationScreen=new Operation_Screen(FIELD_SIZE);  
  println(field.size());
}

void draw() {
  background(#0C0D05);
  for (Road r : field) {
    r.draw();
  }
  operationScreen.draw();
}

void mousePressed() {
  for (Road r2 : field) {
    for (Road r : field) {
      if ( r.onRoad() ) {//&& r.connected(r2)
        // r.connected(r2)の判定がうまく回ってない
        println("r  "+r);
        println("r2 "+r2+"\n");
        r.setState(operationScreen.roadType);
      }
    }
  }
  operationScreen.mousePressed();
}


void keyPressed() {
  for (Road r : field) 
    if (r.state!=-1)println(r);
}