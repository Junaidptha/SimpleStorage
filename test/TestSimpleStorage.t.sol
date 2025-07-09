// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";

contract TestSimpleStorage is Test {
    SimpleStorage public simpleStorage;

    function setUp() external {
        simpleStorage = new SimpleStorage();
    }

    function testInitialFavoriteNumber() public view {
        uint256 expected = 0;
        assertEq(simpleStorage.retrieve(), expected);
    }

    function testStoreAndRetrieve() public {
        // uint256 newFavoriteNumber = 42;
        simpleStorage.store(42);
        assertEq(simpleStorage.retrieve(), 42);
    }

    function testAddPerson() public {
        string memory name = "Alice";
        uint256 favoriteNumber = 100;
        simpleStorage.addPerson(name, favoriteNumber);

        assertEq(simpleStorage.nameToFavoriteNumber(name), favoriteNumber);
        (uint256 storedFavoriteNumber, string memory storedName) = simpleStorage
            .listOfPeople(0);
        assertEq(storedFavoriteNumber, favoriteNumber);
        assertEq(storedName, name);
    }
}
