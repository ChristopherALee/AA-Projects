import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

import { receiveAllPokemon, requestAllPokemon, createPokemon } from './actions/pokemon_actions';
import * as ApiUtil from './util/api_util';
import { selectAllPokemon } from './reducers/selectors';

window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = ApiUtil.fetchAllPokemon;

window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;

window.createPokemon = createPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
