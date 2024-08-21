#!/bin/bash

# Function to convert hex to RGB
hex_to_rgb() {
    hex=$1
    r=$((16#${hex:1:2}))
    g=$((16#${hex:3:2}))
    b=$((16#${hex:5:2}))
    echo "$r;$g;$b"
}

# Function to print the ASCII clock
print_clock() {
    clear
    for i in {1..5}; do
        line=""
        for ((j=0; j<${#current_time}; j++)); do
            ch="${current_time:j:1}"
            colored_line=$(echo -e "${digits[$ch]}" | sed -n "${i}p")
            line+="\033[38;2;${rgb_color}m${colored_line}\033[0m "
        done
        echo -e "$line"
    done
}

# Function to display time in the selected time zone
display_time_in_timezone() {
    selected_timezone=$1
    system_time=$(date +"%I:%M %p")
    TZ=$selected_timezone date +"%I:%M %p"
}

# Function to start the clock mode
start_clock() {
    echo "If you are unsure about the time zone, please check the list of time zones in another terminal window."
    echo "You can do this by running 'timedatectl list-timezones'."
    echo "Would you like to continue and input the time zone now? (Yes/No)"
    read user_response

    if [[ "$user_response" =~ ^[Yy][Ee][Ss]$ ]]; then
        echo "Enter a time zone (e.g., America/New_York):"
        read selected_timezone

        last_time=""
        while true; do
            current_time=$(display_time_in_timezone "$selected_timezone")
            if [ "$current_time" != "$last_time" ]; then
                print_clock
                last_time="$current_time"
            fi
            sleep 1
        done
    else
        echo "Exiting the clock mode."
        exit 0
    fi
}

# Function to start the timer mode
start_timer() {
    echo "Enter timer duration (in seconds):"
    read timer_duration
    remaining_time=$timer_duration

    while [ $remaining_time -ge 0 ]; do
        # Format the remaining time as HH:MM:SS
        current_time=$(printf '%02d:%02d:%02d' $((remaining_time / 3600)) $(( (remaining_time % 3600) / 60)) $((remaining_time % 60)))
        print_clock
        sleep 1
        remaining_time=$((remaining_time - 1))
    done

    echo -e "\033[38;2;${rgb_color}mTimer finished!\033[0m"
}

# Function to start the stopwatch mode
start_stopwatch() {
    start_time=$(date +%s)  # Record the start time in seconds since epoch

    while true; do
        elapsed_time=$(( $(date +%s) - start_time ))  # Calculate elapsed time
        # Format the elapsed time as HH:MM:SS
        current_time=$(printf '%02d:%02d:%02d' $((elapsed_time / 3600)) $(( (elapsed_time % 3600) / 60)) $((elapsed_time % 60)))
        print_clock
        sleep 1
    done
}

# Starting prompt
echo "Enter a HEX color value (e.g., #00ff00):"
read hex_color

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

# Choose mode
echo "Choose a mode:"
echo "1. Clock"
echo "2. Timer"
echo "3. Stopwatch"
read mode_choice

case $mode_choice in
    1)
        start_clock
        ;;
    2)
        start_timer
        ;;
    3)
        start_stopwatch
        ;;
    *)
        echo "Invalid choice, exiting."
        ;;
esac
