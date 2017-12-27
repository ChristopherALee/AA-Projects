import React from 'react';
import ReactDOM from 'react-dom';
import { signup, login, logout } from './actions/session_actions';
// import { signup, login, logout } from './util/session_api_util';
import configureStore from './store/store';
import Root from './components/root';

window.createUser = (user) => {
    return $.ajax({
        method: 'POST',
        url: 'api/users',
        data: {
          user: user,
        }
    }).then(
        user => console.log(user));
};

window.signup = signup;
window.login = login;
window.logout = logout;

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser }};
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  // TESTING START
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // TESTING END

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
