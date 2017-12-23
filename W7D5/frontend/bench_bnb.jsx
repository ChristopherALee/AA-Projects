import React from 'react';
import ReactDOM from 'react-dom';
// import Root from './root';
import { signup, login, logout } from './util/session_api_util';
import configureStore from './store/store';


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
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  const root = document.getElementById('root');
  ReactDOM.render(<h1>BenchBNB</h1>, root);
});
