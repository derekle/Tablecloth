import React from "react";
import { useState } from 'react'
import { useDispatch } from 'react-redux'
import { fetchProduct } from "../actions/fetchProduct";
const CreateForm = (props) => {
    const [name, setName] = useState('')
    const [category, setCat] = useState('')
    const [price, setPrice] = useState(0.00)
    const [active, setActive] = useState(false)
    const [showError, setShowError] = useState(false)
    const [loading, setLoading] = useState(false)
    const dispatch = useDispatch()

    const handleOnSubmit = (e) => {
        e.preventDefault()
        const params = {
            name: name,
            category_id: 1,
            price: price,
            active: active,
            store_id: 1
        }
        setLoading(!loading)
        dispatch(fetchProduct(params, 'POST'))
    }
    return (
        <div className="createform">
            {props.visible
                ? (
                    <div>
                        <form onSubmit={(e) => { handleOnSubmit(e) }}>
                            <input required placeholder="Name" onChange={(e) => { setName(e.target.value) }} />
                            <input required placeholder="Category" onChange={(e) => { setCat(e.target.value) }} />
                            <input type='number' placeholder="Price" onChange={(e) => { setPrice(e.target.value) }} step='0.01' />
                            <input type='checkbox' onChange={(e) => { setActive(!active) }} />
                            <input type='submit' />
                        </form>
                    </div>
                )
                : null
            }
            {loading
                ? (
                    <div>
                        loading
                    </div>
                )
                : null
            }
        </div >
    )
}

export default CreateForm