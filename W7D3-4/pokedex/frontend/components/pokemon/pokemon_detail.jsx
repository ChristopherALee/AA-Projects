import React from 'react';
import ItemDetail from './item_detail';
import { Route } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';
import { Link } from 'react-router-dom';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentWillReceiveProps(newProps) {
    const newId = newProps.match.params.pokemonId;
    const currentId = this.props.match.params.pokemonId;
    if (newId !== currentId) {
      this.props.requestSinglePokemon(newId);
    }
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  render() {
    const pokemon = this.props.pokemon;
    // debugger
    if (pokemon) {
      // const attributes = Object.keys(pokemon).slice(4, Object.keys(pokemon).length).map((attribute, idx) => {
      //   if (idx === 2) {
      //     return (
      //       <h3>{ attribute }: {pokemon[attribute].join(", ")}</h3>
      //     );
      //   } else {
      //     return (
      //       <h3>{ attribute }: {pokemon[attribute]}</h3>
      //     );
      //   }
      // });

      const items = this.props.items.map( (item) => {
        return (
          <Link to={`/pokemon/${pokemon.id}/item/${item.id}`}>
            <li key={item.id}>
              <img src={item.image_url}></img>
            </li>
          </Link>
        );
      });

      return (
        <div id="selection">
          <img src={pokemon.image_url}></img>
          <h2>{pokemon.name}</h2>
          <h3>Type: {pokemon.poke_type}</h3>
          <h3>Attack: {pokemon.attack}</h3>
          <h3>Defense: {pokemon.defense}</h3>
          <h3>Moves: {pokemon.moves.join(", ")}</h3>

          <h3>Items</h3>
          <ul id="item-pics">
            {items}
          </ul>

          <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
        </div>
      );
    } else {
      return null;
    }
  }
}

export default PokemonDetail;
