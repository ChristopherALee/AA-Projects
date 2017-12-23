class View {
  constructor(game, $el) {
    this.$grid = $el;
    this.setupBoard();
    this.game = game;
    this.bindEvents();
    
  }

  bindEvents() {
    this.$grid.on('click', 'li', (e) => { 
      const pos = $(e.target).data('pos');
      if ($(e.target).hasClass('clicked')) {
        alert("That's already been clicked.");
      } else {
        this.game.playMove(pos);
        this.makeMove($(e.target));
        $(e.target).addClass('clicked');
        
        if (this.game.isOver()) {
          const winner = this.game.winner();
          const winningSquares = $('li').filter( (idx, li) => {
            // debugger
            if ($(li).text() !== winner && $(li).text() !== "") {
              return li;
            }
          });
          winningSquares.addClass('winners');
        }
      }
    });
  }

  makeMove($square) {
    const mark = this.game.currentPlayer;
    // debugger
    $square.text(mark);
  }

  setupBoard() {
    
    const board = $('<ul></ul>');
    
    this.$grid.append(board);
    const lis = $('li');
    for (let i = 0; i < 9; i++) {
      let li = $('<li></li>');
      li.data('pos', [Math.floor(i / 3) , i % 3]);
      board.append(li.addClass(`row-${Math.floor(i / 3)}`));
    //   if (idx % 3 === 1) {
    //     const li = 
    //     $(el).addClass(`row-0`);
    //     board.append($('<li></li>'));
    //   } else if (idx % 3 === 2) {
    //     $(el).addClass(`row-1`);
    // }
    }
  }
}

module.exports = View;