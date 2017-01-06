class York_faces
{
  
  int Num_faces_on_w;
  int Num_faces_on_h;
  float per_face_width;
  float per_face_height;
  ArrayList<York_vertex> vertexs;
  
  York_faces(int Num_faces_on_w, int Num_faces_on_h, int Per_face_width, int Per_face_height )
  {
    Num_faces_on_w = Num_faces_on_w;
    Num_faces_on_h = Num_faces_on_h;
    per_face_width = Per_face_width;
    per_face_height = Per_face_height;
  
    int h = 0;
    int w = 0;
    float row_high = 0;
    vertexs = new ArrayList<York_vertex>();
    
    York_vertex Y_vertex; 
    for(h = 1;h <= Num_faces_on_h;h++)
    {
      row_high = (h-1)*per_face_height;
      for(w = 1;w <= Num_faces_on_w;w++)
      {
        float pos_X = -Num_faces_on_w*per_face_width/2+per_face_width*(w-1);
        float pos_Y = Num_faces_on_h*per_face_height/2-per_face_height*(h-1);
        float per_u = 1/float(Num_faces_on_w);
        float per_v = 1/float(Num_faces_on_h);
        float u = per_u*float(w-1);
        float v = per_v*float(Num_faces_on_h-h+1);
        
        println(u+" "+v);
  
        vertexs.add(new York_vertex(pos_X,pos_Y,0,u,v));
           
        vertexs.add(new York_vertex(pos_X+per_face_width,pos_Y,0,u+per_u,v));
            
        vertexs.add(new York_vertex(pos_X+per_face_width,pos_Y-per_face_height,0,u+per_u,v-per_v));
        
        vertexs.add(new York_vertex(pos_X,pos_Y-per_face_height,0,u,v-per_v));
         
      }
    }
  }
  void Draw_faces(PImage img)
  {
    int h = 0;
    int w = 0;
    float row_high = 0;
    int j = 0;
    beginShape(QUADS);
    randomSeed(1);
    
    for(int i =0;i<vertexs.size();i+=4)
    {
      int color_r = int(random(0,255));
      int color_g = int(random(0,255));
      int color_b = int(random(0,255));
      York_vertex v1 =  vertexs.get(i);
      York_vertex v2 =  vertexs.get(i+1);
      York_vertex v3 =  vertexs.get(i+2);
      York_vertex v4 =  vertexs.get(i+3);
      texture(img);
      //fill(color_r,color_g,color_b);
      vertex(v1.x,v1.y,v1.z,v1.u,v1.v);
      //fill(color_r,color_g,color_b);
      vertex(v2.x,v2.y,v2.z,v2.u,v2.v);
      //fill(color_r,color_g,color_b);
      vertex(v3.x,v3.y,v3.z,v3.u,v3.v);
      //fill(color_r,color_g,color_b);
      vertex(v4.x,v4.y,v4.z,v4.u,v4.v);
       
    }

    endShape();
    
  }
  
  void ChangeVertexs_xy_only(float Eye_x,float Eye_y,float Eye_z)
  {
    float d_x,d_y,d_z = 0;
    float x2,y2,z2,d = 0;
    
    for(int i =0;i<vertexs.size();i++)
    {
      York_vertex v =  vertexs.get(i);
      
      d_z = random(-100,100);
      z2 = v.z + d_z;
      d = (Eye_z-v.z)/(Eye_z-z2);
      d_x = (1-d)/d*(v.x - Eye_x);
      d_y = (1-d)/d*(v.y - Eye_y);
      
      v.x += d_x;
      v.y += d_y;
      v.z += d_z;

      
    }
  }
  
}
