// import '../css/dashboard.css'
import React, { useState, useEffect, useContext } from 'react'
import { useParams } from 'react-router-dom'
import Dashbutton from '../components/dashButton';
import Sidebar from '../components/sidebar/sideBar';
import List from '../components/sidebar/list';
import CreateForm from '../components/createForm';
import ActionCableContext from '../config/providers';
import CableApp from '../config/providers';
import { product } from '../reducers/productReducer';
import { useSelector } from 'react-redux';
const Products = () => {
	const [visible, setVisible] = useState(true)
	const [showCreateForm, setShowCreateForm] = useState(false)
	const cproducts = useSelector((state) => state.product.products)
	console.log(cproducts)
	const [products, setProducts] = useState(cproducts)

	const settings = { store: {}, products: [] }

	const [channel, setChannel] = useState(null)
	const { id } = useParams()
	useEffect(() => {
		const store = CableApp.cable.subscriptions.create(
			{
				channel: 'ProductsChannel',
				store: 1,
			},
			{
				received: (updatedStore) => {
					setProducts(updatedStore.products)
					console.log(updatedStore.products)
					console.log(products)


				},
			}
		)

		setChannel(channel)

		return () => {
			channel.unsubscribe()
		}
	}, [id])

	const sendMessage = (content) => {
		channel.send(content)
	}
	console.log(products)
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
				{products.map(product => {
					return <div>{product.name}</div>
				})}
			</div>
		</div>
	);
};
export default Products;
