// Write a function that sorts an array in ascending order and returns the result. 
//The array will be a fixed of 10 but the contents random. Your solution should implement 
// the following interface:


/**
 * @title 
 * @author 
 * @notice uses a bubble sort method then reduces the operations to yul to maximize efficiency
 * try without the for loop also 
 */

//SPDX-License-Identifier:MIT

pragma solidity 0.8.19;


interface Isolution2 {
function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}



contract CTF2 is Isolution2 {

    // function in Solidity before being converted to YUL
    function solutionNotOptimized( uint256[10] calldata unsortedArray) 
        external pure returns (uint256[10] memory sortedArr) {
        
            uint n = unsortedArray.length;

            uint[10] memory sortedArr = unsortedArray;

            // Traverse through all elements in the array
            for(uint i = 0; i < n; i++) {
                // Last i elements are already in place, so skip them
                for(uint j = 0; j < n-i-1; j++) {
                    // Swap if the element found is greater than the next element
                    if(sortedArr[j] > sortedArr[j+1]) {
                        (sortedArr[j], sortedArr[j+1]) = (sortedArr[j+1], sortedArr[j]);
                    }
                }
            }
            return sortedArr;        
        
    }


    // The function after using YUL for the login in the nested for loop
    function solution(uint256[10] calldata unsortedArray)
        external pure override returns(uint256[10] memory sortedArray) {
            assembly {
                // length of the array
                let n := 10

                for { let i := 0 } lt(i, sub(n, 1)) { i := add(i, 1) }
                {
                    for { let j := 0 } lt(j, sub(sub(n, i), 1)) { j := add(j, 1) }
                    {
                        // code to perform
                    }
                }
            }
        }


}

