import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { activeIndex: 0 };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(idx) {
    return () => this.setState({activeIndex: idx});
  }

  render() {
    const tabLis = this.props.tabs.map((el, idx) => {
      return (
        <li key={idx} className={this.state.activeIndex === idx ? 'selected' : ''}>
          <h1 onClick={this.handleClick(idx)}>{el.title}</h1>
        </li>);
    });

    return(
      <div className="tabs">
        <ul>{tabLis}</ul>
        <article className="tab-content">{this.props.tabs[this.state.activeIndex].content}</article>
      </div>
    );
  }
}


export default Tabs;
