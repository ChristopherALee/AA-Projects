const Util = {
  inherits: function(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },
  scale: function(vec, m) {
    return [vec[0] * m, vec[1] * m];
  },

  randomVec: function(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  }


};

// Scale the length of a vector by the given amount.


module.exports = Util;
