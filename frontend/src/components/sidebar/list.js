import '../../css/list.css'
import React from "react";
import { useState, useEffect } from 'react';

const List = (props) => {
    const [price, setPrice] = useState(0.00)
    return (
        <div className="list">
            <div className="items-container">
                <div className="item">
                    <div className='quantity'>99</div>
                    <div className='name'>item name</div>
                    <div className='price'>$4.50</div>
                </div>
            </div>
            <div className="list-total">
                <p>${price.toFixed(2)}</p>
                <button>
                    Pay
                </button>
            </div>

        </div>
    )
}

export default List