import React from 'react';

import LoginForm from '../components/loginForm';
import Dashboard from './Dashboard';
const Home = () => {
	return (
		<div>
			<LoginForm />
			<Dashboard />
		</div>
	);
};
export default Home;
