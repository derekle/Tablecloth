import { combineReducers } from 'redux';
import { user } from './userReducer';
import { product } from './productReducer';
export default combineReducers({
	user,
	product,
});
