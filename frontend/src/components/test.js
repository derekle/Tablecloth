import React from 'react';
import { useState, useEffect } from 'react';

const Example = () => {
	const [username, setUsername] = useState('');
	const [password, setPassword] = useState('');

	return (
		<div>
			<form
				onSubmit={(e) => {
					e.preventDefault();
					console.log({ username, password });
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
				<input type="submit">Submit</input>
			</form>
		</div>
	);
};

export default Example;
