# ASCII-terminal-clock
A Python script that displays an ASCII-style clock in the terminal

## How it works:
It imports the 'time' and 'os' from the system, clears the terminal, reads the current time, formats the time into ASCII with a given representation, and prints the clock, repeating every second to stay on track. 
- The script is also able to display seconds when edited. 
- to run 24h format the time should be set like that in the system

## Example:
![Screenshot from 2022-12-03 15-47-43](https://user-images.githubusercontent.com/79337611/205461513-df229965-a757-4745-bc54-78250fbef06b.png)

## Some challenges:
I found it challenging to implement the ability to display the clock in the middle of the terminal window (an upcoming feature) and create ASCII art of different sizes to have versatile sizes.

## Upcoming features
- Adaptive to window size
- Center on the window 
- Customizable colours (maybe also RGB puke)
- Other time zones
- Time and stopwatch
- User interface to change values of the features above

## File content:
- LICENSE
- README.md
- time2.py 

## how to install:
Dependencies:
- Python 3.10 (I haven't tested if it works on older versions)

Instructions:
- Download the file
- open file location in terminal
- enter the command 'Python time2.py' and press ENTER

## Credits:
Great thanks to OPENAI's chatGPT for proofreading the code and generating solutions
