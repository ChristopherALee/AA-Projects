import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  // componentWillReceiveProps(newProps) {
  //   debugger
  // }

  render() {
    const item = this.props.item;
    debugger

    return (
      <ul>
        <li>{item.name}</li>
        <li>Happiness: {item.happiness}</li>
        <li>Price: ${item.price}</li>
      </ul>
    );
  }
}

export default ItemDetail;
