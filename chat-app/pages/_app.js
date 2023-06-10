import '../styles/globals.css'

import {Dappprovider} from "../context/dappcontex";
import {NavBar} from "../Components/index"
const App =({ Component, pageProps }) => {

  <div>
  <Dappprovider>
    <NavBar/>
  <Component {...pageProps} />
  </Dappprovider>

  </div>
}

export default App;