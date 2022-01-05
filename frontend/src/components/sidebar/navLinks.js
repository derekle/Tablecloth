import React from "react";

const NavLinks = (props) => {
    return (
        <div className={props.className}>
            <ul>
                <li>Account</li>
                <li>Settings</li>
                <li>Logout</li>
            </ul>
        </div>
    )
}

export default NavLinks
