const View = require('./ttt-view.js');
const Game = require('../solution/game.js');

$( () => {
  // Your code here
  const grid = $('.ttt');
  const game = new Game();
  const view = new View(game, grid);

  
});