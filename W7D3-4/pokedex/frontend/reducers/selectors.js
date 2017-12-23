import lodash from 'lodash';

export const selectAllPokemon = (state) => {
  return lodash.values(state.entities.pokemon);
};

export const selectAllItems = (state) => {
  return lodash.values(state.entities.items);
};

export const selectPokemonItem = (state, itemId) => {
  const items = lodash.values(state.entities.items);
  return items.filter((item) => item.id === itemId);
};
