import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import App from './components/app';
import Root from './components/root';
import allTodos from './reducers/selectors';


// FOR TESTING PURPOSES ONLY, REMOVE BEFORE SHIPPING
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos(store.getState());
// window.fetchTodos = fetchTodos;

document.addEventListener('DOMContentLoaded', () => {
  // debugger
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});
