import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {

  let newState;

  switch (action.type) {
    case RECEIVE_POKEMON:
      return action.items;
    default:
      return state;
  }
};

export default itemsReducer;
