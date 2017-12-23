const readline = require ('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class game {
  constructor() {
    this.stacks = [[3,2,1], [], []];
  }
  
  promptMove(callback) {
    let start;
    let end;
    
    console.log(this.stacks);
    reader.question("Move from? ", function(startTowerIdx) {
      start = parseInt(startTowerIdx);
      
      reader.question("To where? ", function(endTowerIdx) {
        end = parseInt(endTowerIdx);
        console.log(start);
        console.log(end);
        callback(start, end);
        // reader.close();
      });
    });
    
  }
  
  validMove(startTowerIdx, endTowerIdx) {
    console.log(startTowerIdx);
    
    // console.log(this.stacks);
    if (this.stacks[startTowerIdx].length === 0) {
      return false;
    } else if (this.stacks[endTowerIdx].length === 0){
      return true;
    } else if (this.stacks[startTowerIdx][this.stacks[startTowerIdx].length - 1] < this.stacks[endTowerIdx][this.stacks[endTowerIdx].length - 1]){
      return true;
    } else {
      return false;
    }
  }
  
  move(startTowerIdx, endTowerIdx){
    if(this.validMove(startTowerIdx, endTowerIdx)){
      const piece = this.stacks[startTowerIdx].pop();
      this.stacks[endTowerIdx].push(piece);
      return true;
    } else {
      return false;
    }
  }
  
  print(){
    console.log(JSON.stringify(this.stacks));
  }
  
  isWon(){
    if(this.check(this.stacks[1]) || this.check(this.stacks[2])){
      // console.log(true);
      return true;
    } else {
      // console.log(false);
      return false;
    }
  }
  
  check(arr){
    const win_arr = [3,2,1];
    if(arr.length === 0){
      return false;
    }
    for (let i = 0; i < arr.length; i++) {
      if(win_arr[i] !== arr[i]){
        return false;
      }
    }
    return true;
  }
  
}

module.exports = game;

const hanoi = new game();
hanoi.promptMove();
// hanoi.validMove(0,1);
// hanoi.validMove(1,0);
// hanoi.validMove(0,0);
// hanoi.move(0,1);
// hanoi.print();
// hanoi.isWon();






