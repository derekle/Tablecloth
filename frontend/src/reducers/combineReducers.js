import { combineReducers } from 'redux';
import { user } from './userReducer';
import { products } from './productReducer';
export default combineReducers({
	user,
	products,
});
