export const fetchUser = (action) => {
	console.log(action);
	return (dispatch) => {
		dispatch({
			type: 'add-user',
			action: action,
		});
	};
};
