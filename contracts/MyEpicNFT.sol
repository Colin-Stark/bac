/// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
/**
@title NFT MINTING CONTRACT
@author xdviernes13xdxd
@dev Inherit the already made openzeppelin contract 
*/
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
/**
@dev Make MyEpic inherit the ERC721 contract in line 8
*/
contract MyEpicNFT is ERC721 {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

/**
@notice Constructor to associate ERC721 function from opezeppelin to a name and symbol
@dev Create the collection name and symbol upon deployment of the contract
*/
  constructor() ERC721 ("Dacollection", "DQQ") {
    console.log("This is my NFT contract dude");
  }

/**
@dev Mint function to mint NFT
*/
  function mintNow() public {
     ///get token id
    uint256 newItemId = _tokenIds.current();

     ///mint to the sender
    _safeMint(msg.sender, newItemId);

    ///increment counter
    _tokenIds.increment();
  }

  /**
  @param _tokenId an unsigned integer(non-negative number) that holds the token ID
  @return String The string "thats's the metadata" is returned at
  */
  function tokenURI(uint256 _tokenId) public view override returns (string memory) {
    require(_exists(_tokenId));
    return "that's the metadata";
  }
}
