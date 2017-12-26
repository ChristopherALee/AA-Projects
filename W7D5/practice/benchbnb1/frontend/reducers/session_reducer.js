import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';

const sessionReducer = (state = { currentUser: null, errors: []}, action) => {
  let newState;
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      newState = Object.assign(
        {},
        state,
        {
          currentUser: action.currentUser,
          errors: action.errors
        }
      );
      return newState;
    default:
      return state;
  }
};

export default sessionReducer;
