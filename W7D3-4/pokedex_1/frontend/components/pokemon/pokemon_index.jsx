import React from 'react';
import { Route, Link } from 'react-router-dom';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonFormContainer from './pokemon_form_container';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemon = this.props.pokemon.map( (poke) => {
      return (
        <PokemonIndexItem key={poke.id} poke={poke}/>
      );
    });

    return (
      <div id='pokedex-main-page'>
        <ul className='pokemon-list'>
          {pokemon}
        </ul>

        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
        <Route path='/create' component={PokemonFormContainer} />

      </div>
    );
  }
}

export default PokemonIndex;
