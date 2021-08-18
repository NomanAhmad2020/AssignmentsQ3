// paktoken.sol
// by   : Noman Ahmad (PIAIC-153211)
// date : 18/08/2021
// ---------------------------------
// to avoid complier warning 
////SPDX-License-Identifier:UNLICENSED" 

pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

     
contract PakToken is ERC20 {
    uint private rate ;
    address owner;
    constructor(uint256 initialSupply) ERC20("PakToken", "PKT") {
        _mint(msg.sender, initialSupply);                          
         uint rate = 100;
         owner = msg.sender;
    }
    
    function IssueToken () payable external {
        _mint(msg.sender,  msg.value * rate * 10 ** 18);
        
    }
    
    fallback() external payable {
        if(msg.value > 0 ) {
         _mint(msg.sender, msg.value * rate * 10 ** 18 );
        }
    }
    
    function FixRate (uint newrate) external {
        require(msg.sender == owner, "owner required" );
        rate = newrate;
    }
 
    
    
}