// Write a function that sorts an array in ascending order and returns the result. 
//The array will be a fixed of 10 but the contents random. Your solution should implement 
// the following interface:


/**
[55, 66, 33, 785, 4, 56, 23, 526, 4444, 56]
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
        
        let sortedArrPtr := sortedArr  // Fixing the memory pointer
        

        // Corrected array copying
        for { let i := 0 } lt(i, 10) { i := add(i, 1) } {
            let elem := mload(add(add(unsortedArray, 0x20), mul(i, 0x20)))
            mstore(add(sortedArrPtr, mul(i, 0x20)), elem)
        }

            

            // to bubble sort without a for loop there will be 9 passes with 9 steps each 
            // each step will the largest element bubbles up to its correct position.
            // for example in the first step the largest element bubbles up to its correct position at index 9.
            // then at the second step the second largest element bubbles up to its correct position at index 8.
            // this process continues for an array fixed at a length of 10.

            // in each line first the first 2 memory locations and loads them from the memory positions.
            // then the two elements are compared and swapped if the first element is greater than the second element. 

            // first pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }

            
            
           

            // second pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }



            // third pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }


            // fourth pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }

          
            // fifth pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }


            // sixth pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }


            // seventh pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }

          
            // eigth pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }


            // ninth pass
            // first comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x00)), mload(add(sortedArrPtr, 0x20))) {
                let temp := mload(add(sortedArrPtr, 0x00))
                mstore(add(sortedArrPtr, 0x00), mload(add(sortedArrPtr, 0x20)))
                mstore(add(sortedArrPtr, 0x20), temp)
            }

            // second comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x20)), mload(add(sortedArrPtr, 0x40))) {
                let temp := mload(add(sortedArrPtr, 0x20))
                mstore(add(sortedArrPtr, 0x20), mload(add(sortedArrPtr, 0x40)))
                mstore(add(sortedArrPtr, 0x40), temp)
            }

            // third comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x40)), mload(add(sortedArrPtr, 0x60))) {
                let temp := mload(add(sortedArrPtr, 0x40))
                mstore(add(sortedArrPtr, 0x40), mload(add(sortedArrPtr, 0x60)))
                mstore(add(sortedArrPtr, 0x60), temp)
            }

            // fourth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x60)), mload(add(sortedArrPtr, 0x80))) {
                let temp := mload(add(sortedArrPtr, 0x60))
                mstore(add(sortedArrPtr, 0x60), mload(add(sortedArrPtr, 0x80)))
                mstore(add(sortedArrPtr, 0x80), temp)
            }

            // fifth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x80)), mload(add(sortedArrPtr, 0xa0))) {
                let temp := mload(add(sortedArrPtr, 0x80))
                mstore(add(sortedArrPtr, 0x80), mload(add(sortedArrPtr, 0xa0)))
                mstore(add(sortedArrPtr, 0xa0), temp)
            }

            // sixth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xa0)), mload(add(sortedArrPtr, 0xc0))) {
                let temp := mload(add(sortedArrPtr, 0xa0))
                mstore(add(sortedArrPtr, 0xa0), mload(add(sortedArrPtr, 0xc0)))
                mstore(add(sortedArrPtr, 0xc0), temp)
            }

            // seventh comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xc0)), mload(add(sortedArrPtr, 0xe0))) {
                let temp := mload(add(sortedArrPtr, 0xc0))
                mstore(add(sortedArrPtr, 0xc0), mload(add(sortedArrPtr, 0xe0)))
                mstore(add(sortedArrPtr, 0xe0), temp)
            }

            // eighth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0xe0)), mload(add(sortedArrPtr, 0x100))) {
                let temp := mload(add(sortedArrPtr, 0xe0))
                mstore(add(sortedArrPtr, 0xe0), mload(add(sortedArrPtr, 0x100)))
                mstore(add(sortedArrPtr, 0x100), temp)
            }

            // ninth comparison and potential swap
            if gt(mload(add(sortedArrPtr, 0x100)), mload(add(sortedArrPtr, 0x120))) {
                let temp := mload(add(sortedArrPtr, 0x100))
                mstore(add(sortedArrPtr, 0x100), mload(add(sortedArrPtr, 0x120)))
                mstore(add(sortedArrPtr, 0x120), temp)
            }



            // No additional steps needed to return sortedArr as it's already the name of the return variable
        }
    }


}



