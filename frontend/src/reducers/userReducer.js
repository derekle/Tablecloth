const INIT_STATE = { user: null };
export const user = (state = INIT_STATE, action) => {
	switch (action.type) {
		case 'add-user':
			return;
			console.log(action);
		default:
			return INIT_STATE;
	}
};
