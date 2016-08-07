 import peasy.*;
import toxi.geom.*;
import processing.opengl.*;


PeasyCam cam;
     
int W;   


       
Cells Cell;        
  
ArrayList CellList= new ArrayList();   
int type;//land sea
int type1;//land types
int type2;//bound


void setup() {
  cam = new PeasyCam(this, 400);
  size(800, 600,P3D);       
  //frameRate(4);                              
  
   
  
////////////////////////////////////////////
///////
  String[] strLines = loadStrings("data/Import_pts0508.txt");
  for (int i = 0; i < strLines.length; ++i) {
    String[] arrTokens = split(strLines[i], ',');
    Vec3D loc = new Vec3D(float(arrTokens[0]),-float(arrTokens[1]),float(arrTokens[2]));
    type = int(arrTokens[3]);
    type1 = int(arrTokens[9]);
    type2 = int(arrTokens[4]);
    //print(Loadtype);
    Cell= new Cells(loc,type, type1, type2);    
    CellList.add(Cell);         
    W+=1;
  }
  
}


void draw() {
  background(0); 
      for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.view();      //
      //print (Cell.type);
    }                                          //
      
      
//      if (keyPressed == true){
      for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.evalN();      //
    }  
     // }    
//for (int i=0;i<W;i++) {                  //
//      Cell = (Cells)CellList.get(i);           
//      Cell.changeType();      //
//    }    

} 


