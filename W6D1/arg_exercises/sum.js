function sum() {
  return Array.from(arguments).reduce((a, b) => a + b);
}
// return console.log(Array.from({'peter': 'pan', 'captain': 'hook'}));

function splatSum(...args) {
  return args.reduce((a, b) => a + b);
}

// console.log(splatSum(1, 2, 3, 4) === 10);
// console.log(splatSum(1, 2, 3, 4, 5) === 15);