import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import * as ApiUtil from './util/api_util';
import configureStore from './store/store';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';

// window.fetchAllPokemon = ApiUtil.fetchAllPokemon;
// window.requestAllPokemon = requestAllPokemon;
// window.receiveAllPokemon = receiveAllPokemon;
// window.store = configureStore();
// window.getState = store.getState;
// window.dispatch = store.dispatch;
// window.selectAllPokemon = selectAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, rootEl);
});
