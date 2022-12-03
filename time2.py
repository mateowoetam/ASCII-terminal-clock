import time
import os

# Map each digit to its ASCII art representation
digits = {
    "0": "  000  \n 0   0 \n 0   0 \n 0   0 \n  000  \n",
    "1": "   1   \n  11   \n   1   \n   1   \n  111  \n",
    "2": "  222  \n 2   2 \n   2   \n  2    \n 22222 \n",
    "3": "  333  \n 3   3 \n   33  \n 3   3 \n  333  \n",
    "4": " 4   4 \n 4   4 \n 44444 \n    4  \n    4  \n",
    "5": " 55555 \n 5     \n 55555 \n     5 \n 55555 \n",
    "6": "  666  \n 6     \n 66666 \n 6   6 \n  666  \n",
    "7": " 77777 \n    7  \n   7   \n  7    \n 7     \n",
    "8": "  888  \n 8   8 \n  888  \n 8   8 \n  888  \n",
    "9": "  999  \n 9   9 \n  9999 \n     9 \n  999  \n",
    ":": "       \n   7   \n       \n   7   \n       \n",
    " ": "       \n       \n       \n       \n       \n",
    "A": "   A   \n  A A  \n AAAAA \n A   A \n A   A \n",
    "M": " M   M \n MM MM \n M M M \n M   M \n M   M \n",
    "P": "  PPP  \n P   P \n PPPP  \n P     \n P     \n",
}

def print_clock():
    # Clear the screen
    os.system('cls' if os.name == 'nt' else 'clear')

    # Get the current time
    current_time = time.strftime('%I:%M %p')

    # Format the time into the ASCII clock
    clock = ""
    for i in range(5):
        for ch in current_time:
            clock += digits[ch].split('\n')[i] + " "
        clock += "\n"

    # Print the clock
    print(clock)

while True:
    print_clock()
    time.sleep(1)

