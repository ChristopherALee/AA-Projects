Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback) {
  const result = [];

  this.myEach((el) => result.push(callback(el)));
  
  return result;
};

Array.prototype.myReduce = function(callback, initialValue = null) {
  if (initialValue === null) {
    initialValue = this[0];
    this.shift();
  }

  let acc = initialValue;

  this.myEach((el) => acc = callback(acc, el));

  return acc;
};
