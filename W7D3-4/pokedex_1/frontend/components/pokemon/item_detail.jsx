import React from 'react';
import { Link } from 'react-router-dom';

const ItemDetail = (props) => {
  debugger
  return (
    <div className='item-detail'>
      <h3>{props.item.name}</h3>
      <h5>Price: ${props.item.price}</h5>
      <h5>Happiness: {props.item.happiness}</h5>
    </div>
  );
};

export default ItemDetail;
