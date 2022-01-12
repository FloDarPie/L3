#include <Adafruit_NeoPixel.h>
#include <Adafruit_GFX.h>
#include <Adafruit_NeoMatrix.h>

// variable pour le filtre anti rebonds
volatile long int temps1=0;

int donnees= 6;
volatile int tete=0;
volatile int queue=0;

volatile int x[10];
volatile int y[10];

volatile int x_obstacles[64];
volatile int y_obstacles[64];
volatile int nb_obstacles=0;
volatile int compteur=0;
int bp1=2;
int bp2=3;

volatile int direction=0; // 0=droite, 1=haut, 2=gauche, 3=bas
int fini=0; //1=perdu, 2=gagné
volatile int appuye=0;

volatile int x_fruit, y_fruit;


// MATRIX DECLARATION:
// Parameter 1 = width of NeoPixel matrix
// Parameter 2 = height of matrix
// Parameter 3 = pin number (most are valid)
// Parameter 4 = matrix layout flags, add together as needed:
//   NEO_MATRIX_TOP, NEO_MATRIX_BOTTOM, NEO_MATRIX_LEFT, NEO_MATRIX_RIGHT:
//     Position of the FIRST LED in the matrix; pick two, e.g.
//     NEO_MATRIX_TOP + NEO_MATRIX_LEFT for the top-left corner.
//   NEO_MATRIX_ROWS, NEO_MATRIX_COLUMNS: LEDs are arranged in horizontal
//     rows or in vertical columns, respectively; pick one or the other.
//   NEO_MATRIX_PROGRESSIVE, NEO_MATRIX_ZIGZAG: all rows/columns proceed
//     in the same order, or alternate lines reverse direction; pick one.
//   See example below for these values in action.
// Parameter 5 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)

Adafruit_NeoMatrix matrix = Adafruit_NeoMatrix(8, 8, donnees,
NEO_MATRIX_TOP     + NEO_MATRIX_RIGHT +
NEO_MATRIX_COLUMNS + NEO_MATRIX_PROGRESSIVE,
NEO_GRB            + NEO_KHZ800);

const uint16_t rouge=  matrix.Color(255, 0, 0);
const uint16_t vert=  matrix.Color(0, 255, 0);
const uint16_t bleu=  matrix.Color(0, 0, 255);
const uint16_t jaune=  matrix.Color(255, 255,0);

void bp1_presse(){
  // filtre anti rebonds
  long int temps=micros();
  if (temps-temps1>10000){

    if (fini!=0){
      nouvellepartie();
    }
    if (appuye==0){
      direction=(direction+1)%4;
      appuye=1;
    }
    temps1=temps;

  }
}
void bp2_presse(){
  // filtre anti rebonds
  long int temps=micros();
  if (temps-temps1>10000){

    if (fini!=0){
      nouvellepartie();
    }
    if (appuye==0){
      direction=(direction+3)%4;
      appuye=1;
    }
    temps1=temps;

  }

}

void nouvellepartie(){
  matrix.fillScreen(0);
  matrix.show();
  tete=0;
  queue=0;
  fini=0;
  x[0]=0;
  y[0]=3;
  direction=0;
  nb_obstacles=0;
  tire_fruit();

}


void setup() {
  randomSeed(analogRead(0));
  pinMode(bp1,INPUT_PULLUP);
  pinMode(bp2,INPUT_PULLUP);
  attachInterrupt(0, bp1_presse, FALLING);
  attachInterrupt(1, bp2_presse, FALLING);

  nouvellepartie();

  matrix.begin();
  matrix.setBrightness(10);
}

void loop() {

  if (fini==0){
    // on efface la queue du serpent
    matrix.drawPixel(x[queue],y[queue],0);
    matrix.show();

    noInterrupts();
    int nouvelleTete=(tete+1)%10;
    queue=(queue+1)%10;
    // on déplace le serpent dans la direction courante
    if (direction==0){
      x[nouvelleTete]=x[tete]+1;
      y[nouvelleTete]=y[tete];
      if (x[nouvelleTete]==8) fini =1;
    }
    if (direction==1){
      y[nouvelleTete]=y[tete]-1;
      x[nouvelleTete]=x[tete];
      if (y[nouvelleTete]==-1) fini =1;
    }
    if (direction==2){
      x[nouvelleTete]=x[tete]-1;
      y[nouvelleTete]=y[tete];
      if (x[nouvelleTete]==-1) fini =1;
    }
    if (direction==3){
      y[nouvelleTete]=y[tete]+1;
      x[nouvelleTete]=x[tete];
      if (y[nouvelleTete]==8) fini =1;
    }
    tete=nouvelleTete;
    // le serpent se mord la queue ?
    if (seMordLaQueue())
      fini=1;

    // le serpent cogne un obstacle ?  
    if (cogneObstacle())
      fini=1;

    appuye=0;
    interrupts();  
  }
  if (fini==0){ 
    // on affiche la nouvelle tete du serpent   
    matrix.drawPixel(x[tete],y[tete],vert);
    matrix.show();
    // on regarde si on a mangé le fruit
    if(x_fruit==x[tete] && y_fruit==y[tete]){
      //on rallonge le serpent
      queue=(queue+9)%10;
      // on regarde si on a gagne (ici on gagne si le serpent a une longueur de 5
      if ((tete-queue+10)%10==5)
        fini=2;
      else
        tire_fruit();
    }
  }
  // si on a perdu
  if (fini==1){
    matrix.fillScreen(rouge);
    matrix.show();
  }
  // si on a gagné
  if (fini==2){
    matrix.fillScreen(vert);
    matrix.show();
    delay(1000);

  }

  delay(500);
  compteur=compteur-1;

  // si le delai est écoulé pour manger le fruit
  if (compteur==0){
    // on ajoute un obstacle
    x_obstacles[nb_obstacles]=x_fruit;
    y_obstacles[nb_obstacles]=y_fruit;
    nb_obstacles++;

    matrix.drawPixel(x_fruit,y_fruit,rouge);
    matrix.show();

    tire_fruit();


  }

}
boolean fruit_possible(int x_fruit,int y_fruit){
  // on regarde si le fruit est sur le serpent
  int i=(queue+9)%10;
  do{
    i=(i+1)%10;
    if (x[i]==x_fruit && y[i]==y_fruit)
      return false;
  }
  while (i!=tete);
  return (true);
}
boolean seMordLaQueue(){
  // on regarde si la tete est sur le reste du corps
  int i=queue;
  while (i!=tete){
    if (x[i]==x[tete] && y[i]==y[tete])
      return true;
    i=(i+1)%10;

  }
  return (false);
}
boolean cogneObstacle(){
  // on regarde si la tete est sur un obstacle
  for (int i=0;i<nb_obstacles;i++){
    if (x_obstacles[i]==x[tete] && y_obstacles[i]==y[tete])
      return true;
  }
  return (false);
}

void tire_fruit(){
  // on tire le fruit au hasard
  do{
    x_fruit=random(0,7);
    y_fruit=random(0,7);
  }
  while(fruit_possible(x_fruit,y_fruit)==false);
  compteur=10;
  // et on l'affiche
  matrix.drawPixel(x_fruit,y_fruit,jaune);
  matrix.show();

}

