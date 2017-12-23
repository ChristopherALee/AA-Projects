import { RECEIVE_CURRENT_USER, RECEIVE_ERROR } from '../actions/session_actions';

const sessionReducer = (state = { currentUser: null, errors: [] }, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const newState = Object.assign(
        {},
        state,
        {
          errors: action.errors,
          currentUser: action.currentUser
        }
      );
      return newState;
    default:
      return state;
  }
};

export default sessionReducer;
