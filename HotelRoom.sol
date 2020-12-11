pragma solidity ^0.5.0;

contract HotelRoom {
    enum Statuses {Vancant, Occupied}
    Statuses currentStatus;
    event Occupy(address _occupant, uint256 _value);
    address payable public owner;

    constructor() public {
        currentStatus = Statuses.Vancant;
        owner = msg.sender;
    }

    modifier onlyWhileVancant {
        require(currentStatus == Statuses.Vancant, "Currently Occupied");
        _;
    }

    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether Provided");
        _;
    }

    function book() external payable onlyWhileVancant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        msg.sender.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
}
