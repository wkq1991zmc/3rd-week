pragma solidity ^0.5.0;

contract B {
    uint256 Revenue = 1000;

    function generateForm() public pure returns (string memory) {
        return "form";
    }
}

contract Ba {
    // uint Revenue1 = 2000;  //不加上任何修饰符  默认添加public 可以被继承
    // uint public Revenue1 = 2000;  可以被继承
    //uint internal Revenue1 = 2000; 可以被继承
    uint256 Revenue = 2000; //不可以被继承

    function generateForm1() public pure returns (string memory) {
        return "formBa";
    }
}

contract A is Ba, B {
    function getForm1() public pure returns (string memory) {
        return generateForm1();
    }

    function getRevenue() public view returns (uint256) {
        return Revenue;
    }

    function getForm() public pure returns (string memory) {
        return generateForm();
    }
}
