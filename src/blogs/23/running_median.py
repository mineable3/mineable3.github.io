import random
from insertion_sort import insert

def is_valid_max_heap(heap):
    # Iterate from the second element (index 1) to the end
    for i in range(1, len(heap)):
        # Calculate the parent's index
        parent_idx = (i - 1) // 2
        
        # If any child is smaller than its parent, the heap is invalid
        if heap[i] > heap[parent_idx]:
            return False
            
    return True
def is_valid_min_heap(heap):
    # Iterate from the second element (index 1) to the end
    for i in range(1, len(heap)):
        # Calculate the parent's index
        parent_idx = (i - 1) // 2
        
        # If any child is smaller than its parent, the heap is invalid
        if heap[i] < heap[parent_idx]:
            return False
            
    return True

L = list()

def bad_median(x: int) -> float:
    insert(L, x) # runs in O(n) time

    mid = len(L) // 2

    if len(L) % 2 == 0:
        return (L[mid] + L[mid-1]) / 2.0
    else:
        return L[mid]

def heapify(L: list, x: int, min: bool) -> None:
    curr = len(L)
    parent = (curr - 1) // 2
    L.append(x)

    if min:
        while curr > 0 and L[curr] < L[parent]:
            L[curr], L[parent] = L[parent], L[curr]

            curr = parent
            parent = (curr - 1) // 2
    else:
        while curr > 0 and L[curr] > L[parent]:
            L[curr], L[parent] = L[parent], L[curr]

            curr = parent
            parent = (curr - 1) // 2

left_heap = list()
right_heap = list()


def median(x: int) -> float:
    # First element
    if len(right_heap) == 0:
        right_heap.append(x)
        return x

    if len(left_heap) < len(right_heap):
        heapify(left_heap, x, False)
        return (right_heap[0] + left_heap[0]) / 2
    else:
        heapify(right_heap, x, True)
        return right_heap[0]

if __name__ == "__main__":

    while True:
        val = input("Enter a number: ")
        #heapify(right_heap, random.random(), min)
        #print("list:", right_heap)
        print("median:", median(int(val)))
        assert is_valid_min_heap(right_heap)
        assert is_valid_max_heap(left_heap)

