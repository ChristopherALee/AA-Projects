const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback){
  reader.question(`Is ${el1} greater than ${el2}? `, function(answer) {
    if (answer.toUpperCase() === "YES") {
      return callback(true);
    } else {
      return callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
  if (i == arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  }else {
    askIfGreaterThan(arr[i], arr[i+1], function(answer){
      if(answer){
        let right = arr[i+1];
        arr[i+1] = arr[i];
        arr[i] = right;
        madeAnySwaps = true;
        i += 1;
      }else{
        madeAnySwaps = false;
        i += 1;
      }
      innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps = true){
    if(madeAnySwaps){
      innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
    } else {
      return sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop();
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});


