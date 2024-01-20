// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Marketplace {
    struct Item {
        string name;
        string description;
        uint256 price;
        address payable seller;
        bool availability;
    }
 
    mapping(uint256 => Item) public items;

    uint256 itemCount;

    constructor() {
        itemCount = 0;
    }

    event itemListed( uint256 itemId, string name, uint256 price, address seller);
    event orderPlaced(uint256 itemId, address buyers);
    event transactionCompleted( uint256 itemId, address buyer, address seller, uint256 pric);

    function listedItems(string memory _name,string memory _description,uint256 _price) public {
        itemCount++;

        items[itemCount] = Item(_name, _description, _price, payable(msg.sender), true); // this is nice and shortcut method

        // Item storage newItem = items[itemCount];

        // newItem.name = _name;
        // newItem.description = _description;
        // newItem.price = _price;
        // newItem.seller = payable(msg.sender);
        // newItem.availability = true;

        emit itemListed(itemCount, _name, _price, msg.sender);
    }

    function placeOrder(uint256 _itemId) public payable {
        require(_itemId > 0 && _itemId <= itemCount, "Invalid itemId");
        Item storage newItem = items[itemCount];
        require(newItem.availability == true, "Item not available");
        require(msg.value == newItem.price, "Incorrect Amount");

        newItem.availability = false;

        emit orderPlaced(_itemId, msg.sender);
    }

    function completeTrasaction(uint256 _itemId) public {
        require(_itemId > 0 && _itemId <= itemCount, "Invalid item id");

        Item storage newItem = items[_itemId];

        require(!newItem.availability, "Item is still available");
        require(msg.sender != newItem.seller,"seller himself can't be th buyer");

        newItem.seller.transfer(newItem.price);
        emit transactionCompleted( _itemId, msg.sender, newItem.seller, newItem.price);
    }

    function getItem(uint256 _itemId) public view returns ( string memory, string memory, uint256, address, bool ){
        require(_itemId > 0 && _itemId <= itemCount, "Invalid Item Id");

        Item storage newItem = items[_itemId];

        return (newItem.name, newItem.description, newItem.price, newItem.seller, newItem.availability );
    }
}
