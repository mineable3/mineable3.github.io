
L = list()

def bad_mean(x: int) -> float:
    global L

    return sum(L) / len(L)

running_sum = 0
n = 0

def mean(x: int) -> float:
    global running_sum, n
    running_sum += x
    n += 1

    return running_sum / n

if __name__ == "__main__":

    while True:
        val = input("Enter a number: ")

        print("mean:", mean(int(val)))

