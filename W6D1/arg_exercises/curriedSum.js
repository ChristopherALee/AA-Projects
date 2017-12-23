function curriedSum(numArgs) {
  const numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((el, acc) => el + acc);
    }
    else return _curriedSum;
  };
}

const s = curriedSum(3);
console.log(s(1)(2)(3));

Function.prototype.curry = function(numArgs) {
  const args = [];
  const self = this;
  return function _curryHelper(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return self.apply(null, args);
    } else {
      return _curryHelper;
    }
  };
};

Function.prototype.curry2 = function(numArgs) {
  const args = [];
  const self = this;
  // const _curryHelper = (...arg) => {
  const _curryHelper = (arg) => {
      args.push(arg);
      if (args.length === numArgs) {
        return self(...args);
      } else {
        return _curryHelper;
      }
  };

  return _curryHelper;
};

const addFive = (a, b, c, d, e) => a + b + c + d + e;
const addThings = (el, acc) => el + acc;
const customCurry = addFive.curry2(5);
console.log(customCurry(1)(2)(10)(20)(100));
