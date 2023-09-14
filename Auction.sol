// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Bidding {

    struct Item {
        string name;
        string description;
        address payable highestBidder;
        uint highestBid;
    }

    mapping(uint => Item) public items;  // a button named with item will be created which will tell the give all the info of stored in Item struct

    uint public itemCount;

    constructor() {
        itemCount = 0;
    }

    function createItem(string memory _name, string memory _description)
        public
    {
        itemCount++;
        items[itemCount] = Item(_name, _description, payable(msg.sender), 0);
    }

    function palceBid(uint256 _itemId, uint256 _bidAmount) public payable {
        require(_itemId > 0 && _itemId <= itemCount, "Invalid Item Id");
        require(
            _bidAmount > items[_itemId].highestBid,
            "Bid Amount must be Greater that the previous highest Bid"
        );

        if (items[_itemId].highestBidder != address(0)) {
            // Refund the Prev Bidder as it exist if this fun is been called
            items[_itemId].highestBidder.transfer(items[_itemId].highestBid);
        }

        // This is else condition
        items[_itemId].highestBidder = payable(msg.sender);
        items[_itemId].highestBid = _bidAmount; 

    }

function getWinningBid(uint _itemId) public view  returns(address, uint) {
  require(_itemId > 0 && _itemId <= itemCount, "Invalid item Id" );

  return ( items[_itemId].highestBidder, items[_itemId].highestBid);  
}


}
