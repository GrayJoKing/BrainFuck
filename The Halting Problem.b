4367 byte proof of the unsolvability of the Halting Problem using brainfuck
By Jo King: updated 05/01/18
[
Imagine a program called "F" written in a Turing complete language that, when given a program in the same language, returns TRUE if the program halts and FALSE if the program runs forever.

To call this program with a program called "G", we refer to it as F(G).

The paradox here is thus:
Imagine a program "H" that, when given F will halt if F returns FALSE and run infinitely if F returns TRUE. That is, H(F(G)) will halt if G runs forever and otherwise run forever. H inverts the final state of G.

However, what happens if we replace G with our inverting program H? That is, H(F(H))? If H runs forever, than F will return FALSE, and H will halt. If H halts, than F will return TRUE, and H will run forever.

This is a contradiction and the program F cannot exist.

However the H program has to be extremely complicated. First it must take F and interpret it. This requires elements of a self-interpreter, a program that can execute other programs of the same language. Second, it must feed its own source code into F. This requires elements of a "quine", a program that can produce its own source code.

The below brainfuck program is a an example of a H program. Brainfuck is a Turing complete language (to-do: add link to cyclic tag proof), so can be used to simulate anything given enough memory and time. Brainfuck is a simple language, with only 8 commands, which means self-interpreters are easier to write. The smallest self-interpreter that I am aware of, is a (460?) byte self-interpreter that exists here (todo: add link to self-interpreter paper). Quines are comparitively harder, due to brainfuck's tape data storage, and tend to get exponentially longer as the program itself gets longer.


]


- Marker

>++>++++>+>++>+++>>++++>>++++>>+++>>++++>>+++>>++>++>++>++>++>++>++>++>++>++>++++>+++++>+>++>++>++>++>++>++>>+++>+>++>++>++++>+>+++>+>++++>+>+++>+>++>>>+++++>++++>++++>>+++>>++++>>+++>>++>++>++>++>++>++>++>++++>+++++>+>++>++>++>++>++>++>>+++>+>++>++++>+>+++>+>++++>+>+++>+>++>>>+++++>+++>>+++>+>+++++>+++++>++++>>++>+>++>++>++>++>++>++>+++>>++>++>>++++>>+++>++>++>++>++>++>++++>+++++>>++>++>++>+>+++>>++++>>++>++>++>>++>++>++>>++>++>++>>++>++>++>++>++>++>>++>++>++>++>++>++>>++>++>++>>++>++>++>++>>++>++>++>++>++++>+>+++>>+++++>+++>>++>>+++++>>>++>>++>++>++>>+++++>+++++>>>++>++>++++>+>+++>+>+>++++>+>+++>+>+>++++>+>+++>>++++>++++>++++>>+++>>>++++>>+++>>>++++>>+++>+>++++>+++++>>>++>+>+>+++>+>++++>+>+++>+>+>++++>+>+++>+>+>++++>+>+++>>+++++>+++>>++++>>+++>>>++++>>+++>>>++++>>+++>>>++++>+++++>+>+>++>++++>+>+++>+>++>>>++++>>+++>>+++>+>+>++++>++++>+++++>>++>+>+++>+>+++>>>++++>>+++>>++++>++++>+++++>+>++>>+++>>+++>+>+>++++>+>+++>+>+>++++>+>+++>+>+>++++>+>+++>>+++>>>>++++>>+++>>>++++>>+++>+>++++>++++>+++++>+++>+>+++>>>>++++++>++++>>++>++>++>++>++>++>++>++++>+>+++++>+++++>+++++>+++++>+++++>+++++>>+++++>+++>++>+>+++++>++++>>+++>>++++>+>++>+>++>>>>>+++>+>+>+>+++++>++++>>+++>>++++>+>++>+>++>>>>>+++>+>+>+>+++++>++++>>+++>>++++>+>++>+>++>>>>>+++>+>+>+>+++++>++++>>+++>>++++>+>+++++>+>++>++>++>>>>>+++>+>+>+>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>+++++>++++>>+++>>++++>+>++>++>+>++>>>>>+++>+>+>+>+++++>+++++>++++>>+++>>++++>+>+++++>+>++>++>++>++>++>++>++>>>>>+++>+>+>++>++>++>++>++++>+++++>+>+++++>+++++>+++++>+++++>+++++>+++++>>+++>++>+>++>++++>>+++>>++++>+>++>++>+>++>>>>>+++>+>+>+>+++++>+++++>++++>>+++>>++++>+>+++++>+>++>>>>>+++>+>+>+++++>+>++++>++>+++>+>++++>>+++>>++++++>+++>>>>++>+>+>+>+>+++++>++++>+>+++>>++++>+++++>++++>+>+>+++>>++++>+>++>++++>>+++>>>++++>+>+++>+>+>++++>>>++>++++>+>+>++++>+>+++>+>+>+++++>++++>>>+++>+>++++>>>>>++++>>+++>>++>+>+>++++>+>+++>+>+++>+>+++++>++++>>>+++>+>++++>>>>>++++>>+++>>+++++>+>+>++++>+>+++>+>+++>+>++>++>++++>+++++>>>++>+>+>+++>>>++++>>+++>>+++>+>+++>+>++++>+>+++>>+++++>+>+++>>+++++>++++>+>+>+++>>++++>+>++>++>++++>>+++>>>++++>+>+>+++>>++++>+>+>++>++++>+>+>++++>+>+++>>++++>+++++>+>+>++>>>+++>>+++++>+++++>++++>+>+>+++>>++++>++++>>+++>>++>+>+>++++>+>+++>+>+++>>++>++++>+>+>+++>>++++>++++>>+++>>+++++>+>+>++++>+>+++>+>+++>>++>++++>>+++>>+++>+++>+>+>++++>+>+++>>+++++>+++++>+>+++>>+++++>++++>+>+>+++>>++++>++++>>+++>>>+++++++>+>+>+>++++>+>+++>+>+++>>+++++>++++>+>+>+++>>++++>++++>>+++>>>+++++>+>+>+>++++>+>+++>+>+++>>+++++>++++>+>+>+++>>++++>++++>>+++>>>++++++>+>+>+>++++>+>+++>+>+>+>++++>+>+++>+>++++>+>+++>>++++>++++>>+++>>++++>>+++>>>>++++>>+++>>>++>+>+>+>++++>+>+++>+>+>+>++++>+>+++>+>++++>+>+++>>+++++>+++>>++++>>+++>>++++>>+++>>>++++>+>+++>+>+++>>+++++>++++>+>+>+++>>++++>++++>>+++>>>++>+>+>+>++++>+>+++>+>+++>>+++++>++++>+>+>+++>>++++>++++>>+++>>>>++++>>>+++>>++++>+>+>+>++++>+>+>+++>+>++>>>>++++>>>+++>>+++++>+++>>++++>+++++>+++>+>+>++>++++>+>++++>+++++>>>++>+>+>+++>+>+++>+>++++>+++++>>>++>+>+>+++>+>++++>+>+++>+>+++>>+++++>++++>+>+>+++>>++++>++++>>+++>>++>++>++++>+++++>+++++>>++++>+++++>+>+>++>>>+++>>+++>++>+>+>+++++>++++>++>++>+>+>+++>+>++++>+++++>>>>++++>>>+++>>++>+>+>+>++++>+>+>+++>+>+++>+>++++>+>+++>+>+++>+>++>++>++>++>++>++>++>++>>>++++>++>+>+>+++++>>>+++>>+++>>>++++>+++

(subtract one from last sequence)

+[<+]>

[
	Add a right arrow
	>[>]>[>]>(10++++++++++)[-<(6++++++)>]<++[<]<[<]
	<+>>-
	Add the right amount of pluses
	[
		[>]>[>]>(7+++++++)[-<(6++++++)>]<+[<]<[<]<+>>-
	]
	>
]
Add the beginning minus
<--[>+<++++++]>++

Initialises the 8 characters of brainfuck
>[>]+++++[->+++<]>[>+++>+++>+++>++++++>++++++>+++>++++>++++[<]>-]
>+>->>+>+++>-->>++[<]<<[<]<<[<]>

Tape looks like:
data 0 0 0 code 0 0 characters

Runs through each plus destructively and adds the represented symbol to the code section
[
	[
	    For each plus in this cell
			Shift the gap in the characters over one
		[>]>>[>]>>[>]<[->>+<<]
		<[<]<<[<]<<[<]>-
	]
	Navigate to character
	>[>]>>[>]>>[>]>>
	Copy the character to the end of the code section
	[-<<+[<]<+>>[>]>]

	Shift the symbol section over one
	<<[[->+<]<]
	>>[>]>[[-<+>]>]

	Navigate to next plus
	<<[<]<<[<]<<[<]>
]

0: 0 0 code 0 0 symbols

8  7  6  5  4  3  2  1
46 44 45 91 93 43 60 62

>>>[>]>>[>]<[[-]<]

code 0 0:

	1 = end loop
	2 = start loop
	3 = output
	4 = minus
	5 = input
	6 = plus
	7 = right
	8 = left
	9 1 = end of program

in form
0 0 i n s t r u c t i o n s e t c 9 1 0

>>>,
[
	>(7+++++++)[<(6------)>-]+<-
	[>]>
	[plus <+<+>>>>]<<<
	-[>]>
	[comma <+<+>>>>]<<<
	-[>]>
	[minus <+<+>>>>]<<<
	-[>]>
	[dot <-<+++>>>>]<<<
	(14--------------)[>]>
	[left <++<+>>>>]<<<
	--[>]>
	[right <-<+++++++>>>>]<<
	(29++++[-<------>]+<+)
	[>]>
	[start loop <++<+>>>>]<<<
	--[>]>
	[end loop <-<+>>>>]<<
	-<[+]<[>]>,
]

initialise the cells in the form

0 0 0 code _1 0 0 0 1 0

>>>+<<<<-

[<]>
[
	-[<<]>
	[end loop
		co 0 0 0 e:  _1 0 0 0 1 ?
		Check if current cell is one
		<+[>]>>[<]<<
		co 0 0 1 e _1: 0 0 !0 1
		or
		co 0 0 1 e _1 0: 0 0 1
		[ If current cell is one navigate to corresponding start loop
			Create counter
			>>+
			[
				co 0 0 de _1 0 c: !0 1
				checks if next instruction is an end loop
				<<[<]<<-
				[>>]<
				c !0 0: 0 de _1 0 c !0 1
				or
				c: 0 0  0 de _1 0 c !0 1
				[>>>>[>]>+<<[<]<] Add one to counter if it is
				checks if start loop
				<-[>>]<
				c !0 0: 0 de _1 0 c !0 1
				or
				c: 0 0  0 de _1 0 c !0 1
				[>>>>[>]>-<<[<]<] Subtract one from counter if it is
				c ? 0: 0 de _1 0 c !0 1
				Adds two to counteract checks and move to the next instruction
				<++[->>+<<]
				>>[>]>
				c 0 0 ode _1 0 c: !0 1
				End on the counter
					If the counter is 0 then we have reached the corresponding bracket
			]
			c 0 0 2 de _1 0 0: !0 1 0
			<
		]
		c 0 0 1?2 de _1 0: 0 0 1 0
		Subtract one from current instruction
			This executes the start loop code next but that does nothing
		<[<]>-<
	]
	>-[<<]>
	[start loop
		c 0 0 0 de:  _1 0 0 ? 1
		<++[>]>>[<<]>
		c 0 0 2 de _1 0 0 0 1:
		or
		c 0 0 2 de _1 0 0: !0 1
		[ If current cell is 0 navigate to corresponding end loop
			Initialise counter
			<<+
			c 0 0 ode _1 0 c: 0 1
			[ While counter is not 0
				Transfer current instruction over (first instruction is guaranteed to be start loop)
				<<[<]>[-<<+>>]>
				co 0 0 de _1 0 c: 0 1
				Check if start loop
				--[<<]>
				co 0 0: !0 e _1 0 c 0 1
				or
				co 0 0 0 e _1 0 c 0 1
				[[>]>+<<[<]<] Add one to counter if so
				checks if end loop
				>+[<<]>
				co 0 0: !0 e _1 0 c 0 1
				or
				co 0 0 0 e:  _1 0 c 0 1
				[[>]>-<<[<]<] Subtract one from counter if so
				Add one to counteract checks and navigate to counter
				>+[>]>
				co 0 0 de _1 0 c: 0 1
				End on counter
					If counter is 0 then we have reached the corresponding end loop
			]
			co 0 1 e _1 0 0: 0 1
		]
		co 0 0 2?1 e _1 0 0: ? 1
		Subtract two from the current instruction to bring it back up to the right value
		<<[<]>--<
	]
	3 of these are pretty self explanatory
	Navigate to the current cell and execute the instruction on it
	>-[<<]>
	[output
		[>]>>.<<<[<]<
	]
	>-[<<]>
	[minus
		[>]>>-<<<[<]<
	]
	>-[<<]>
	[input
		Reset current cell
		[>]>>, (no more input so this is set to 0)
		co 0 0 0 e:  _1 0 0 0: 1 b 1 a 0 d 1 e 1 f
		Navigate to start of code section
		<<<[<]<<<[<]<[<]>
		d: ata 0 co 0 0 0 e _1 0 0 0 1 b
		or
		0: co 0 0 0 e _1
		Transfer next instruction to current cell
		[[>]>[>]>>>[>]>>+<<<[<]<<<[<]<[<]>-]
		0: ata 0 co 0 0 0 e _1 0 0 d 1 b
		or
		0: co 0 0 0 e _1
		Navigate back to the normal spot
		>[>]>[>]>>[<]<
	]
	>-[<<]>
	[plus
		[>]>>+<<<[<]<
	]
	>-[<<]>
	[right
		Simulated tape looks like:
		 	a b c: d e f
		co 0 0 0 e:  _1 0 0 c 1 b 1 a 0 d 1 e 1 f
		Navigate to value of cell to the right
		[>]>>>[>>]>
		co 0 0 0 e _1 0 0 c 1 b 1 a 0 d: 1 e 1 f
		Transfer it to temporary cell
		[<<<[<<]<+>>>[>>]>-]
		co 0 0 0 e _1 d 0 c 1 b 1 a 0 0: 1 e 1 f
		Pop extra marker if it exists from the right cells and add one to the left
		>[-]<<+
		co 0 0 0 e _1 d 0 c 1 b 1 a 1: 0 0 e 1 f
		Transfer all left cells over 2 cells
		[<[->>+<<]<]<[->>+<<]
		co 0 0 0 e _1 0: 0 d 1 c 1 b 1: a 0 e 1 f
		Navigate back to normal spot
		<[<]<
	]
	>-[<<]>
	[left
		Simulated tape looks like:
		 	a b c: d e f
		co 0 0 0: e _1 0 0 c 1 b 1 a 0 d 1 e 1 f
		Add temporary marker
		[>]>++
		co 0 0 0 e _1 0 2: c 1 b 1 a 0 d 1 e 1 f
		Remove temporary marker and transfer all left cells over two
		[-->[-<<+>>]>]
		co 0 0 0 e _1 c 0 b _1 a _1 0 0: d 1 e 1 f
		Add marker to right cells remove marker from left cells and reset left cell's markers
		+<<-[++<<]<
		co 0 0 0 e _1 c: 0 b 1 a 0 0 1 d 1 e 1 f
		Transfer current cell to to right cells
		[->>>[>>]>+<<<[<<]<]
		co 0 0 0 e _1 0: 0 b 1 a 0 c 1 d 1 e 1 f
		Navigate back to normal spot
		<[<]<
	]
	Add 8 to reverse checks
	<(8++++++++)>>

	Execute next instruction
	[+<<->>]>
]

Move to current cell and start infinite loop
>>[]
