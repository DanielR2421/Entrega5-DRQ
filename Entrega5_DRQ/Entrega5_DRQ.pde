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
float movPeople;
float ampTotalP;
float PosPeopleX;
float posPeopleY;

//Spotlight
float colorSpot;
float tamSpot = 0;
float ampTotalS;

//Ciudad
float colorBuild;
float tamBuild;
float ampTotalB;

//Persona Parada
float colorPers;
float tamPers;
float ampTotalPr;

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

  background(1);

  ampTotal = ampl.analyze();


  translate(width/2, height/2);

  pushMatrix();
  
  //Spotlight
  fill(#FCFF4D);
  tamSpot = map(ampTotal, 0, 1, 1, -50);
  triangle( 0, -400, tamSpot*5, tamSpot, tamSpot*-5, tamSpot);

  popMatrix();

  //Ejemplo
  // pushMatrix();
  //  fill(#EA0000);
  // stroke(1);
  // rect(44, 162, 14, 56);
  //rect(44, 162, 64, 13);
  //rect(94, 162, 14, 56);
  // float tam = map(ampTotal, 0, 1, 50, 150);
  // ellipse(88, 218, tam, tam);
  // ellipse(38, 218, tam, tam);



  //Primera fila de personas de atras
  pushMatrix();
  fill(255);
  noStroke();
  
  for (int h = -4; h <= 4; h++)
    if (h != -1 && h != 0 && h != 1){
      //piernas
     fill(#815B1D);
      ellipse(h*30, 10, 5, 35);
       // torso
       fill(#383564);
      ellipse(h*30, -5, 10, 35);
      //cabeza
      fill(#FFE7C9);
      ellipse(h*30, -20, 15, 15);
    }
  popMatrix();

  //2 fila de personas
  pushMatrix();
  fill(255);
  noStroke();
  
  for (int i = -5; i <= 5; i++)
    if (i != -1 && i != 0 &&  i != 1){
     fill(#929CB7);
      ellipse(i*40, 45, 10, 40);
       // torso
       fill(#714922);
      ellipse(i*40, 25, 15, 40);
      //cabeza
      fill(#A78458);
      ellipse(i*40, 0, 20, 20);
    }
  popMatrix();
  
  //Arbol Olvidado
  pushMatrix();
  
  fill(#09B20A);
  strokeWeight(3);
 // rect(-25, 50, 25, -100); 
    scale(1, -1);
  
  // Tronco (desde abajo hacia arriba)
  stroke(#522F00);
  line(0, -100, 0, 0);
  
  // Ramas principales
  line(0, 0, -50, 50);
  line(0, 0, 50, 50);
  line(0, 0, 0, 100);
  
  // Triángulos centrales
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
  
  // Más triángulos
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
     fill(#CDB7D3);
      ellipse(j*50, 65, 10, 45);
       // torso
       fill(#94729D);
      ellipse(j*50, 45, 15, 45);
      //cabeza
      fill(#F0D4B1);
      ellipse(j*50, 20, 25, 25);
    }
  popMatrix();

  //4 fila de personas
  pushMatrix();
  fill(255);
  noStroke();
  
  for (int k = -5; k <= 5; k++)
    if (k != -1 && k != 0 && k != 1){
     fill(#9298A6);
      ellipse(k*60, 95, 12.5, 50);
       // torso
       fill(#6A7F5F);
      ellipse(k*60, 75, 20, 50);
      //cabeza
      fill(#D1AC7C);
      ellipse(k*60, 40, 30, 30);
    }
  popMatrix();

  //5 fila de personas
  pushMatrix();
 
  noStroke();
  
  for (int l = -6; l <= 6; l++)
    if (l != -1 && l != 0 && l != 1) {
       //Piernas
      fill(#5B4763);
      ellipse(l*70, 135, 15, 55);
       // torso
       fill(#3E5F7F);
      ellipse(l*70, 110, 25, 55);
      //cabeza
      fill(#FCE9CF);
      ellipse(l*70, 70, 35, 35);
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
      ellipse(m*80, 150, 20, 60);
       // torso
       fill(#5E6695);
      ellipse(m*80, 125, 30, 60);
      //cabeza
      fill(#B7B7B7);
      ellipse(m*80, 80, 40, 40);
      

    }
  
  popMatrix();
}
