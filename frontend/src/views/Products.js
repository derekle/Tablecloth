// import '../css/dashboard.css'
import React, { useState, useEffect, useContext } from 'react'
import Sidebar from '../components/sidebar/sideBar';
import CreateForm from '../components/createForm';
import CableApp from '../config/providers';
import { useDispatch } from 'react-redux';
const Products = (props) => {
	const [visible, setVisible] = useState(true)
	const [showCreateForm, setShowCreateForm] = useState(false)
	const [channel, setChannel] = useState(null)
	const dispatch = useDispatch()

	useEffect(() => {
		const channel = CableApp.cable.subscriptions.create(
			{
				channel: 'ProductsChannel',
				store: props.store_id,
			},
			{
				received: (data) => {
					console.log(data)
					dispatch({ type: 'get-product', data: data.products })
				},
			}
		)
		setChannel(channel)
		return () => {
			channel.unsubscribe()
		}
	}, [])
	return (
		<div className='dashboard'>
			<div className='topnav'>
				<button
					className='sidebar-button'
					onClick={() => { setVisible(!visible) }}
				>
					☰
				</button>
				Products

			</div>
			<div className='main'>
				<Sidebar visible={visible} />
				<button
					onClick={() => { setShowCreateForm(!showCreateForm) }}>
					Create Product+
				</button>
				<CreateForm visible={showCreateForm} />
			</div>
			<div>
				{props.products.map(product => {
					return <div>{product.name}</div>
				})}
			</div>
		</div>
	);
};
export default Products;
