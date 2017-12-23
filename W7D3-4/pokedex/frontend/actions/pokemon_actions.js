import * as ApiUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';

export const receiveAllPokemon = pokemon => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receivePokemon = ({pokemon, items}) => {
  return {
    type: RECEIVE_POKEMON,
    pokemon,
    items
  };
};

export const requestAllPokemon = () => (dispatch) => {
  return (
    ApiUtil.fetchAllPokemon().then( (pokemon) => {
      dispatch(receiveAllPokemon(pokemon));
    })
  );
};

export const requestSinglePokemon = (id) => (dispatch) => {
  return (
    ApiUtil.fetchPokemon(id).then( (payload) => {
      dispatch(receivePokemon(payload));
    })
  );
};
