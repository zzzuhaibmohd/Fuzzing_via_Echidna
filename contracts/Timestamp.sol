// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/*
Run with config file 
echidna-test contracts/Timestamp.sol --contract EchidnaTestTime --config config.yaml

Run without config file
echidna-test contracts/Timestamp.sol --contract EchidnaTestTime
*/

contract EchidnaTestTime {
    bool private pass = true;
    uint private createdAt = block.timestamp;

    function echidna_test_pass() public view returns (bool) {
        return pass;
    }

    function setFail() external {
        // default TimeDelay is 7 days
        // setting 70 days via config.yaml
        // test case will fail after block.timestamp >= createdAt + delay
        uint delay = 8 days;
        require(block.timestamp >= createdAt + delay);
        pass = false;
    }
}