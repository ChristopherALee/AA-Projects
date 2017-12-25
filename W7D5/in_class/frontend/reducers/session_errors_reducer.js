import { RECIEVE_SESSION_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions';

const sessionErrorsReducer = (state = { currentUser: null, errors: [] }, action) => {
  Object.freeze(state);

  let newState;

  switch (action.type) {
    case RECIEVE_SESSION_ERRORS:
      newState = Object.assign(
        {},
        state,
        {
          errors: action.errors,
          currentUser: action.currentUser
        }
      );
      return newState;
    case RECEIVE_CURRENT_USER:
      newState = Object.assign(
        {},
        state,
        {
          errors: [],
          currentUser: action.currentUser
        }
      );
      return newState;
    default:
      return state;
  }
};

export default sessionErrorsReducer;
