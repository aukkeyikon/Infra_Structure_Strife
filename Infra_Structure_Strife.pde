import java.util.HashSet;
final float ROAD_LENGTH = 120;
final float COS[] = {0, -0.8660254, -0.8660254, 0, 0.86602524, 0.86602524, 0};
final float SIN[] = {1, 0.5, -0.5, -1, -0.5, 0.5, 1};
final int fieldSize=1200;
ArrayList<Road> field;

void settings() {
  size(fieldSize+600, fieldSize);
}

void setup() {
  noFill();
  line(fieldSize, 0, fieldSize, height);
  field = fieldRoadList(fieldSize/2, fieldSize/2);
}

void draw() {
  for (Road road : field) {
    road.draw();
  }
}

void mousePressed() {
  for (Road road : field) {
    if (road.onRoad()) road.setState(1);
  }
}