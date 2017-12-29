import * as ApiUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';
export const RECEIVE_NEW_POKEMON = 'RECEIVE_NEW_POKEMON';

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receiveSinglePokemon = (pokemonWithItems) => {
  return {
    type: RECEIVE_SINGLE_POKEMON,
    pokemonWithItems
  };
};

export const receiveNewPokemon = (newPokemon) => {
  return {
    type: RECEIVE_NEW_POKEMON,
    newPokemon
  };
};

export const requestAllPokemon = () => dispatch => {
  return (
    ApiUtil.fetchAllPokemon().then(pokemon => dispatch(receiveAllPokemon(pokemon)))
  );
};

export const requestSinglePokemon = (id) => dispatch => {
  return (
    ApiUtil.fetchSinglePokemon(id).then(pokemonWithItems => dispatch(receiveSinglePokemon(pokemonWithItems)))
  );
};

export const createPokemon = (pokemon) => dispatch => {
  return (
    ApiUtil.createPokemon(pokemon).then(newPokemon => {
      dispatch(receiveNewPokemon(newPokemon));
      return newPokemon;
    })
  );
};
