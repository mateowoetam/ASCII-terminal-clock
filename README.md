# ASCII-terminal-clock
A Python script that displays an ASCII-style clock in the terminal

## How it works:
It imports the 'time' and 'os' from the system, clears the terminal, reads the current time, formats the time into ASCII with a given representation, and prints the clock, repeating every second to stay on track. 

## Exmaple:
03:43 PM looks like this 

  000     333            4   4    333             PPP    M   M  
 0   0   3   3     7     4   4   3   3           P   P   MM MM  
 0   0     33            44444     33            PPPP    M M M  
 0   0   3   3     7        4    3   3           P       M   M  
  000     333               4     333            P       M   M  

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
