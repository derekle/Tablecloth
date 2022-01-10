import React from "react";
import { useHistory } from "react-router-dom";
import { NavLink } from "react-router-dom";
const NavLinks = (props) => {
    return (
        <div className={props.className}>
            <ul>
                <li><NavLink to="/dashboard">Dashboard</NavLink></li>
                <li><NavLink to="/products">Products</NavLink></li>
                <li>Logout</li>
            </ul>
        </div>
    )
}

export default NavLinks
