/*
COMPARER - V.1
 
 Text Client UI
 Looks like any sql text client but no scrolling, just redrawing.
 Has a bunch of commands user can use to interact with the application.
 
 COMMANDS: create table(name), add field(name, type), remove field(name), add item (name), remove item(name), add value(name, field_name, value) 
 
 Types: text (string), decimal number (float), unit (int), yes/no (boolean)
 
 */

private static final int x_padding = 20;
private static final int y_padding = 30;

private PFont titleFont;
private static final float titleX = 700/2;  //make title at centre top
private static final color titleColor = #04CEA4;  

private static final int textWrap = 700 - x_padding;  //text begins at padding_x and ends at width of app - the x_padding
private static final int textY = y_padding+80;
private static final color textColor = #6BEA05; 
private PFont textFont;

private String clientText;
private PFont clientTextFont;
private static final color clientTextColor = 255;  

private int time = millis();
private boolean blinkOn;

void setup() {

  size(700, 700);
  background(0);

  titleFont = createFont("Verdana", 40, true);
  textFont = createFont("Arial Italic", 18, true);
  clientTextFont = createFont("Arial", 16, true);

  blinkOn = true;
  time = millis();
  clientText = "";
}

void draw() {

  background(0);
  textAlign(CENTER, TOP);  //to set the axis of growth for the text
  fill(titleColor);
  textFont(titleFont);
  text("COMPARER", width/2, y_padding);
  stroke(titleColor);
  line (x_padding+(textWidth("COMPARER")/2), y_padding+50, width-x_padding-(textWidth("COMPARER")/2), y_padding+50);

  textAlign(LEFT, CENTER);  //to set the axis of growth for the text
  fill(textColor);
  textFont(textFont);
  text("What whould you like to compare?   eg. Laptops, toasters, beds, cars", x_padding, textY);

  textAlign(LEFT, CENTER);  //to set the axis of growth for the text
  fill(clientTextColor);
  textFont(clientTextFont);
  text(clientText, x_padding+10, textY+25);

  if (blinkOn) {
    strokeWeight(2);
    stroke(clientTextColor);
    line((textWidth(clientText)+16)+x_padding, textY+18, (textWidth(clientText)+16)+x_padding, textY+35);
  }
  if (millis() - 500 > time) {
    time = millis();
    blinkOn = !blinkOn;
  }
}

void keyPressed() {
  if (key == BACKSPACE)
    clientText = clientText.substring(0, max(0, clientText.length()-1));
  else if (key == ENTER)
    clientText = "AYYYYY";  // replace with commands
  else
    clientText+=key;
  
}