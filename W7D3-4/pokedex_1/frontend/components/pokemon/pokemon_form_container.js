import { connect } from 'react-redux';
import PokemonForm from './pokemon_form';
import { createPokemon } from '../../actions/pokemon_actions';

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    createPokemon: (newPokemon) => dispatch(createPokemon(newPokemon))
  };
};

export default connect(
  null,
  mapDispatchToProps
)(PokemonForm);
