SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here

//C-2
int totalScore = 500;
int rollScore = 0 ;

//B-2
int s1,s2,s3 ; //slot fruits count

//A
int p ; //probability

// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      
      //B-1
      totalScore = totalScore - 50 + rollScore ;
      
      // -------------------------------------------------
    }
//    
    machine.roll();
    textSize(19);
    text("Stop",x,y);

  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
       
       //A
       p = machine.probability(0.1);
       if(p == 1){
         machine.setSlotFruit(0,0);
         machine.setSlotFruit(1,0);
         machine.setSlotFruit(2,0); 
       } else {
         
       //C-3
         machine.setSlotFruit(0,int(random(6)));
         machine.setSlotFruit(1,int(random(6)));
         machine.setSlotFruit(2,int(random(6)));
       }  
       
       //B-2
       s1 = machine.getFruitCount(machine.slots[0][0].fruitId);
       s2 = machine.getFruitCount(machine.slots[1][0].fruitId);
       s3 = machine.getFruitCount(machine.slots[2][0].fruitId);
       
       
       //C-4
//       rollScore = machine.getSlotScore(machine.slots[0][0].fruitId) + machine.getSlotScore(machine.slots[1][0].fruitId) + machine.getSlotScore(machine.slots[2][0].fruitId);
       rollScore = machine.slots[0][0].score * s1 + machine.slots[1][0].score * s2 + machine.slots[2][0].score * s3 ;
       
       
       
         
       

      
 
 
 
      
      // -------------------------------------------------
    }
    
    //C-rollScore , copy from "show title"
    textSize(20);
    text("rollScore"+" "+":"+" " + rollScore,x, y-1.5*h);
    
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }
 

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}






