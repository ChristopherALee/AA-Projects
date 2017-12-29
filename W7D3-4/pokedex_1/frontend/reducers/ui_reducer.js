import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const uiReducer = (state = {pokeDisplay: null, errors: {}, loading: {}}, action) => {
  let newState;

  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      newState = Object.assign({}, state, { pokeDisplay: action.pokemonWithItems.id});
      return newState;
    default:
      return state;
  }
};

export default uiReducer;
