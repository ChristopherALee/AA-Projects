class View {
  constructor(game, $el) {
    this.game = game;
    this.board = $el;
    this.setupTowers();
    // this.render();
  }
  
  setupTowers() {
    this.board.append($("<ul id='0'><li class='one'></li><li class='two'></li><li class='three'></li></ul>"));
    // this.board.append($("<ul id='0'><li></li><li></li><li></li></ul>"));
    
    for (let i = 1; i < 3; i++) {
      this.board.append($(`<ul id='${i}'><li></li><li></li><li></li></ul>`));
    }
    
    return this.board;
  }
  
  render() {
    const towers = this.game.towers;
    $('li').removeClass('1 2 3');
    
    for (let i = 0; i < towers.length; i++) {
      for (let j = 0; j < towers[i].length; j++) {
        if (towers[j].length !== 0) {
          // debugger
          $(`#${i} li:nth-child(${j+1})`).addClass(`${towers[j]}`);
        }
      }
    }
    
    // towers.forEach((tower, idx) => {
    //   tower.forEach((li, idx2) => {
    //     if (li !== undefined) {
    //       $(`#${idx}:nth-child(${idx2})`).addClass(`${li}`);
    //     }
    //     debugger
    //   });
    // });
  }
  
}

module.exports = View;