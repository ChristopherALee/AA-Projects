import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter, Route } from 'react-router-dom';
import PokemonIndexContainer from './pokemon/pokemon_index_container';

const Root = ({store}) => {
  return (
    <Provider store={store}>
      <HashRouter>
        <div id='pokedex-main'>
          <Route path='/' component={PokemonIndexContainer} />
        </div>
      </HashRouter>
    </Provider>
  );
};

export default Root;
