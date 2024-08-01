CSc 330 Final Readme:

Ian Weber
V00924748


APLforth:

Appreciation and thanks are to be passed to APLcart and Rosettacode, without which I would have struggled tremendously. Unironic thanks to Wikipedia of all places, as it turns out that their article on APL Syntax and Symbols is very good.

The logic of this program is likely better implemented in a functional or compiled language, but ambition drew me to APL. The keystroke efficiency of APL is unmatched, at least in theory. In practice, digging out a glyph was typically a process of "ALT-TAB CTRL-F [enter input in wikipedia's APL Syntax and Symbols page] CTRL-C ALT-TAB CTRL-V", which is still quicker than writing a foreach loop.

RUNNING THE INTERPRETER:
	Unfortunately, Dyalog insists on inputs being below a certain size threshold, and the current version of the interpreter exceeds that. Copy up to the line ⍝END FIRST CUT HERE
	and paste that into Dyalog. After that, copy the rest of the file and paste it. APLForth is then ready to go.

Problems:
	- APL syntax is still a journey, and I've developed an enmity towards Dyalog. The maximum input length is inconvenient, because my code is heavily commented and those apparently count against the input length. Some might argue that I shouldn't be filling my final project up with quotes from a horror writer active almost a century ago, and regrettably I don't have a counterargument I feel solid about.
	- If there was an APL IDE with a level of user-friendliness equal to Visual Studio (<3), I'd probably have had a much better time, but Dyalog is the path I've had to walk. All whining aside, being able to rapidly prototype is quite convenient, but the hybridization of CLI, word document, and GUI took some getting used to.
	- Dyalog just crashed, apparently it has a cap on data.
	- I tried installing GNU APL on WSL, but that went nowhere, and my linux isn't quite at the level to figure out why. After seeing that GNU APL would not be how this project is evaluated, I opted to quit that disastrous attempt.

The basic program flow is as follows:

	The user enters in a series of words separated by whitespace. (works as of now)
	The interpreter splits each token on whitespace into an array. (works as of now)
	The interpreter then determines the type of the token, and there are four salient types that I've identified.
	If it is a number, it is put on top of the stack.
	If it is an entry in the FORTH dictionary, that function is called. (works as of now, apart from the side effect of spitting a bunch of zeroes as output)
	If it is an operator, then the matching function in the FORTH dictionary is also called.
	If the token array is empty, we print 'ok' and return control to the user.

Known issues:

	There are multiple Known Issues in the FORTH interpreter, none of which I believe are hugely relevant. The first is that, due to how strings are processed, it is impossible to maintain adjacent whitespace in strings. I considered this to be a largely irrelevant issue and offered up a shard of completeness on the altar of maintaining my sanity. In all honesty, I consider this sacrifice to be a benefit, as it eliminates typos which some might find distracting or frustrating.

	APLForth exits gracefully by calling a function that has a syntax error. I was informed that QUADSTOP ended all processes and threads in the program, and it does so the same way that a wall arrests the momentum of a moving vehicle.

	Function implementation is partially complete. Functions are defined but not every token is recognized properly. 

Piet bonus problem:

The attached file "ianpiet.png" was created with the help of the Piet Assembler and Compiler at https://github.com/sl236/Piet. The source code fed to the compiler is as follows:

main()
{
  asm{ @"Ian Weber\n" }
}