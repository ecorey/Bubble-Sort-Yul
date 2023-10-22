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



    // Optimized manually
    function solution(uint256[10] calldata unsortedArray) 
        external pure returns (uint256[10] memory sortedArr) {
        assembly {
            // length of the fixed array is 10
            let n := 10  
            // sets the base address for the sorted array to the memory slot of sortedArr at 0x20
            let sortedArrPtr := add(sortedArr, 0x20) 

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

            // to bubble sort without a for loop there will be 9 passes with 9 steps each 
            // each step will the largest element bubbles up to its correct position.
            // for example in the first step the largest element bubbles up to its correct position at index 9.
            // then at the second step the second largest element bubbles up to its correct position at index 8.
            // this process continues for an array fixed at a length of 10.

            // in each line first the first 2 memory locations and loads them from the memory positions.
            // then the two elements are compared and swapped if the first element is greater than the second element. 

            // first pass
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) { swap(sortedArrPtr, 0, 1) }
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) { swap(sortedArrPtr, 1, 2) }
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) { swap(sortedArrPtr, 2, 3) }
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) { swap(sortedArrPtr, 3, 4) }
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) { swap(sortedArrPtr, 4, 5) }
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) { swap(sortedArrPtr, 5, 6) }
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) { swap(sortedArrPtr, 6, 7) }
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) { swap(sortedArrPtr, 7, 8) }
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) { swap(sortedArrPtr, 8, 9) }

            // second pass

            // third pass

            // fourth pass

            // fifth pass

            // sixth pass

            // seventh pass

            // eigth pass

            // ninth pass
            if gt(mload(add(sortedArr, 0x00)), mload(add(sortedArr, 0x20))) { swap(sortedArr, 0, 1) }
            if gt(mload(add(sortedArr, 0x20)), mload(add(sortedArr, 0x40))) { swap(sortedArr, 1, 2) }
            // ... continue for all adjacent pairs

            // No additional steps needed to return sortedArr as it's already the name of the return variable
        }
    }


}



