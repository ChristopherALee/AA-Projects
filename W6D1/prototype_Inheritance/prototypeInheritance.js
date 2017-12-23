Function.prototype.inherits = function (parent) {
  function Surrogate () {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

Function.prototype.inherits2 = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject () {}

function Ship () {}
Ship.inherits2(MovingObject);

function Asteroid () {}
Asteroid.inherits2(MovingObject);

function Rock () {}
Rock.inherits2(Asteroid);
const asteroid = new Asteroid();
const rock = new Rock();
const moving = new MovingObject();

Rock.prototype.blowup = function() {
  console.log('booooooommmmmmmmmm!');
};
rock.blowup();
