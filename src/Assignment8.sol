// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Make this contract inherit from: ERC721URIStorage and Ownable
contract Assignment8 is ERC721URIStorage, Ownable {
    // Declare a private uint called _tokenIdCounter
    uint256 private _tokenIdCounter;

    // Pass name and symbol of the NFT token collection, and initial owner
    constructor() ERC721("Assignment8NFT", "A8NFT") Ownable(msg.sender) {}

    // Make this function visibility: external
    // Pass string json URI parameter
    // Restrict this function to be called only by the owner
    function mintNFT(string memory tokenURI) external onlyOwner {
        // call _mint to mint a new NFT to the function caller
        _mint(msg.sender, _tokenIdCounter);

        // set token URI to the token id using _setTokenURI
        _setTokenURI(_tokenIdCounter, tokenURI);

        // increment token id counter
        _tokenIdCounter++;
    }
}
