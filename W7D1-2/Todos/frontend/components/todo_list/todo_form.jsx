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
    // debugger
    const todo = Object.assign({}, this.state);
    // todo.id = this.uniqueId();
    this.props.createTodo(todo).then(
      () => this.setState({ title: '', body: '', done: false })
    );
  }

  render () {
    return (
      <label>Create Todo:
        <form onSubmit={this.submit}>
          Title:
          <input onChange={this.linkState('title')} value={this.state.title}/>

          Body:
          <input onChange={this.linkState('body')} value={this.state.body}/>
          <button>Create Todo</button>
        </form>
      </label>
    );
  }
}

export default TodoForm;
