import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  let newState;

  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      newState = {};
      // debugger
      const items = action.pokemonWithItems.items.forEach( (item) => {
        newState = Object.assign({}, newState, {[item.id]: item});
      });

      return newState;
    default:
      return state;
  }
};

export default itemsReducer;
