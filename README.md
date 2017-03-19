# Factory Example
Sample application demonstring how to split big contracts and deploy in more than one transaction.  

## Contracts  
This contracts are experimental and intended to study. Review e test carefully before using them.  
  
### Normal call    
[`src/normal/MyAppTokenFactoryN.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/normal/MyAppTokenFactoryN.sol) - normal factory    
[`src/AppExampleN.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/AppExampleN.sol#L22) without using delegation - changes msg.sender   

### delegated call    
[`src/AppExampleD.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/AppExampleD.sol#L27) using delegation - keeps msg.sender - gives error out of gas  
[`src/normal/MyAppTokenFactoryD.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/delegated/MyAppTokenFactoryD.sol) - uses a storage pointer to read arguments and to return value  

### library call    
Would use libraries to make the delegation calls.
  
## Deploy   
Deploy first `MyAppTokenFactoryX.sol:MyAppTokenFactoryX` and use the resulting address in the constructor of `AppExampleX.sol:AppExampleX`
  
### Using ethereum-sandbox 
Log-in into your live.ether.camp ide  
Open file [`ethereum.json`](https://github.com/ethereans/factory-example/blob/master/ethereum.json) and set the contracts to be deployed, Delegated or Normal.  
Press Run All Contracts.    
