import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

int x = 50;
int y = 50;

float level;


float rad;
float angle;

void setup(){
 size(800, 800);
 background(0);
frameRate(800);

 minim = new Minim(this);
 player = minim.loadFile("Avicii - Peace Of Mind ft. Vargas & Lagola.mp3");
 player.play();
 
 fft = new FFT(player.bufferSize(), player.sampleRate());
 
}

void draw(){
 fft.forward(player.mix);
 //Retornando la amplitud de la 10ma frecuencia despues de ser transformada por la FFT
 level = fft.getBand(10);  

 rad = (level* width/30); 
 
 
translate(width/2, height/2);
 
 //ejemplo
 fill(255, 10);
 stroke(3);
 rect(x, y, rad, rad, -x);
 
 
}
