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

# 268. Missing Number
    def missingNumber(self, nums: List[int]) -> int:
        n = len(nums)
        result = n
        for i in range(n):
            result ^= (i ^ nums[i])
        return result



# 804. Unique Morse Code Words
    def uniqueMorseRepresentations(self, words: List[str]) -> int:
        dictionary = {'a':".-", 'b':"-...", 'c':"-.-.", 'd':"-..", 'e':".", 'f':"..-.", 'g':"--.", 'h':"....", 'i':"..", 'j':".---", 'k':"-.-", 'l':".-..", 'm':"--", 'n':"-.", 'o':"---", 'p':".--.", 'q':"--.-", 'r':".-.", 's':"...", 't':"-", 'u':"..-", 'v':"...-", 'w':".--", 'x':"-..-", 'y':"-.--", 'z':"--.."}
        transformations = set()
        for str in words:
            for i in range(len(str)):
                transformation += dictionary[str[i]]
            transformations.add(transformation)
            transformation = ""
        return len(transformations)

# 2130. Maximum Twin Sum of a Linked List
    def pairSum(self, head: Optional[ListNode]) -> int:
        list = []
        current = head
        while current is not None:
            list.append(current.val)
            current = current.next

        left = 0
        right = len(list) - 1
        maxPairSum = 0

        while left < right:
            if maxPairSum < list[left] + list[right]:
                maxPairSum = list[left] + list[right]
            left += 1
            right -= 1
        return maxPairSum


    
    def pairSumOptimized(self, head: Optional[ListNode]) -> int:
        maxPairSum = 0
        slow = head
        fast = head
        while fast != None and fast.next != None:
            slow = slow.next
            fast = fast.next.next

        first = head
        second = self.reverseLinkedList(slow)
        
        while second:
            if (first.val + second.val) > maxPairSum:
                maxPairSum = first.val + second.val
            first = first.next
            second = second.next
        return maxPairSum

    def reverseLinkedList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        prev = None
        current = head
        while current:
            next_temp = current.next  # Save next
            current.next = prev       # Reverse
            prev = current            # Move prev forward
            current = next_temp       # Move current forward
        
        return prev



    def minPairSum(self, nums: List[int]) -> int:
        nums.sort()
        left = 0
        right = len(nums)
        maxPairSum = 0

        while left < right:
            pair_sum = nums[left] + nums[right]
            if pair_sum > maxPairSum:
                maxPairSum = pair_sum
        return maxPairSum


# 4020. Elevator Requests I
    def elevatorRequests(self, n: int, requests: list[int]) -> int:
        prev = 0
        result = 0
        for i in range(len(requests)):
            current = requests[i]
            result += abs(current - prev)
            prev = requests[i]
        return result
# 3069. Distribute Elements Into Two Arrays I
    def resultArray(self, nums: List[int]) -> List[int]:
        if len(nums) <= 2:
            return nums
        arr1 = [nums[0]]
        arr2 = [nums[1]]
        p1 = 0
        p2 = 0

        for i in range(2, len(nums)):
            if arr1[p1] > arr2[p2]:
                arr1.append(nums[i])
                p1 += 1
            else :
                arr2.append(nums[i])
                p2 += 1
        return arr1 + arr2


# 1557. Minimum Number of Vertices to Reach All Nodes
    def findSmallestSetOfVertices(self, n: int, edges: List[List[int]]) -> List[int]:
        to_set = {}
        for i in range(len(edges)):
            to_set.add(edges[i][1])
        result = []
        for i in range(len(edges)):
            if edges[i][0] not in to_set:
                result.append(edges[i][0])
        return result
        