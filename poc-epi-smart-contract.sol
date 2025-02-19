// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrderRegistry {
    struct Order {
        string employeeName;
        string productName;
        string dateTime;
        uint256 amount;
    }

    Order[] public orders;

    function addOrder(
        string memory _employeeName,
        string memory _productName,
        string memory _dateTime,
        uint256 _amount
    ) public {
        orders.push(Order(_employeeName, _productName, _dateTime, _amount));
    }

    function getOrder(uint256 index)
        public
        view
        returns (
            string memory employeeName,
            string memory productName,
            string memory dateTime,
            uint256 amount
        )
    {
        require(index < orders.length, "Index out of bounds");
        Order storage order = orders[index];
        return (order.employeeName, order.productName, order.dateTime, order.amount);
    }

    function getOrdersCount() public view returns (uint256) {
        return orders.length;
    }
}
