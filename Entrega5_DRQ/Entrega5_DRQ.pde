import processing.sound.*;

//Variable de Sonido
SoundFile PeaceOfMind;

//Varible de Amplitud
Amplitude ampl;
//Temporal
float volumen = 0;
float posX = 0;
float ampTotal;

//Personas Alienadas
float colorBody;
float tamBody;
float ampTotalP;
float PosPeopleX = 0;
float PosPeopleX2 = 0;
float posPeopleX3 = 0;

//Spotlight
float colorSpot;
float tamSpot = 0;

//Ciudad
float colorBuild;
float tamBuild;

//Arbol solo
float colorPers;
float tamTree = 0;

void setup() {
  size(800, 800);
  //frameRate(30);

  // sonidos
  PeaceOfMind = new SoundFile(this, "Avicii - Peace Of Mind ft. Vargas & Lagola.mp3");

  PeaceOfMind.play();
  //PeaceOfMind.amp(0.4);
  PeaceOfMind.loop(); // Reproducir en bucle automáticamente

  ampl = new Amplitude(this);
  ampl.input(PeaceOfMind);
}

void draw() {
//frameRate(30);
  background(1);

  ampTotal = ampl.analyze();

//Velocidades de movimiento de las personas
float speed = map(ampTotal, 0, 1, 1, 10);
float speed2 = map(ampTotal, 0, 1, 1, 20);
float speed3 = map(ampTotal, 0, 1, 1, 25);

PosPeopleX = PosPeopleX + speed;
PosPeopleX2 = PosPeopleX2 + speed2;
posPeopleX3 = posPeopleX3 + speed3;

//Las personas si salen del lienzo deben volver a entrar pero a distintas velocidades
if (PosPeopleX  > width){
  PosPeopleX = -width;
}

if (PosPeopleX2  > width){
  PosPeopleX2 = -width;
}

if (posPeopleX3  > width/2 + 800){
  posPeopleX3 = -width/2 - 800;
}
  translate(width/2, height/2);

  pushMatrix();
  
  //Spotlight
  fill(#FCFF4D);
  tamSpot = map(ampTotal, 0, 1, 1, -50);
  triangle( 0, -400, tamSpot*5, tamSpot, tamSpot*-5, tamSpot);

  popMatrix();


  //Primera fila de personas de atras
  pushMatrix();
 
 
  noStroke();
  
  for (int h = -4; h <= 4; h++)
    if (h != -1 && h != 0 && h != 1){
      //piernas
     fill(#815B1D);
      ellipse(h*30+PosPeopleX, 10, 5, 35);
       // torso
       fill(#383564);
      ellipse(h*30+PosPeopleX, -5, 10, 35);
      //cabeza
      fill(#FFE7C9);
      ellipse(h*30+PosPeopleX, -20, 15, 15);
    }
    
  popMatrix();

  //2 fila de personas
  pushMatrix();
  
  noStroke();
  
  for (int i = -5; i <= 5; i++)
    if (i != -1 && i != 0 &&  i != 1){
     fill(#929CB7);
      ellipse(i*40-PosPeopleX, 45, 10, 40);
       // torso
       fill(#714922);
      ellipse(i*40-PosPeopleX, 25, 15, 40);
      //cabeza
      fill(#A78458);
      ellipse(i*40-PosPeopleX, 0, 20, 20);
    }
  popMatrix();
  
  //Arbol Olvidado
  pushMatrix();
  
 tamTree = map(ampTotal, 0, 1, 1, 70); 
 
 fill(#5DAD46);
 ellipse(0, 100, 80, 50);
  fill(#7C643E);
 ellipse(0, 100, 50+tamTree, 20+tamTree);
  
  fill(#09B20A);
  strokeWeight(3);
  //Voltear la escala para que sea mas facil armar las ramas del arbol
 scale(1, -1);
  
  // Tronco (desde abajo hacia arriba)
  stroke(#522F00);
  line(0, -100, 0, 0);
  
  // Ramas principales
  line(0, 0, -50, 50);
  line(0, 0, 50, 50);
  line(0, 0, 0, 100);
  
  // Hojas centrales
  stroke(#155215);
  triangle(-50, 50, -70, 30, -30, 30);
  triangle(50, 50, 30, 30, 70, 30);
  triangle(0, 100, -20, 80, 20, 80);
  
  // Más ramas
  stroke(#522F00);
  line(-50, 50, -100, 80);
  line(-50, 50, -70, 120);
  line(50, 50, 100, 80);
  line(50, 50, 70, 120);
  line(0, 100, -30, 150);
  line(0, 100, 30, 150);
  
  // Más triángulos (hojas)
  stroke(#155215);
  triangle(-100, 80, -120, 60, -80, 60);
  triangle(-70, 120, -90, 100, -50, 100);
  triangle(100, 80, 80, 60, 120, 60);
  triangle(70, 120, 50, 100, 90, 100);
  triangle(-30, 150, -50, 130, -10, 130);
  triangle(30, 150, 10, 130, 50, 130);
  
 
  popMatrix();

  //3 fila de personas
  pushMatrix();
  fill(255);
  noStroke();
  
  for (int j = -6; j <= 6; j++)
    if (j != -1 && j != 0 && j != 1){
    //Piernas
      fill(#CDB7D3);
      ellipse(j*50+PosPeopleX2, 65, 10, 45);
       // torso
       fill(#94729D);
      ellipse(j*50+PosPeopleX2, 45, 15, 45);
      //cabeza
      fill(#F0D4B1);
      ellipse(j*50 +PosPeopleX2, 20, 25, 25);
      
    }
  popMatrix();

  //4 fila de personas
  pushMatrix();
  fill(255);
  noStroke();
  
  for (int k = -5; k <= 5; k++)
    if (k != -1 && k != 0 && k != 1){
     //Piernas
      fill(#9298A6);
      ellipse(k*60-PosPeopleX2, 95, 12.5, 50);
       // torso
       fill(#6A7F5F);
      ellipse(k*60-PosPeopleX2, 75, 20, 50);
      //cabeza
      fill(#D1AC7C);
      ellipse(k*60-PosPeopleX2, 40, 30, 30);
    }
  popMatrix();

  //5 fila de personas
  pushMatrix();
 
  noStroke();
  
  for (int l = -6; l <= 6; l++)
    if (l != -1 && l != 0 && l != 1) {
       //Piernas
      fill(#5B4763);
      ellipse(l*70+posPeopleX3, 135, 15, 55);
       // torso
       fill(#3E5F7F);
      ellipse(l*70+posPeopleX3, 110, 25, 55);
      //cabeza
      fill(#FCE9CF);
      ellipse(l*70+posPeopleX3, 70, 35, 35);
    }
  popMatrix();

  //6 fila de personas
  pushMatrix();
  fill(255);
  noStroke();
  
  for (int m = -7; m <= 7; m++)
     if (m != -1 && m != 0 && m != 1) {
      //Piernas
        fill(#160481);
      ellipse(m*80-posPeopleX3, 150, 20, 60);
       // torso
       fill(#5E6695);
      ellipse(m*80-posPeopleX3, 125, 30, 60);
      //cabeza
      fill(#B7B7B7);
      ellipse(m*80-posPeopleX3, 80, 40, 40);
      

    }
  
  popMatrix();
}
