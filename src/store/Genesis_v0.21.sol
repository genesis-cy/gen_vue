// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Genesis is ERC721, Ownable {
    using Counters for Counters.Counter;
    using Strings for uint256;

    Counters.Counter private _tokenIdCounter;

    uint256 public recordPrice;
    address payable public recordFund;

    constructor(uint256 _recordPrice, address payable _recordFund) ERC721("Genesis", "GENE") {
        recordPrice = _recordPrice;
        recordFund = _recordFund;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipns/<METADATA FOLDER IPNS KEY>";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, "/", tokenId.toString(), ".json")) : "";
    }

    function changeRecordPrice(uint256 _newPrice) public onlyOwner {
        recordPrice = _newPrice;
    }

    function changeRecordFund(address payable _newFund) public onlyOwner {
        recordFund = _newFund;
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function record() public payable {
        require(recordPrice == msg.value, "Genesis: Wrong amount of ETH to make a record");

        recordFund.transfer(address(this).balance);

        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(_msgSender(), tokenId);
    }
}
