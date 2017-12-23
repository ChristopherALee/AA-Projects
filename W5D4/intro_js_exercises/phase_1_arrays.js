Array.prototype.uniq = function () {
  const result = [];

  for (let i = 0; i < this.length; i++) {
    if (result.includes(this[i])) {
      continue;
    }
    result.push(this[i]);
  }
  return result;
};

Array.prototype.twoSum = function () {
  const result = [];

  for (let i = 0; i < (this.length - 1); i++) {
    for (let j = 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result;
};

Array.prototype.transpose = function () {
  const result = [];
  
  for (let i = 0; i < this[0].length; i++) {
    result.push([]);
  }

  for (let k = 0; k < this.length; k++) {
    for (let j = 0; j < this[k].length; j++) {
      result[j][k] = this[k][j];
    }
  }

  return result;
};
