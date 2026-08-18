# 1829. Maximum XOR for Each Query
# Time: O(n)
# Space: O(n)

class Solution:
    def getMaximumXor(self, nums: List[int], maximumBit: int) -> List[int]:
        xor = 0
        for n in nums:
            xor ^= n

        mask = (1 << maximumBit) - 1
        answer = []
        for n in reversed(nums):
            answer.append(xor ^ mask)
            xor ^= n
        
        return answer

    # 1588. Sum of All Odd Length Subarrays
    def sumOddLengthSubarrays(self, arr: List[int]) -> int:
        n = len(arr)
        total = 0
        
        for i in range(n):
            # Total subarrays containing arr[i] = (i + 1) * (n - i)
            # Half of them will have odd length
            # Formula: ((i + 1) * (n - i) + 1) // 2
            odd_count = ((i + 1) * (n - i) + 1) // 2
            total += arr[i] * odd_count
        
        return total
        