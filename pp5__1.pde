int sHeight = 500;
int sWidth = 500;

// create two balls
Ball b1 = new Ball(50, 50, sHeight/2, 5, 0);
Ball b2 = new Ball(40, sWidth - 100, sHeight/2, -5, 0);

class Ball {
  PVector pos, vel;
  int radius;
  // constructor
  Ball (int r, int x, int y, int vel_x, int vel_y){
    radius = r;
    pos = new PVector(x, y);
    vel = new PVector(vel_x, vel_y);
  }
  
  // update position
  void update() {
    pos.add(vel);
    
    // check wall collisions
    if (pos.x > width - radius || pos.x < radius) {
      vel.x = -vel.x;
    }
    if (pos.y > height - radius || pos.y < radius) {
      vel.y = -vel.y;
    }
    
    // draw
    fill(color(256, 256, 256));
    ellipse(pos.x, pos.y, 2 * radius, 2 * radius);
  }
  
  // check collision between balls
  boolean check_ball_collision(Ball other) {
     float dist = pos.dist(other.pos);
     if (dist < radius + other.radius){
       return true;
     } else {
       return false;
     }
  }
}

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  b1.update();
  b2.update();
  
  if (b1.check_ball_collision(b2)) {
    b1.vel.x = -b1.vel.x;
    b2.vel.x = -b2.vel.x;
  }
}
