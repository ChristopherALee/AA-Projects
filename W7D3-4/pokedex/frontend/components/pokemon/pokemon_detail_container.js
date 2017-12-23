import React from 'react';
import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { selectAllItems } from '../../reducers/selectors';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
  return {
    pokemon: state.entities.pokemon[state.ui.pokeDisplay],
    items: selectAllItems(state)
  };
};

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
