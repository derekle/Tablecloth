import React from 'react';
import Dashbutton from '../components/dashButton';
import SidebarButton from '../components/sidebarButton';
const Dashboard = () => {
	return (
		<div>
			Dashboard
			<SidebarButton />
			<Dashbutton label='items' />
			<Dashbutton label='users' />
			<Dashbutton label='tables' />
		</div>
	);
};
export default Dashboard;
