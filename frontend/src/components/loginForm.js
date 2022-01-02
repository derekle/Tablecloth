import React from 'react';
import { useState, useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { fetchUser } from '../actions/fetchUser';
const LoginForm = (submit) => {
	const [username, setUsername] = useState('');
	const [password, setPassword] = useState('');
	const dispatch = useDispatch();
	return (
		<div>
			<form
				onSubmit={(e) => {
					e.preventDefault();
					// post to server
					dispatch(
						fetchUser({
							username,
							password,
						})
					);
				}}
			>
				<input
					placeholder="username"
					onChange={(e) => {
						setUsername(e.target.value);
					}}
				/>
				<input
					placeholder="password"
					type="password"
					onChange={(e) => {
						setPassword(e.target.value);
					}}
				/>
				<button type="submit">Submit</button>
			</form>
		</div>
	);
};

export default LoginForm;
