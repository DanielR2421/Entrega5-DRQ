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
  background(1);
  frameRate(30);

  // sonidos
  PeaceOfMind = new SoundFile(this, "Avicii - Peace Of Mind ft. Vargas & Lagola.mp3");

  PeaceOfMind.play();
  //PeaceOfMind.amp(0.4);
  PeaceOfMind.loop(); // Reproducir en bucle automáticamente

  ampl = new Amplitude(this);
  ampl.input(PeaceOfMind);
}

void draw() {

  ampTotal = ampl.analyze();


  translate(width/2, height/2);


//Spotlight
fill(#FCFF4D, 100);
tamSpot = map(ampTotal, 0, 1, 1, -50);
triangle( 0, -400, tamSpot*5, tamSpot, tamSpot*-5, tamSpot);



  fill(255, 10);
  noStroke();

  //1
  for (int h = -4; h <= 4; h++)
    if (h != -1 && h != 0 && h != 1)
      ellipse(h*30, -20, 15, 15);


  //2
  for (int i = -5; i <= 5; i++)
    if (i != -1 && i != 0 &&  i != 1)
      ellipse(i*40, 0, 20, 20);


  //3
  for (int j = -6; j <= 6; j++)
    if (j != -1 && j != 0 && j != 1)
      ellipse(j*50, 20, 25, 25);

  //4
  for (int k = -5; k <= 5; k++)
    if (k != -1 && k != 0 && k != 1)
      ellipse(k*60, 40, 30, 30);
  //5
  for (int l = -6; l <= 6; l++)
    if (l != -1 && l != 0 && l != 1)
      ellipse(l*70, 60, 35, 35);

  //6
  for (int m = -7; m <= 7; m++)
    if (m != -0.8 && m != 0 && m != 0.8)
      ellipse(m*80, 80, 40, 40);
}
