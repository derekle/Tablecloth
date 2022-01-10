const INIT_STATE = { products: [] };
export const product = (state = INIT_STATE, action) => {
    switch (action.type) {
        case 'add-product':
            console.log(action.data);
            return {
                ...state,
                products: action.data
            }

        default:
            return INIT_STATE;
    }
};
