import peasy.*;
import toxi.geom.*;
import processing.opengl.*;


PeasyCam cam;

int type;      
int W;            
       
Cells Cell;        
  
ArrayList CellList= new ArrayList();   


void setup() {
  cam = new PeasyCam(this, 1000);
  size(800, 600,P3D);       
  background(0);                               
  
   
  
////////////////////////////////////////////
///////
  String[] strLines = loadStrings("data/pts_land.txt");
  for (int i = 0; i < strLines.length; ++i) {
    String[] arrTokens = split(strLines[i], ',');
    Vec3D loc = new Vec3D(float(arrTokens[0]),float(arrTokens[1]),float(arrTokens[2]));
    type = 1;
    Cell= new Cells(loc,type);    
    CellList.add(Cell);         
    W+=1;
  }
//////
  strLines = loadStrings("data/pts_sea.txt");
  for (int i = 0; i < strLines.length; ++i) {
   String[] arrTokens = split(strLines[i], ',');
   Vec3D loc = new Vec3D(float(arrTokens[0]),float(arrTokens[1]),0);
   type = 2;
   Cell= new Cells(loc,type);   
   CellList.add(Cell);         
   W+=1;
  }
  

  
}


void draw() {
  background(0);
      for (int i=0;i<W;i++) {                  //
      Cell= (Cells)CellList.get(i);           
      Cell.view();                              //
    }                                          //
    
   
}

 
 