import processing.pdf.*;

float screenWidth = 460;   // set logo width (pixel)
boolean drawColor = true;  // color or grayscale
boolean drawGrid = false;  // draw 11 x 8 grid
boolean drawFrame = false; // draw outline frame

void setup() {
  int gridSize = int(screenWidth / 11.0);
  size(gridSize * 11, gridSize * 8, PDF, "25th.pdf");
  background(255);
  strokeWeight(0.5);
  noFill();

  float stepX, stepY;
  stepX = width / 11.0;
  stepY = height/ 8.0;

  // grid
  if (drawGrid) {
    stroke(0, 31);
    for (int i = 0; i < 11; i++) {
      line(i * stepX, 0, i * stepX, height);
    }
    for (int i = 0; i < 8; i++) {
      line(0, i * stepY, width, i * stepY);
    }
  }

  stroke(0, 63);
  // S 
  for (int i = 0; i < 25; i ++) {
    beginShape();
    curveVertex(3 * stepX, 1 * stepY);
    curveVertex(3 * stepX, 1 * stepY);
    curveVertex((1 + random(1.0)) * stepX, 3 * stepY);
    curveVertex((3 - random(1.0)) * stepX, 5 * stepY);
    curveVertex(1 * stepX, 7 * stepY);
    curveVertex(1 * stepX, 7 * stepY);
    endShape();
  }

  // F 
  for (int i = 0; i < 25; i ++) {
    beginShape();
    curveVertex(7 * stepX, 1 * stepY);
    curveVertex(7 * stepX, 1 * stepY);
    curveVertex((5 + random(1.0)) * stepX, 3 * stepY);
    curveVertex(5 * stepX, 7 * stepY);
    curveVertex(5 * stepX, 7 * stepY);
    endShape();
  }

  // C
  for (int i = 0; i < 25; i ++) {
    beginShape();
    curveVertex(10 * stepX, 1 * stepY);
    curveVertex(10 * stepX, 1 * stepY);
    curveVertex((8 + random(1.0)) * stepX, 4 * stepY);
    curveVertex(10 * stepX, 7 * stepY);
    curveVertex(10 * stepX, 7 * stepY);
    endShape();
  }

  // dot
  if (drawColor) {
    fill(#e84e40);
  } else {
    fill(127);
  }
  noStroke();
  float radius = stepX / 3.0;
  ellipse(3 * stepX, 1 * stepY, radius, radius);
  ellipse(1 * stepX, 7 * stepY, radius, radius);
  ellipse(7 * stepX, 1 * stepY, radius, radius);
  ellipse(5 * stepX, 7 * stepY, radius, radius); 
  ellipse(10 * stepX, 1 * stepY, radius, radius);
  ellipse(10 * stepX, 7 * stepY, radius, radius); 
  ellipse(6 * stepX, 4 * stepY, radius, radius);

  // frame
  if (drawFrame) {
    stroke(31);
    noFill();
    rect(0, 0, width, height);
  }
}
