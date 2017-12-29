import * as ApiUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser: currentUser
  };
};

export const receiveErrors = (errors) => {
  return {
    type: RECEIVE_ERRORS,
    errors: errors
  };
};

export const receiveSessionErrors = (errors) => {
  return {
    type: RECEIVE_SESSION_ERRORS,
    errors: errors
  };
};

export const signup = user => dispatch => {
  return (
    ApiUtil.signup(user).then(user => (
      dispatch(receiveCurrentUser(user))))
  );
};

export const login = user => dispatch => {
  // debugger
  return (
    ApiUtil.login(user).then(() => (
      dispatch(receiveCurrentUser(user))))
  );
};

export const logout = () => dispatch => {
  return (
    ApiUtil.logout().then(user => (dispatch(receiveCurrentUser(null))))
  );
};
