export const fetchProduct = (params, method) => {
    console.log('fetching product')
    console.log(method)
    switch (method) {
        case 'POST':
            console.log('POST')
            return (dispatch) => {
                fetch('http://localhost:3000/products', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(params),
                })
                    .then(response => response.json())
                    .then(data => {
                        dispatch({
                            type: 'add-product',
                            data: data,
                        });
                    })
                    .catch((error) => {
                        console.error('Error:', error);
                    });

            }
    }



    if (method === 'GET') {
        console.log('GET')
        return (dispatch) => {
            fetch('http://localhost:3000/products')
                .then(response => response.json())
                .then(data => {
                    console.log(data)
                    dispatch({
                        type: 'get-product',
                        data: data,
                    });
                })
        }
    }
};
