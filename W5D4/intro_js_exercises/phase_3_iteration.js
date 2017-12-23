Array.prototype.bubbleSort = function () {
  let sorted = true;

  while (sorted) {
    sorted = false;

    for (let i = 0; i < this.length; i++) {
      let j = i + 1;

      if (this[i] > this[j]) {
        let temp = this[j];
        this[j] = this[i];
        this[i] = temp;
        sorted = true;
      }
    }
  }
  return this;
};

String.prototype.substrings = function () {
  const result = [];
  
  for (let i = 0; i < this.length; i++) {
    for (let j =  i + 1; j < this.length + 1; j++) {
      result.push(this.substring(i, j));
    }
  }
  return result;
};
