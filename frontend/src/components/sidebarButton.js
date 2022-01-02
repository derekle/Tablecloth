import React from "react";
import { useState, useEffect } from 'react';
import Sidebar from "./sideBar";
const SidebarButton = () => {
    const [visible, setVisible] = useState(true)
    return (
        <div onClick={() => { setVisible(!visible) }}>
            clickme
            {visible
                ? (<Sidebar />)
                : (null)
            }
        </div>
    )
}

export default SidebarButton