import React, { useState, useEffect } from 'react';
import {useRouter} from"next/router";

import {walletconnection ,connectwallet,connectionContract} from "../utils/apifeatures"


export const Dappcontex =React.createContext();

export const Dappprovider = ({children})=>{
  const title ="Wlcome to DCHAT";
  return (
<Dappcontex.Provider value={{title}}>
  {children}
</Dappcontex.Provider>
  );
};

