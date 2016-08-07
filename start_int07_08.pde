 import peasy.*;
import toxi.geom.*;
import processing.opengl.*;


PeasyCam cam;
     
int W;   


       
Cells Cell;        
  
ArrayList CellList= new ArrayList();   
int type;//land sea
int Ltype;//land types
int bound;//bound
int com_area;
int mount;
int veg;
int port;
int inside;

void setup() {
  cam = new PeasyCam(this, 500);
  size(800, 600,P3D);       
  //frameRate(4);                              
  
   
  
////////////////////////////////////////////
///////
  String[] strLines = loadStrings("data/Import_pts0708.txt");
  for (int i = 0; i < strLines.length; ++i) {
    String[] arrTokens = split(strLines[i], ',');
    Vec3D loc = new Vec3D(float(arrTokens[0]),-float(arrTokens[1]),float(arrTokens[2]));
    type = int(arrTokens[3]);
    Ltype = int(arrTokens[9]);
    bound = int(arrTokens[4]);
    com_area = int(arrTokens[5]);
    mount = int(arrTokens[6]);
    veg = int(arrTokens[7]);
    port = int(arrTokens[8]);
    inside = int(arrTokens[10]);
    //print(Loadtype);
    Cell= new Cells(loc,type, Ltype, bound, com_area, mount, veg, port, inside);  
    CellList.add(Cell);         
    W+=1;
  }
  
}


void draw() {
  background(255); 
      for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.view();      //
      //print (Cell.type);
    }                                          //
      
      
      //if (keyPressed == true){
      for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.evalN();      //
    //}  
      }    
//for (int i=0;i<W;i++) {                  //
//      Cell = (Cells)CellList.get(i);           
 //     Cell.changeType();      //
 //   }    
/**
 if keyPressed() {
        for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.evalN();      //
      //print (Cell.type);
    } 
      }  
    */ 
} 


