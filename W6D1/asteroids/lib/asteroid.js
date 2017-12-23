const Util = require('./util.js');
// const MovingObject = require('./moving_object.js');

function Asteroid(options) {
  // this.pos = options.pos;
  MovingObject.call(this, {
    pos: options.pos,
    radius: 50,
    color: 'blue',
    vel: Util.randomVec(50)
  });
}
//
// Asteroid.prototype.randomVec = function(length) {
//   const deg = 2 * Math.PI * Math.random();
//   return Util.scale([Math.sin(deg), Math.cos(deg)], length);
// };

Util.inherits(Asteroid, MovingObject);
