import controlP5.*;
ControlP5 cp5;

float lengthValue;
float weightValue;
float initialBmiHeight = 400;
float severelyUnderWeight = 16;
float underWeight = 18.5;
float normalWeight = 25;
float overWeight = 30;
float obese = 35;

Numberbox lengthBox;
Numberbox weightBox;

void setup() {
  size(500,500);
  background(0);
  smooth();
  textSize(10);
 
  cp5 = new ControlP5(this);
  
  lengthValue = 180.0;
  weightValue = 70.0;
  
  // numberbox for lenght
 lengthBox = cp5.addNumberbox("lengthValue")
                 .setPosition(80, 50)
                 .setSize(80, 30)
                 .setRange(150, 250)
                 .setValue(lengthValue);
  
  // slider for weight
  weightBox = cp5.addNumberbox("weight (KG)")
                 .setPosition(80, 150)
                 .setSize(80, 30)
                 .setRange(30, 250)
                 .setValue(weightValue);
}

void draw() {
  // length box
   lengthValue = lengthBox.getValue();
   
  // weith box
   weightValue = weightBox.getValue();
   
  // BMI box
    float lengthInMeters = lengthValue / 100;
    float bmi = weightValue / (lengthInMeters * lengthInMeters);
    float barHeight = map(bmi, 12, 30, 0, height -300);
    float barY= height - barHeight;
    fill(0);
    rect(200, 0, 100, height);
    fill(255, 0, 0);
    rect(200, barY, 100, barHeight);
    fill(255);
    text("BMI: " + nf(bmi, 0, 1), 220, 480);
    
  // border lines
    stroke(255);
    line(0, height - map(severelyUnderWeight, 12, 30, 0, height - 300), 500, height - map(severelyUnderWeight, 12, 30, 0, height - 300));
    line(0, height - map(underWeight, 12, 30, 0, height - 300), 500, height - map(underWeight, 12, 30, 0, height - 300));
    line(0, height - map(normalWeight, 12, 30, 0, height - 300), 500, height - map(normalWeight, 12, 30, 0, height - 300));
    line(0, height - map(overWeight, 12, 30, 0, height - 300), 500, height - map(overWeight, 12, 30, 0, height - 300));
    line(0, height - map(obese, 12, 30, 0, height - 300), 500, height - map(obese, 12, 30, 0, height - 300));
    noStroke();
    fill(255);
    text("Severely Under Weight", 10, 480);
    text("underWeight", 10, 445);
    text("normalWeight", 10, 370);
    text("overWeight", 10, 315);
    text("obese", 10, 260);
        
}
