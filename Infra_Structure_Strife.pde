import java.util.HashSet;
final float ROAD_LENGTH = 120;
final float COS[] = {0, -0.8660254, -0.8660254, 0, 0.86602524, 0.86602524, 0};
final float SIN[] = {1, 0.5, -0.5, -1, -0.5, 0.5, 1};
final float fieldSize=1200;

ArrayList<Road> fieldRoadList(float cx, float cy) {
  HashSet<Road> roadSet = new HashSet<Road>();
  PVector center;
  for (int j=-2; j<3; j++)//縦
    for (int i=0; i<6; i++) //6角形を描く
      switch(j) {
      case 0:
        for (int k=-2; k<3; k++) {
          center=new PVector(2*k*ROAD_LENGTH*COS[1], 1.5*(j)*ROAD_LENGTH); 
          roadSet.add(new Road(new PVector(cx+center.x+ROAD_LENGTH*COS[i], cy+center.y+ROAD_LENGTH*SIN[i]), 
            new PVector(cx+center.x+ROAD_LENGTH*COS[i+1], cy+center.y+ROAD_LENGTH*SIN[i+1]), -1));
        }
        break;
      case -2:
      case 2:
        for (int k=-1; k<2; k++) {
          center=new PVector(2*k*ROAD_LENGTH*COS[1], 1.5*(j)*ROAD_LENGTH); 
          roadSet.add(new Road(new PVector(cx+center.x+ROAD_LENGTH*COS[i], cy+center.y+ROAD_LENGTH*SIN[i]), 
            new PVector(cx+center.x+ROAD_LENGTH*COS[i+1], cy+center.y+ROAD_LENGTH*SIN[i+1]), -1));
        }
        break;
      default:
        for (int k=-2; k<2; k++) {
          center=new PVector((1+2*k)*ROAD_LENGTH*COS[1], 1.5*(j)*ROAD_LENGTH); 
          roadSet.add(new Road(new PVector(cx+center.x+ROAD_LENGTH*COS[i], cy+center.y+ROAD_LENGTH*SIN[i]), 
            new PVector(cx+center.x+ROAD_LENGTH*COS[i+1], cy+center.y+ROAD_LENGTH*SIN[i+1]), -1));
        }  
        break;
      }
  return new ArrayList<Road>(roadSet);
}

void setup() {
  noFill();
  size(1800, 1200);
  line(fieldSize, 0, fieldSize, height);
  //if (!fieldRoadList(fieldSize/2, fieldSize/2).isEmpty()) 
  for (int i=0; i<fieldRoadList(fieldSize/2, fieldSize/2).size(); i++) {
    Road road =(Road)fieldRoadList(fieldSize/2, fieldSize/2).get(i);
    road.draw();
  }
}

void draw() {
  for (int i=0; i<fieldRoadList(fieldSize/2, fieldSize/2).size(); i++) {
    Road road =(Road)fieldRoadList(fieldSize/2, fieldSize/2).get(i);
    road.draw();
  }
}

void mousePressed() {
  for (int i=0; i<fieldRoadList(fieldSize/2, fieldSize/2).size(); i++) {
    Road road =(Road)fieldRoadList(fieldSize/2, fieldSize/2).get(i);
    if (road.onRoad()) {
      road.setState(1);
      println("new: "+road);
      println("old: "+fieldRoadList(fieldSize/2, fieldSize/2).get(i));
      fieldRoadList(fieldSize/2, fieldSize/2).set(i, road);
      println(fieldRoadList(fieldSize/2, fieldSize/2).get(i));
      println(fieldRoadList(fieldSize/2, fieldSize/2).contains(road));//新しいやつがどこかにあるか
    }
  }
}