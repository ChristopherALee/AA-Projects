import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = (props) => {
  return (
    <Link to={`/pokemon/${props.poke.id}`}>
      <li className='pokeman' key={props.poke.id}>
        <p>{props.poke.name}</p>
        <img src={props.poke.image_url}></img>
      </li>
    </Link>
  );
};

export default PokemonIndexItem;
