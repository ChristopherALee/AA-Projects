const Game = require("./game");

class towersOfHanoi {
  constructor(){
    this.game = new Game();
    this.run(() => {
      console.log("You won");
    });
  }
  
  run(completionCallback) {
    // until won
      // get move from player
      // make move on board if valid
  
    const moveCallback = (start, end) => {
      this.game.move(start, end);
      
      if (!this.game.isWon()) {
        this.game.promptMove(moveCallback);
      } else {
        completionCallback();
      }
    };
    
    this.game.promptMove(moveCallback);

    
    // completionCallback();
  }
  
}

const new_game = new towersOfHanoi();