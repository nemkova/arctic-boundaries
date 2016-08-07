class Cells {
  
 Vec3D loc;
 int type;
  
  Cells(Vec3D _loc,int _type){
  loc=_loc;
  type=_type;
  }
  
 void view(){
   fill(0,0);
   
   strokeWeight(5);
     if (type==1) {stroke(0,120,200,100);point(loc.x, loc.y);}
     if (type==2) {stroke(190);point(loc.x, loc.y);}
 }
 
   
 }