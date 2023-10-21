// Write a function that sorts an array in ascending order and returns the result. 
//The array will be a fixed of 10 but the contents random. Your solution should implement 
// the following interface:




//SPDX-License-Identifier:MIT

pragma solidity 0.8.19;


interface Isolution2 {
function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

contract CTF2 is Isolution2 {


    function solution(
        uint256[10] calldata unsortedArray
    ) external pure override returns (uint256[10] memory sortedArray) {
        
        uint256[10] memory sortedArray;  
        
       

        return sortedArray;
    }

}

