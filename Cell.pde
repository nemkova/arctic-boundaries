 class Cells {

  Vec3D loc;
  int type;//sea-land
  int Ltype;//land types
  int bound;//boundaries
  int com_area;
  int mount;
  int veg;
  int port;
  int inside;
  
  
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



  Cells(Vec3D _loc, int _type, int _Ltype, int _bound, int _com_area, int _mount, int _veg, int _port, int _inside) {
    loc=_loc;
    type=_type;
    Ltype = _Ltype;
    bound = _bound;
    com_area = _com_area;
    mount = _mount;
    veg = _veg;
    port = _port;
    inside = _inside;
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
        if(bound==1 && other.inside!=5){
        if (distance>0 && distance<vegDist && Ltype == 3 && other.Ltype == 3 ) {
          other.bound = 1;
          bound = 0;  
        }
       else {
         other.bound = 0;
         bound = 1;
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
     
      
     else if (mount==8) {
      stroke(136,131,100,60);//mount - brown
      point(loc.x, loc.y, loc.z);
    }  else if (veg==3) {
      stroke(104,154,76,80);//code_veg - green
      point(loc.x, loc.y, loc.z);
    } else if (port==4) {
      stroke(255,56,56,70);//code_ports - red
      point(loc.x, loc.y, loc.z);
    }  else if (com_area==7) {
      stroke(255,236,162,30);//current_bound - beige
      point(loc.x, loc.y, loc.z);
    } 
     else {
      stroke(100);
      point(loc.x, loc.y, loc.z);//grey
    }
    if(bound == 1){
    stroke(228,150,0,80);//current_bound - orange
      point(loc.x, loc.y, loc.z);
    }
  }
}

