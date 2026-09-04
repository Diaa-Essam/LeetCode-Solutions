

class Solution:

    # 1829. Maximum XOR for Each Query
    # Time: O(n)
    # Space: O(n)
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
        has_incoming = set()
        for i in range(len(edges)):
            has_incoming.add(edges[i][1])
        result = []
        for i in range(n):
            if i not in has_incoming:
                result.append(i)
        return result


# 3622. Check Divisibility by Digit Sum and Product
    def checkDivisibility(self, n: int) -> bool:
        sum_of_digits = 0
        product_of_digits = 0
        num = n

        while num > 0:
            sum_of_digits += num % 10
            product_of_digits *= num % 10
            num //= 10
        return n % (sum_of_digits + product_of_digits) == 0

# 2685. Count the Number of Complete Components

    def countCompleteComponents(self, n: int, edges: List[List[int]]) -> int:
        visited = set()
        count = 0

        adj = [[] for _i in range(n)]
        for u, v in edges:
            adj[u].append(v)
            adj[v].append(u)

        # Nested function "dfs" is needed only inside "countCompleteComponents"
        def dfs(node, component):
            visited.add(node)
            component.append(node)
            for neighbor in adj[node]:
                if neighbor not in visited:
                    dfs(neighbor, component)

        for i in range(n):
            if i not in visited:
                component = []
                dfs(i, component)
                k = len(component)
                edge_count = 0

                for node in component:
                    edge_count += len(adj[node])
                edge_count //= 2

                if edge_count == k * (k - 1) // 2:
                    count += 1
        return count

# 841. Keys and Rooms

    def canVisitAllRooms(self, rooms: List[List[int]]) -> bool:
        visited = set()
        def dfs(room):
            visited.add(room)
            for key in rooms[room]:
                if key not in visited:
                    dfs(key)
        dfs(0)
        return len(visited) == len(rooms)


# 1334. Find the City With the Smallest Number of Neighbors at a Threshold Distance
    def findTheCity(self, n: int, edges: List[List[int]], distanceThreshold: int) -> int:
        result = n

        INF = 10 ** 9
        dist = [[INF] * n for _ in range(n)]

        for i in range(n):
            dist[i][i] = 0

        for u, v, w in edges:
            dist[u][v] = w
            dist[v][u] = w

        for k in range(n):
            for j in range(n):
                for i in range(n):
                    if dist[i][j] > dist[i][k] + dist[k][j]:
                        dist[i][j] = dist[i][k] + dist[k][j]

        best_count = n
        for i in range(n - 1, -1, -1):
            current_count = 0
            for j in range(n):
                if i != j and dist[i][j] <= distanceThreshold and dist[i][j] != INF:
                    current_count += 1
            if best_count > current_count:
                best_count = current_count
                result = i

        return result

# 1584. Min Cost to Connect All Points

    def minCostConnectPoints(self, points: List[List[int]]) -> int:

        n = len(points)
        edges = []

        def manhattan(p1, p2):
            return abs(p1[0] - p2[0]) + abs(p1[1] - p2[1])

        for i in range(n):
            for j in range(i + 1, n):
                w = self.manhattan(points[i], points[j])
                edges.append((w, i, j))


        edges.sort()  # Sort by weight
        parent = list(range(n))

        # Helper Functions
        def find(x):
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]
        

        def union(x, y):
            px, py = find(x), find(y)
            if px == py:
                return False
            parent[px] = py

            return True

        edges_used = 0
        result = 0

        for w, u, v in edges:
            if union(u, v):
                result += w
                edges_used += 1
                if edges_used == n - 1:
                    break
        return result



#994. Rotting Oranges
    def orangesRotting(self, grid: List[List[int]]) -> int:
        q = deque()
        minutes = 0
        fresh = 0

        for i in range(len(grid)):
            for j in range(len(grid[i])):
                if grid[i][j] == 1:
                    fresh += 1
                if grid[i][j] == 2:
                    q.append((i, j))

        while fresh > 0 and len(q) > 0:
            for i in range(len(q)):
                r, c = q.popleft()
                neighbors = [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                for nr, nc in neighbors:
                    if nr in range(len(grid)) and nc in range(len(grid[0])) and grid[nr][nc] == 1:
                        grid[nr][nc] = 2
                        fresh -= 1
                        q.append((nr,nc))
            minutes += 1
        return minutes if fresh == 0 else -1



    # 3731. Find Missing Elements
    def findMissingElements(self, nums: List[int]) -> List[int]:
        min = 10 ** 9
        max = 0
        nums_set = set(nums)

        for i in range(len(nums)):
            if max < nums[i]:
                max = nums[i]
            if min > nums[i]:
                min = nums[i]

        result = []

        for i in range(min, max + 1, 1):
            if i not in nums_set:
                result.append(i)


        return result

    # 141. Linked List Cycle
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        slow = head
        fast = head

        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

            if fast == slow:
                return True

        return False

    # 338. Counting Bits
    def countBits(self, n: int) -> List[int]:
        result = []
        # O(n)
        for i in range(n + 1):
            current = i
            count = 0
            while current > 0:
                if current & 1 == 1:
                    count += 1
                current = current >> 1
            result.append(count)
        
        return result


# 802. Find Eventual Safe States
    def eventualSafeNodes(self, graph: List[List[int]]) -> List[int]:
        n = len(graph)
        state = [0] * n

        def is_safe(node):
            if state[node] != 0:
                return state[node] == 2
            
            state[node] = 1
            for neighbor in graph[node]:
                if not is_safe(neighbor):
                    return False
            state[node] = 2
            return True

        result = []
        for i in range(n):
            if is_safe(i):
                result.append(i)
        return result


# 2392. Build a matrix with conditions

    
