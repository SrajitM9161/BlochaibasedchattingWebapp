import {ethres} from "ethers";
import Web3Modal from "web3modal";

import {dappAdress,dappABI} from "../context/constants";



export const walletconnection = async() =>{
    try{
       
        if(!window.ethereum) return  console.log("Install Metamask")
        const accounts=await window.ethereum.request({
method: "eth_account",
        });
        const first_account=accounts[0]
        return first_account=accounts;
    }

    catch(error){
        console.log("error")
    }
};

export const connectwallet = async() =>{
    try{
       
        if(window.ethereum) return  console.log("Install Metamask")
        const accounts=await window.ethereum.request({
method: "eth_requestaccount",
        });
        const first_account=accounts[0]
        return first_account;
    }

    catch(error){
        console.log("error")
    }
};

const fetchcontract =(signerOrProvider) => 
new ethers.Contract(dappABI, dappAdress,signerOrProvider);

export const connectionContract = async ()=>{

    try{
const web3modal =new Web3Modal();
const connection =await web3modal.connect();
const provider = new ethres.providers.Web3Provider(connection);
const signer = provider.getSigner();
const contract =fetchcontract(signer)
return contract;
    }
    catch(error){
    console.log(error);
    }
}

export const converttime=(time) =>{
    const newtime=new Data(time.toNumber());

    const realTime =newtime.getHours()+ "/"+
    newtime.getMinutes()+ "/"+
    newtime.getSeconds()+ "Data:"+
    newtime.getData()+ "/"+
    (newtime.getMonth()+ 1);

    return realTime;
    
}
