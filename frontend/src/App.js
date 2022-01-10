import logo from './logo.svg';
// import './App.css';
import React, { createContext } from 'react';
import { Provider } from 'react-redux';
import store from './config/configureStore';
import AppRoutes from './config/appRoutes';


// import ActionCableContext from './config/providers';


function App() {
	return (
		<div className="App">
			<Provider store={store}>
				<header className="App-header">
					<AppRoutes />
				</header>
			</Provider>
		</div>
	);
}

export default App;
