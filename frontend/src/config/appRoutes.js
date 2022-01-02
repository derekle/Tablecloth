import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import Dashboard from '../views/Dashboard';

import Home from '../views/Home';
const AppRoutes = (props) => {
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
