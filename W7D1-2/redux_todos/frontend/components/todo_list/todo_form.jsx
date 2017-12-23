import React from 'react';

class TodoForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = { title: '', body: '', done: false };
    this.submit = this.submit.bind(this);
  }

  uniqueId() {
    return new Date().getTime();
  }

  linkState(key) {
    return (event => this.setState({[key]: event.currentTarget.value}));
  }

  submit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state);
    todo.id = this.uniqueId();
    this.props.receiveTodo(todo);
    this.setState({ title: '', body: '', done: false });
  }

  render () {
    return (
      <label>Create Todo:
        <form onSubmit={this.submit}>
          <input onChange={this.linkState('title')} value={this.state.title}/>
          <button>Create Todo</button>
        </form>
      </label>
    );
  }
}

export default TodoForm;
