import '../css/dashboard.css'
import React from 'react';
import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux'

import Sidebar from '../components/sidebar/sideBar';
import List from '../components/sidebar/list';
import { fetchProduct } from '../actions/fetchProduct';
const Dashboard = () => {
	const [visible, setVisible] = useState(true)
	const dispatch = useDispatch()

	useEffect(() => {
		dispatch(fetchProduct(null, 'GET'))
	}, []);

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
