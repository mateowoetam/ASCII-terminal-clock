#!/bin/bash

# Function to convert hex to RGB
hex_to_rgb() {
    hex=$1
    r=$((16#${hex:1:2}))
    g=$((16#${hex:3:2}))
    b=$((16#${hex:5:2}))
    echo "$r;$g;$b"
}


# Initial hex color
hex_color="#00ff00"  # Starting with red

# Convert the hex color to RGB
rgb_color=$(hex_to_rgb "$hex_color")

# Map each digit to its ASCII art representation
declare -A digits
digits["0"]="  000  \n 0   0 \n 0   0 \n 0   0 \n  000  \n"
digits["1"]="   1   \n  11   \n   1   \n   1   \n  111  \n"
digits["2"]="  222  \n 2   2 \n   2   \n  2    \n 22222 \n"
digits["3"]="  333  \n 3   3 \n   33  \n 3   3 \n  333  \n"
digits["4"]=" 4   4 \n 4   4 \n 44444 \n     4 \n     4 \n"
digits["5"]=" 55555 \n 5     \n 55555 \n     5 \n 55555 \n"
digits["6"]="  666  \n 6     \n 66666 \n 6   6 \n  666  \n"
digits["7"]=" 77777 \n    7  \n   7   \n  7    \n 7     \n"
digits["8"]="  888  \n 8   8 \n  888  \n 8   8 \n  888  \n"
digits["9"]="  999  \n 9   9 \n  9999 \n     9 \n  999  \n"
digits[":"]="       \n   7   \n       \n   7   \n       \n"
digits[" "]="       \n       \n       \n       \n       \n"
digits["A"]="   A   \n  A A  \n AAAAA \n A   A \n A   A \n"
digits["M"]=" M   M \n MM MM \n M M M \n M   M \n M   M \n"
digits["P"]="  PPP  \n P   P \n PPPP  \n P     \n P     \n"

print_clock() {
    # Clear the screen
    clear

    # Format the time into the ASCII clock with color
    for i in {1..5}; do
        line=""
        for ((j=0; j<${#current_time}; j++)); do
            ch="${current_time:j:1}"
            # Apply color to each line of the ASCII art
            colored_line=$(echo -e "${digits[$ch]}" | sed -n "${i}p")
            line+="\033[38;2;${rgb_color}m${colored_line}\033[0m "
        done
        echo -e "$line"
    done
}

# Initialize last_time with an empty string
last_time=""

while true; do
    # Get the current time
    current_time=$(date +"%I:%M %p")

    # Check if the time has changed
    if [ "$current_time" != "$last_time" ]; then
        # Update the display if time has changed
        print_clock
        last_time="$current_time"
    fi

    # Check every 0.1 seconds
    sleep 0.1
done
