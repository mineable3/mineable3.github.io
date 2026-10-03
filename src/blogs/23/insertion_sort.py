
def insert(L: list, v: int) -> None:
    L.append(v)

    for i in range(len(L) - 1, 0, -1):
        if L[i] < L[i-1]:
            L[i], L[i-1] = L[i-1], L[i]

if __name__ == "__main__":
    nums = []

    while True:
        val = input("Enter a number: ")
        insert(nums, int(val))
        print(nums)



    
