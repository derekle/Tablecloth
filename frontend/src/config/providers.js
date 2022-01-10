import React from "react";
import actionCable from 'actioncable'

const CableApp = {}
CableApp.cable = actionCable.createConsumer('ws://localhost:3000/cable')

console.log(CableApp)
export default CableApp;
