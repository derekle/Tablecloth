import '../css/dashboard.css'
import React from 'react';
import { useState } from 'react';

import Sidebar from '../components/sidebar/sideBar';
import List from '../components/sidebar/list';
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
				<List />
			</div>
		</div>
	);
};
export default Dashboard;
