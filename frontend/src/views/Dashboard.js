import '../css/dashboard.css'
import React from 'react';
import { useState, useEffect } from 'react';

import Dashbutton from '../components/dashButton';
import Sidebar from '../components/sidebar/sideBar';
const Dashboard = () => {
	const [visible, setVisible] = useState(true)


	return (
		<div className='dashboard'>
			<div className='topnav'>
				<button
					className='sidebar-button'
					onClick={() => { setVisible(!visible) }}
				>
					☰
				</button>
				Dashboard
			</div>
			<div className='main'>
				<Sidebar visible={visible} />
				<div className='dashbutton-container'>
					<Dashbutton className='dashbutton' label='items' />
					<Dashbutton className='dashbutton' label='users' />
					<Dashbutton className='dashbutton' label='tables' />
				</div>
			</div>
		</div>
	);
};
export default Dashboard;
