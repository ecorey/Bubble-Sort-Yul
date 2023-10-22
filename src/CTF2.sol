// Write a function that sorts an array in ascending order and returns the result. 
//The array will be a fixed of 10 but the contents random. Your solution should implement 
// the following interface:


/**
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

            uint[10] memory sortedArr = unsortedArray;

            assembly {
                // length of the array
                let n := 10

                for { let i := 0 } lt(i, sub(n, 1)) { i := add(i, 1) }
                {
                    for { let j := 0 } lt(j, sub(sub(n, i), 1)) { j := add(j, 1) }
                    {
                        // logic
                        

                    }
                }
            }

        }




        // Optimized manually
        function solutionNotOptimized(uint256[10] calldata unsortedArray) 
            external pure returns (uint256[10] memory sortedArr) {
                assembly {
                    let n := 10  // Length of the array
                    let sortedArr := add(msize(), 1)  // Base address for the sorted array

                    // Copy unsorted array to sorted array
                    for { let i := 0 } lt(i, n) { i := add(i, 1) } {
                        let elem := mload(add(add(unsortedArray, 0x20), mul(i, 0x20)))
                        mstore(add(sortedArr, mul(i, 0x20)), elem)
                    }

                    // Helper function to swap two elements in the array
                    function swap(arr, i, j) {
                        let temp := mload(add(arr, mul(i, 0x20)))
                        mstore(add(arr, mul(i, 0x20)), mload(add(arr, mul(j, 0x20))))
                        mstore(add(arr, mul(j, 0x20)), temp)
                    }

                    // First pass
                    if gt(mload(add(sortedArr, 0x00)), mload(add(sortedArr, 0x20))) { swap(sortedArr, 0, 1) }
                    if gt(mload(add(sortedArr, 0x20)), mload(add(sortedArr, 0x40))) { swap(sortedArr, 1, 2) }
                    // ... continue for all adjacent pairs

                    // ... continue for a total of 9 passes, repeating the above comparisons

                    // Ninth pass
                    if gt(mload(add(sortedArr, 0x00)), mload(add(sortedArr, 0x20))) { swap(sortedArr, 0, 1) }
                    if gt(mload(add(sortedArr, 0x20)), mload(add(sortedArr, 0x40))) { swap(sortedArr, 1, 2) }
                    // ... continue for all adjacent pairs

                    // Load sorted array into return variable
                    for { let i := 0 } lt(i, n) { i := add(i, 1) } {
                        let elem := mload(add(sortedArr, mul(i, 0x20)))
                        mstore(add(sortedArr, add(0x20, mul(i, 0x20))), elem)
                    }
                }
}



}



