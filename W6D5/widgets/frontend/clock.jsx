import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };

    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({time: new Date()});
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  render() {
    let month = this.state.time.getMonth();
    let day = this.state.time.getDay();
    let year = this.state.time.getFullYear();

    let hours = (this.state.time.getHours() % 12);
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    hours = (hours < 10) ? `0${hours}` : hours;
    minutes = (minutes < 10) ? `0${minutes}` : minutes;
    seconds = (seconds < 10) ? `0${seconds}` : seconds;

    return(
      <div>
        <aside className='clock'>
          <h1>CLOCK</h1>
          <span className='names'>Time:</span><span className='numbers'>{hours}:{minutes}:{seconds}</span>
          <span className='names'>Date:</span><span className='numbers'>{month}-{day}-{year}</span>



        </aside>
      </div>
    );
  }
}

export default Clock;
