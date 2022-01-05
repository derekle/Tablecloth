import '../../css/sideBar.css'
import React from "react";
import NavLinks from "./navLinks";
const Sidebar = (props) => {
    return (
        <div
            className='sidebar-container'
        >
            {props.visible
                ? (<NavLinks className='sidebar-visible-true' />)
                : (<NavLinks className='sidebar-visible-false' />)
            }
        </div>
    )
}

export default Sidebar