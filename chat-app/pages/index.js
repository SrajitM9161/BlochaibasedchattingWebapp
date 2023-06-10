import React, {useContext,useEffect,useState} from 'react'


import {Dappcontex} from "../context/dappcontex";
const ChatDapp  =  () => {

    const {title} = useContext(Dappcontex);

    return <div>{title}</div>

};

export default ChatDapp

