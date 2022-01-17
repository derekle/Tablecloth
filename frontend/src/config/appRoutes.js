import React, { useEffect } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import Dashboard from '../views/Dashboard';
import Products from '../views/Products'
import Home from '../views/Home';

import { useDispatch, useSelector } from 'react-redux'
import { fetchProduct } from '../actions/fetchProduct';

const AppRoutes = (props) => {
	const dispatch = useDispatch()

	useEffect(() => {
		dispatch(fetchProduct(null, 'GET'))
	}, []);

	const products = useSelector((state) => state.products.products)
	console.log(products)
	return (
		<div>

			<BrowserRouter>
				<Routes>
					<Route
						exact
						path="/"
						element={<Home />}
					/>
					<Route
						exact path='/dashboard'
						element={<Dashboard />}
					/>
					<Route
						exact path='/products'
						element={<Products store_id='1' products={products} />}
					/>
					<Route
						path="*"
						element={
							<Navigate
								replace
								to="/page-not-found"
							/>
						}
					/>
				</Routes>
			</BrowserRouter>
		</div>
	);
};

export default AppRoutes;
