Function.prototype.myBind1 = function () {
  const args = Array.from(arguments);
  const context = args[0];
  const bindArgs = args.slice(1);
  const self = this;

  return function () {
    const callArgs = Array.from(arguments);
    // debugger
    return self.call(context, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind = function (context, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(context, bindArgs.concat(callArgs));
  };
};

Function.prototype.myCall = function (context, ...args) {
  return this.apply(context, args);
};

Function.prototype.myApply = function (context, args) {
  return this.call(context, ...args);
};

// const myBind = function (fnc, context, ...bindArgs) {
//   return (...callArgs) => {
//     return fnc.apply(context, bindArgs.concat(callArgs));
//   };
// };

// const printThis = function () {
//   console.log(this);
// };
//
// const bound = printThis.myBind([1,2,3]);
//
// bound();
//

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// // markov.says("meow", "Ned");
// // markov.says.myBind(breakfast, "meow", "Kush")();
// const bound = markov.says.myBind1(breakfast, "meow");
// // console.log(bound);
// bound("Markov");
// bound("Matthias");
