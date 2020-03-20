float x = 0.0;
float y;
float i = 0;   //color
float j = 2;
float k = 0;
float l = 0;
boolean o = true;
float degree = 0.0;
float z = -300;
float xx = 1.0;
boolean signal = false;
float zz = 0.0;
int size = 2500;

//press p to print to "output/braided_####.png"

void setup(){
  size(2500, 2500, P3D);
  background(0);
  smooth();
}

void draw(){
  
// if (signal == true){
 xx += random(-10, 10);
 zz += 0.1;
 signal = false;
// }

 translate(width/2, height/2, 0 + zz);
// rotateX(radians(-xx/5));
 rotateZ(radians(-xx/5));
//   rotateY(radians(-xx/5));
 
 neon_strobe();
 
 if (keyPressed){
   if (key == 'p'){
     saveFrame("output/braided_####.png");
   }
 }

 
}

boolean neon_strobe(){
  
  
  if (o == true){
  
  noFill();
    beginShape();
      stroke(i, k, l); // (0, 0, 0)  --> (255, 0, 0) --> (255, 255, 255)
      strokeWeight(j);
      vertex(-size, -size, 0);
     // vertex( -50, -30, 0);
      quadraticVertex( -300,  75, 0, 0, 0, 0);
      quadraticVertex( 300, -75, 0, size, size, 0);
    //  vertex( size, size, 0);
    endShape();
  
  if(i <= 255){
    i++;
  }
  
  if (i >= 255 && k <= 255 && l <= 255){
    k++;
    l++;
  }
  
   if (l <= 255){
  x += 0.05;
  y = sin(radians(degree)) * 25;
  }
  
  if (i >= 255 && k >= 255 && l >= 255){
    o = false;
  }
  }
  else{
    
    noFill();
     beginShape();
      stroke(i, k, l); // (0, 0, 0)  --> (255, 0, 0) --> (255, 255, 255)
      strokeWeight(j);
      vertex(-size, -size, 0);
   //   vertex( -50, -30, 0);
      quadraticVertex( 300, -75, 0, 0, 0, 0);
      quadraticVertex( -300, 75, 0, size, size, 0);
   //   vertex( size, size, 0);
    endShape();
  
  if (k >= 0 && l >= 0){
    k--;
    l--;
  }
  
  if (i >= 0 && k <=0 && l <= 0){
    i--;
  }
  
  if (i > 0){
  x += 0.05;
  y = sin(radians(degree)) * 25;
  }
    
  //  j -= 0.01;
    
  }
  
  if (degree < 180){
  degree += 0.18;
  }
  
   if (i <= 0 && k <= 0 && l <= 0){
    signal = true;
    o = true;
  }

  return signal;
  
}
