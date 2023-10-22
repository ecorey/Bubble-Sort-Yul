// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {CTF2} from "../src/CTF2.sol";

contract SolutionTest is Test {
    
    CTF2 public ctf2;

  

    function setUp() public {
        ctf2 = new CTF2();
    }

    function test_SortedArray() public {
        

    }
}


// in test go through left to right ensuring that each step is less tahn or eq to
