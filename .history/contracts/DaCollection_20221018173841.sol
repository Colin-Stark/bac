// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
// we import openzeppelin contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
//we inherit their contract
contract MyEpicNFT is ERC721 {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
//we give a name to our collection
  constructor() ERC721 ("Dacollection", "DQQ") {
    console.log("This is my NFT contract dude");
  }

  //for mint NFTs
  function mintNow() public {
     //get token id
    uint256 newItemId = _tokenIds.current();

     //mint to the sender
    _safeMint(msg.sender, newItemId);

    //increment counter
    _tokenIds.increment();
  }

  //nft emtadata
  function tokenURI(uint256 _tokenId) public view override returns (string memory) {
    require(_exists(_tokenId));
    return "that's the metadata";
  }
}