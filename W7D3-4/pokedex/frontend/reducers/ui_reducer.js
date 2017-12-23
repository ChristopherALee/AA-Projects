import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const uiReducer = (state = {}, action) => {
  let newState;

  switch (action.type) {
    case RECEIVE_POKEMON:
      newState = Object.assign({}, state);
      newState.pokeDisplay = action.pokemon.id;
      return newState;
    default:
      return state;
  }
};

export default uiReducer;
