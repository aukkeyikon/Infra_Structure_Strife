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