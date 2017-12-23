const range = function(start, end) {
  if (start >= end) {
    return [];
  }

  return [start].concat(range(start+1, end));
};

const sumRec = function(arr) {
  if (arr.length === 0) {
    return 0;
  }
  
  let num = arr.splice(0, 1);
  return num[0] += sumRec(arr);
};

const exponent1 = function(base, exp) {
  if (exp === 0) {
    return 1;
  }
  
  if (exp < 0) {
    return (1 / base * exponent1(base, exp+1));
  }
  
  return base * exponent1(base, exp-1);
};

const exponent2 = function(base, exp) {
  if (exp === 0) {
    return 1;
  }
  
  if (exp < 0) {
    switch (exp % 2) {
      case 0:
      return (1 / Math.pow(exponent2(base, (-1 * exp)/2), 2));
      default:
      return (1 / base * Math.pow(exponent2(base, (exp+1) / 2), 2));
    }
  }
  
  switch (exp % 2) {
    case 0:
      return Math.pow(exponent2(base, exp/2), 2);
    default:
      return base * Math.pow(exponent2(base, (exp-1) / 2), 2);
  }
};

const fibonacci = function(n) {
  const startFib = [0,1];
  
  if (n === 0) {
    return [];
  } else if (n <= 2) {
    return startFib.slice(0, n);
  } else {
    let result = fibonacci(n-1);
    return result.concat(result[result.length - 1] + result[result.length - 2]);
  }
};

const bsearch = function(arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  
  const midIdx = Math.floor(arr.length / 2);
  
  const left = arr.slice(0, midIdx);
  const right = arr.slice(midIdx+1, arr.length);
  // debugger
  if (target === arr[midIdx]) {
    return midIdx;
  } else if (target < arr[midIdx]) {
    return bsearch(left, target);
  } else {
    let sub_result = bsearch(right, target);
    return (sub_result === -1 ? -1 : (sub_result + midIdx + 1));
  }
};

const mergeSort = function(arr) {
  if (arr.length <= 1) {
    return arr;
  }
  
  const midIdx = Math.floor(arr.length/2);
  
  const left = arr.slice(0, midIdx);
  const right = arr.slice(midIdx, arr.length);
  
  return merge(mergeSort(left), mergeSort(right));
};

const merge = function(left, right) {
  let result = [];
  
  while (left.length > 0 && right.length > 0) {
    switch (left[0] <= right[0]) {
      case true:
        result.push(left.shift());
        break;
      case false: 
        result.push(right.shift());
      }
  }
  return result.concat(left).concat(right);
};

const subsets = function(arr) {
  
};


















