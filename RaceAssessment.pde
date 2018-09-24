int sharkY = 0; // The Y position of the animals.
int dolphinY = 0;
int whaleY = 0;

boolean sharkMove = false; // Prevents holding down keys.
boolean dolphinMove = false;
boolean whaleMove = false;

boolean win = false; // Has sombody won?

PImage shark; // Stores the images the game uses.
PImage dolphin;
PImage whale;
PImage fish;
PImage water;

void setup() { // Setup...
  size(800,1000); // Sets the window size.
  shark = loadImage("shark.png"); // Loads the images.
  water = loadImage("water.png");
  dolphin = loadImage("dolphin.png");
  whale = loadImage("whale.png");
  fish = loadImage("fish.png");
}

void draw() { // Every frame...
  imageMode(CORNERS); // Draws the background.
  image(water,0,0,800,1000);
  image(fish,500,1000,300,800);
  
  imageMode(CENTER); // Draws the animals.
  image(shark,200,sharkY,250,150);
  image(dolphin,400,dolphinY,250,150);
  image(whale,650,whaleY,250,150);
  
  if (sharkY > 800) { // Detects if the shark has won.
    win = true;
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The shark has gotten the fish!",400,400);
} else if (dolphinY > 800) { // Detects if the dolphin has won.
    win = true;
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The dolphin has gotten the fish!",400,400);
} else if (whaleY > 800) { // Detects if the whale has won.
    win = true;
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("The whale has gotten the fish!",400,400);
  }
  
  if (win == true) { // If somebody has won then...
    rectMode(CORNERS); // Create the reset button.
    fill(255);
    strokeWeight(3);
    stroke(0);
    rect(200,350,600,250);
    
    fill(0); // Create the text.
    textAlign(CENTER);
    textSize(55);
    text("R E S E T",400,320);
  }
}

void keyPressed() { // When a key is pressed...
  if (key == 'a' || key == 'A') { // If A is pressed then...
    if (win == false & sharkMove == false) { // If the shark hold prevention is false and nobody has won then...
      sharkY = sharkY + 7; // Move the shark.
      sharkMove = true; // Set the shark hold prevention to true;
    }
  } else if (key == 'g' || key == 'G') { // Else, if G is pressed then...
     if (win == false & dolphinMove == false) { // If the dolphin hold preventon is false and nobody has won then...
       dolphinY = dolphinY + 7; // Move the dolphin.
       dolphinMove = true; // Set the dolphin move prevention to true.
    }
  } else if (key == 'l' || key == 'L') { // Else, if L is pressed then...
     if (win == false & whaleMove == false) { // If the whale move prevention is false and nobody has won then...
       whaleY = whaleY + 7; // Move the whale.
       whaleMove = true; // Set the whale move prevention to true.
    }
  }
}

void keyReleased() { // When a key is released...
  if (key == 'a' || key == 'A') { // If A is released then...
    sharkMove = false; // Set shark move prevention to false.
  } else if (key == 'g' || key == 'G') { // Else, if G is pressed then...
    dolphinMove = false; // Set dolphin move prevention to false.
  } else if (key == 'l' || key == 'L') { // Else, if L is pressed then...
    whaleMove = false; // Set whale move prevention to false.
  }
}

void mouseClicked() { 
  if (mouseX > 200 & mouseX < 600 & mouseY > 250 & mouseY < 350 & win == true) { // If you click the reset button...
    win = false; // Set win to false.
    sharkY = 0; // Reset the Y positions.
    dolphinY = 0;
    whaleY = 0;
  }
}
