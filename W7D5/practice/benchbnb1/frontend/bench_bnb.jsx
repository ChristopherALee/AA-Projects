import React from 'react';
import ReactDOM from 'react-dom';
import { signup, login, logout } from './util/session_api_util';

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
  const root = document.getElementById('root');
  ReactDOM.render(<h1>BenchBNB</h1>, root);
});
