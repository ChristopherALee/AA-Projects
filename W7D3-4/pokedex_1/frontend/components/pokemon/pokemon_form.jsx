import React from 'react';
import { withRouter } from 'react-router-dom';

const TYPES = [
  'fire',
  'electric',
  'normal',
  'ghost',
  'psychic',
  'water',
  'bug',
  'dragon',
  'grass',
  'fighting',
  'ice',
  'flying',
  'poison',
  'ground',
  'rock',
  'steel'
];

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      name: '',
      attack: '',
      defense: '',
      poke_type: 'fire',
      moves: [],
      image_url: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(field) {
    if (field === 'moves') {
      return (e) => {
        let newMove = [e.target.value];
        this.setState({[field]: newMove});
      };
    } else {
      return (e) => {
        this.setState({[field]: e.target.value});
      };
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createPokemon(this.state).then( (newPokemon) => {
      this.props.history.push(`/pokemon/${newPokemon.pokemon.id}`);
    });
  }

  render() {
    const typeOptions = TYPES.map( (type, idx) => {
      return (
        <option key={idx} value={type}>
          {type}
        </option>
      );
    });

    return (
      <div className='create-pokemon-form'>
        <img className='create-pokemon-form-logo' src='http://static.tvtropes.org/pmwiki/pub/images/pokemon_logo.png'></img>

        <form className='pokemon-form' onSubmit={this.handleSubmit}>
          <input type='text' placeholder='Name' value={this.state.name} onChange={this.handleChange('name')} />

          <input type='text' placeholder='Attack' value={this.state.attack} onChange={this.handleChange('attack')} />

          <input type='text' placeholder='Defense' value={this.state.defense} onChange={this.handleChange('defense')} />

          <select type='text' value={this.state.poke_type} onChange={this.handleChange('poke_type')}>
            <option disabled defaultValue='--Select Type--'>--Select Type--</option>
            {typeOptions}
          </select>

          <input type='text' placeholder='Moves' value={this.state.moves} onChange={this.handleChange('moves')} />

          <input type='text' placeholder='Image URL' value={this.state.image_url} onChange={this.handleChange('image_url')} />

          <input type='submit' value='Create Pokemon'/>
        </form>
      </div>
    );
  }
}

export default withRouter(PokemonForm);
