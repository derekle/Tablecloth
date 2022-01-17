const INIT_STATE = { products: [] };
export const products = (state = INIT_STATE, action) => {
    switch (action.type) {
        case 'get-product':
            return {
                ...state,
                products: [...state.products, ...action.data]
            }
        case 'add-product':
            return {
                ...state,
                products: [...state.products, action.data]
            }
        default:
            return state;
    }
};
