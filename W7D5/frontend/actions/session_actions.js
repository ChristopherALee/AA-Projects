import * as ApiUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERROR';
export const RECIEVE_SESSION_ERRORS = 'RECIEVE_SESSION_ERRORS';

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

export const recieveSessionErrors = (errors) => {
  return {
    type: RECIEVE_SESSION_ERRORS,
    errors: errors
  };
};

export const signup = (user) => (dispatch) => {
  return (
    ApiUtil.signup(user).then( dispatch(receiveCurrentUser(user)))
  );
};

export const login = (user) => (dispatch) => {
  return (
    ApiUtil.login(user).then( dispatch(receiveCurrentUser(user)))
  );
};

export const logout = () => (dispatch) => {
  return (
    ApiUtil.logout().then(dispatch(receiveCurrentUser(null)))
  );
};
