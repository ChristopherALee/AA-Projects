class Clock {
  constructor() {
    const date  = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();
    
    // Function style - context is binded
    setInterval(this._tick.bind(this), 1000);
    
    // Function style - context binded method style within function
    setInterval(function() {
      this._tick();
    }.bind(this), 1000);
    
    // Fat arrow hax
    setInterval(() => this._tick(), 1000);
    
    // Old way that/this
    const that = this;
    setInterval(function() {
      that._tick();
    }, 1000);
  }
  
  printTime(){
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }
  _tick(){
    this.seconds += 1;
    this.printTime();
  }
}

const clock = new Clock();