
PImage img;
float xmag, ymag = 0;
float dis_X,dis_Y = 0;
float newXmag, newYmag = 0;
York_faces face = new York_faces(10,10,50,50);
void setup()
{
  size(600,600,P3D);
  frameRate(30);
  background(255);  
  camera(0, 0, height/2/ tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);
  face.ChangeVertexs_xy_only(0, 0, height/2/ tan(PI*30.0 / 180.0));
  textureMode(NORMAL);
  noStroke();
  img = loadImage("009.png");
}
void draw()
{
  randomSeed(0);
  float random_rotate_Y = random(TWO_PI);
  float random_rotate_X = random(TWO_PI);
  if(frameCount<=120&&frameCount>60)
  {
    dis_X = random_rotate_X/60*(frameCount-60);
    dis_Y = random_rotate_Y/60*(frameCount-60);
    rotateX(dis_X); 
    rotateY(dis_Y);
  }
  
  pushMatrix();
  background(0.5);
 if(frameCount>120)
{ 
  rotateX(dis_Y); 
  rotateY(dis_X); 
} 
  
  face.Draw_faces(img);
  popMatrix();
}

void mouseDragged()
{
    
  dis_X+=(pmouseX - mouseX)/float(width)*TWO_PI;
  dis_Y+=(pmouseY - mouseY)/float(height)*TWO_PI;
  
}
