const MovingObject = function(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function(ctx) {
  ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};


document.addEventListener('DOMContentLoaded', () => {
  const circle = new MovingObject([100, 100], [10, 10], 30, "red");
  const canvas = document.getElementById("canvas");
  const ctx = canvas.getContext('2d');
  circle.move(ctx);
  circle.draw(ctx);

});

module.exports = MovingObject;
