import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_SINGLE_POKEMON,
  RECEIVE_NEW_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  let newState;
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      // debugger
      newState = Object.assign({}, action.pokemon, state);
      return newState;
    case RECEIVE_SINGLE_POKEMON:
      // debugger
      newState = Object.assign({}, state, {[action.pokemonWithItems.pokemon.id]: action.pokemonWithItems.pokemon});
      return newState;
    case RECEIVE_NEW_POKEMON:
      newState = Object.assign({}, state, {[action.newPokemon.pokemon.id]: action.newPokemon.pokemon});
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
