import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = ({todos, receiveTodo}) => {
  // debugger
  return (
    <div>
      <h3>Todo List goes here!</h3>
      <TodoForm receiveTodo={receiveTodo} />
      <ul>
        {todos.map( (todo) => <TodoListItem key={todo.id} todo={todo} />)}
      </ul>
    </div>
  );
};

export default TodoList;
