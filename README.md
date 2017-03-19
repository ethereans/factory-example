# Factory Example
Sample application demonstring how to split big contracts and deploy in more than one transaction.  

## Contracts  
This contracts are experimental and intended to study. Review e test carefully before using them.  
  
### Normal call   
Factory directly returns `new Contract()`. Overwrites `msg.sender`! Can be used when sender's `msg` variable is not used . Smallest footprint.
[`src/normal/MyAppTokenFactoryN.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/normal/MyAppTokenFactoryN.sol)
[`src/AppExampleN.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/AppExampleN.sol#L22)

### delegated call    
Not working. Uses manual delegation by `factory.delegatecall()`: uses a storage pointer to read arguments and to return value;
[`src/AppExampleD.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/AppExampleD.sol#L27) - gives error out of gas on delegation.
[`src/normal/MyAppTokenFactoryD.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/delegated/MyAppTokenFactoryD.sol) 

### library call     
Use library for delegate call to `MyAppTokenFactoryN` - best aprooch for delegation of deploy sender.     
[`src/AppExampleNL.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/AppExampleNL.sol) - works but contracts not splitted.  
[`src/AppExampleNLF.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/AppExampleNLF.sol) - requires `MyAppTokenFactoryN` address in constructor; 
[`src/library/MyAppTokenLibraryNF.sol`](https://github.com/ethereans/factory-example/blob/master/contracts/src/library/MyAppTokenLibraryNF.sol) `using MyAppTokenLibraryNF for MyAppTokenFactoryNI;`  
     
## Deploy   
Deploy first `MyAppTokenFactoryX.sol:MyAppTokenFactoryX` and use the resulting address in the constructor of `AppExampleX.sol:AppExampleX`
  
### Using ethereum-sandbox 
Log-in into your live.ether.camp ide  
Open file [`ethereum.json`](https://github.com/ethereans/factory-example/blob/master/ethereum.json) and set the contracts to be deployed, Delegated or Normal.  
Press Run All Contracts.    
