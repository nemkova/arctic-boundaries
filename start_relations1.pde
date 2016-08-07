 import peasy.*;
import toxi.geom.*;
import processing.opengl.*;


PeasyCam cam;
     
int W;   


       
Cells Cell;        
  
ArrayList CellList= new ArrayList();   
int type;
int type1;
int type2;


void setup() {
  cam = new PeasyCam(this, 500);
  size(800, 600,P3D);       
  //frameRate(4);                              
  
   
  
////////////////////////////////////////////
///////
  String[] strLines = loadStrings("data/BoundData1.txt");
  for (int i = 0; i < strLines.length; ++i) {
    String[] arrTokens = split(strLines[i], ',');
    Vec3D loc = new Vec3D(float(arrTokens[0]),-float(arrTokens[1]),float(arrTokens[2]));
    type = int(arrTokens[3]);
    type1 = int(arrTokens[4]);
    type2 = int(arrTokens[5]);
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
      
      for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.changeType();      //
    }    
      if (keyPressed == true){
      for (int i=0;i<W;i++) {                  //
      Cell = (Cells)CellList.get(i);           
      Cell.evalN();      //
    }  
      }    

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
