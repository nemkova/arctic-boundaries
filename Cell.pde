 class Cells {

  Vec3D loc;
  int type;//sea-land
  int type1;//land types
  int type2;//boundaries
  int futType;
  ArrayList Bounds = new ArrayList();

//percentages
  float p = 1;
  float vegDist = 6*p;//forest, marsh
  float portDist = p;//human dev
  /**
  float mountDist1 = p;//bare mountains
  float mountDist2 = 3p;//mountain+vegetation
  float shareDist = 2p;//shared areas
  float riverDist = 3p;//rivers
  float coastDist = 6p;//coastal areas
 */ 



  Cells(Vec3D _loc, int _type, int _type1, int _type2) {
    loc=_loc;
    type=_type;
    type1 = _type1;
    type2 = _type2;
  }

  void run() {
    evalN();
    view();
  }



//  void updateType() {
//
//    type1=futType;
//  }


  void evalN() {

    for (int i=0; i<CellList.size (); i++) {
      Cells other =(Cells) CellList.get(i);
      float distance= loc.distanceTo(other.loc);
      
      if (type == 2) {
        if(type2==1 && other.type1!=5){
        if (distance>0 && distance<vegDist && type1 == 3 && other.type1 == 3 ) {
          other.type2 = 1;
          type2 = 0;
          type2 = 0;  
        }
       else {
         other.type1 = 6;
         type1 = 3;
         other.type2 = 0;
         type2 = 1;
       }
      }
      }
    }
  }

/**void changeType(){

for(int i = 0; i <CellList.size();i++){
Cells dev = (Cells) CellList.get(i);
Vec3D mouseLoc = new Vec3D(mouseX,mouseY,0);
Vec3D pointLoc = dev.loc;
if(mouseLoc.x == pointLoc.x && mouseLoc.y == pointLoc.y && mousePressed == true){
dev.type1 = 4;
}
}


}
*/

  void view() {

    strokeWeight(4);
    if (type== 1) {//sea - blue
      stroke(#5574fc);
      point(loc.x, loc.y, loc.z);
    }
     
      
     else if (type1==8) {
      stroke(#766c44);//mount - brown
      point(loc.x, loc.y, loc.z);
    } else if (type1==3) {
      stroke(#3f9814);//code_veg - green
      point(loc.x, loc.y, loc.z);
    } else if (type1==4) {
      stroke(#ff3838);//code_ports - red
      point(loc.x, loc.y, loc.z);
    } else if (type1==7) {
      stroke(#fff499);//current_bound - beige
      point(loc.x, loc.y, loc.z);
    } 
    else if (type1==6) {
      stroke(#726c6c);//no_usage - grey
      point(loc.x, loc.y, loc.z);
    } else {
      stroke(100);
      point(loc.x, loc.y, loc.z);//grey
    }
    if(type2 == 1){
    stroke(#ff9600);//current_bound - orange
      point(loc.x, loc.y, loc.z);
    }
  }
}

