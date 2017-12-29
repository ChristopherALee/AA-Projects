import React from 'react';
import {Link} from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';
import ItemDetail from './item_detail';
import { Route } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.pokemonId !== newProps.pokemonId) {
      this.props.requestSinglePokemon(newProps.pokemonId);
    }
  }

  render() {
    const pokemon = this.props.pokemon;
    // debugger

    if (pokemon && pokemon.moves && this.props.items) {
      const moves = pokemon.moves.join(', ');
      const items = this.props.items.map( (item, idx) => {
        // debugger
        return (
          <Link key={idx} to={`/pokemon/${item.pokemon_id}/items/${item.id}`}>
            <li key={idx}>
              <img src={item.image_url}></img>
            </li>
          </Link>
        );
      });

      return (
        <div className='pokemon-detail'>
          <img src={pokemon.image_url}></img>
          <h2>{pokemon.name}</h2>

          <div className='poke-info'>
            <p>Attack: {pokemon.attack}</p>
            <p>Defense: {pokemon.defense}</p>
            <p>Type: {pokemon.poke_type}</p>
            <p>Moves: {moves}
            </p>
          </div>

          <div className='poke-items'>
            <h3>Items</h3>
            <ul>
              {items}
            </ul>
            <Route path='/pokemon/:pokemonId/items/:itemId' component={ItemDetailContainer} />
          </div>


        </div>
      );
    } else {
      return (
        <h2 className='pokemon-detail'>Loading...</h2>
      );
    }
  }
}

export default PokemonDetail;
