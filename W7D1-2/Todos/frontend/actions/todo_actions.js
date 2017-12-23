import * as ApiUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo
  };
};

export const fetchTodos = () => (dispatch) => {
  return ApiUtil.fetchTodos().then( (todos) => {
    return dispatch(receiveTodos(todos));
  });
};

export const createTodo = (todo) => (dispatch) => {
  return ApiUtil.createTodo(todo).then( (todo) => {
    return dispatch(receiveTodo(todo));
  });
};
