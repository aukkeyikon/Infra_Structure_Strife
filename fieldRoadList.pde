ArrayList<Road> fieldRoadList(float cx, float cy) {
  HashSet<Road> roadSet = new HashSet<Road>();
  PVector center;
  for (int j=-2; j<3; j++)//縦
    for (int i=0; i<6; i++) //6角形を描く
      switch(j) {
      case 0:
        for (int k=-2; k<3; k++) {
          center=new PVector(2*k*FIELD_SIZE/10*cos(HALF_PI + THIRD_PI), 1.5*(j)*FIELD_SIZE/10); 
          roadSet.add(new Road(new PVector(cx+center.x+FIELD_SIZE/10*cos(HALF_PI + THIRD_PI*i), cy+center.y+FIELD_SIZE/10*sin(HALF_PI + THIRD_PI*i)), 
            new PVector(cx+center.x+FIELD_SIZE/10*cos(HALF_PI + THIRD_PI*(i+1)), cy+center.y+FIELD_SIZE/10*sin(HALF_PI + THIRD_PI*(i+1)))));
        }
        break;
      case -2:
      case 2:
        for (int k=-1; k<2; k++) {
          center=new PVector(2*k*FIELD_SIZE/10*cos(HALF_PI + THIRD_PI), 1.5*(j)*FIELD_SIZE/10); 
          roadSet.add(new Road(new PVector(cx+center.x+FIELD_SIZE/10*cos(HALF_PI + THIRD_PI*i), cy+center.y+FIELD_SIZE/10*sin(HALF_PI + THIRD_PI*i)), 
            new PVector(cx+center.x+FIELD_SIZE/10*cos(HALF_PI + THIRD_PI*(i+1)), cy+center.y+FIELD_SIZE/10*sin(HALF_PI + THIRD_PI*(i+1)))));
        }
        break;
      default:
        for (int k=-2; k<2; k++) {
          center=new PVector((1+2*k)*FIELD_SIZE/10*cos(HALF_PI + THIRD_PI), 1.5*(j)*FIELD_SIZE/10); 
          roadSet.add(new Road(new PVector(cx+center.x+FIELD_SIZE/10*cos(HALF_PI + THIRD_PI*i), cy+center.y+FIELD_SIZE/10*sin(HALF_PI + THIRD_PI*i)), 
            new PVector(cx+center.x+FIELD_SIZE/10*cos(HALF_PI + THIRD_PI*(i+1)), cy+center.y+FIELD_SIZE/10*sin(HALF_PI + THIRD_PI*(i+1)))));
        }  
        break;
      }
  return new ArrayList<Road>(roadSet);
}