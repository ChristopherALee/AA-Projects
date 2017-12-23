import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => {
  return (
    <li>
      <Link to={`/pokemon/${pokemon.id}`} id="pokedex-item">
        <p>{pokemon.id}</p>
        <img id="poke-image" src={pokemon.image_url}></img>
        <p>{pokemon.name}</p>
      </Link>
    </li>
  )
};

export default PokemonIndexItem;
