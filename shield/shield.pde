float percent;
int total;
int counter;
boolean record;

void setup(){
  size(480, 480);
  percent = 0;
  total = 120;
  counter = 1;
  record = true;
}

void draw(){
  if (record){
    percent = float(counter) / total;
    if (counter == total-1){
      exit();
    }
  } else{
    percent = float(counter % total) / total;
  }
  render(percent);
  if (record) {
    saveFrame("output/gif-" + counter + ".png");
  }
  counter++;
}

void render(float percent){
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(4);
  if (percent > 0.5) {
    percent -= 0.5;
    percent = 0.5 - percent;
  }
  for (float i = 0; i < percent; i+=0.01){
    fill(255*map(i, 0, percent, 0, 1),0,50);
    percent = percent - i;
    if (percent < 0){
      percent = 0;
    }
    beginShape();
    for (float a = -width/2; a < width/2; a++){
      float scaleX = map(percent, 0, 1, 10, 100*PI);
      float scaleY = map(percent, 0, 1, 0.1, 2); 
      float y = (1/sqrt(2*PI))*exp(-pow(a / scaleX, 2)/2) * scaleY;
      y = map(y, 0, 0.4, 0, -height/2 + 10);
      vertex(-y, a);
    }
    // DOWN
    for (float a = -width/2; a < width/2; a++){
      float scaleX = map(percent, 0, 1, 10, 100*PI);
      float scaleY = map(percent, 0, 1, 0.1, 2); 
      float y = (1/sqrt(2*PI))*exp(-pow(a / scaleX, 2)/2) * scaleY;
      y = map(y, 0, 0.4, 0, -height/2 + 10);
      vertex(y, -a);
    }
    endShape();
  }
}
