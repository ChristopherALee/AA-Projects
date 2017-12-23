import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';
import fetchTodos from '../../actions/todo_actions';
import createTodo from '../../actions/todo_actions';

class TodoList extends React.Component {
  // debugger
  componentDidMount() {
    this.props.fetchTodos();
  }

  render () {
    return (
      <div>
        <h3>Todo List goes here!</h3>
        <TodoForm createTodo={this.props.createTodo} />
        <ul>
          {this.props.todos.map( (todo) => <TodoListItem key={todo.id} todo={todo} />)}
        </ul>
      </div>
    );
  }
}

export default TodoList;
