import { combineReducers } from 'redux';
import sessionReducer from './sessionReducer';
import errorsReducer from './errors_reducer';

const rootReducer = combineReducers({
  session: sessionReducer,
  errors: errorsReducer
});

export default rootReducer;
