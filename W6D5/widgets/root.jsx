import React from 'react';

import Clock from './frontend/clock.jsx';
import Tabs from './frontend/tabs.jsx';
// import Weather from './frontend/weather.jsx';


class Root extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const tabProps = [
      {title: 'one', content:'first'},
      {title: 'two', content: 'second'},
      {title: 'three', content: 'third'}
    ];

    return(
    <div>
      <Clock />
      <Tabs tabs={tabProps}/>
    </div>
    );
  }
}


export default Root;
