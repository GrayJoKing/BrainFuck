A 705 byte brainfuck interpreter written in brainfuck
By Jo King: Updated 5/01/18
	Simulates negative cells and unbounded cells in both directions
	Exits when it executes a bracket with no matching bracket
	Reads code from input up to EOF or an exclamation mark with simulated input after the exclamation mark
Uses Wrapping/negative cells
Doesn't use negative cells
EOF = 0

Comments:
0 0 data 0 0 = Representation of the tape at that moment
: = Pointer is on this cell (eg 0 0: 0 pointer is on the second cell)
_ = This number is negative
! = Not (eg !0 means this cell is not 0)
? = This cell is unknown (usually input related)
* = This cell is repeated
x?y = This cell is either x or y
0: 0  0
or      = Two possibilities of the tape
!0 0: 0
"BF" = Stands for "brainfuck" (the name of the language)
"Navigate" = Move pointer to a certain cell
"Transfer" = Move a cell's value to anohter cell
"Bang" = exclamation mark (!)
"Instruction" = An instruction in the simulated code

Simulated Code Reference:
Assigns instructions in the following format
	1 = end loop
	2 = start loop
	3 = output
	4 = minus
	5 = comma
	6 = plus
	7 = left
	8 = right
	_1 = end of program
	Code is stored as:
		co 0 0 de _1 0
		The instruction to the right of the 0 0 is the current instruction


Part 1:
Gets code while ignoring anything that isn't a BF instruction and stops at either a bang or EOF

>>>,
[
	subtract 33 (ascii of bang)
	>(4++++)[-<(8--------)>]+<-
	0 0 code 0 0:  1
	or
	0 0 code 0 !0: 1
	[ If the input is not a bang
		(10----------)
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
		[right <-<+++++++>>+>>]<<
		(29++++[-<------>]+<+)
		[>]>
		[start loop <++<+>>>>]<<<
		--[>]>
		[end loop <<+>>>>]
		<<-<[+]<[>]>,>
		0 0 code 0 i 0:
	]
	<
]
ran out of input
0 0 code 0 0: 0 0
or
reached a bang
0 0 code 0: 0 1

>>[->]
0 0 code 0 0 0 0: 0 0
>+<<<<-

Tape is in the form:
	0 0 code _1 0 0 0 1 0

Part 2:
Executes the code

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
	These 4 are pretty self explanatory
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
		[>]>>,<<<[<]<
	]
	>-[<<]>
	[plus
		[>]>>+<<<[<]<
	]
	>-[<<]>
	[right
		Simulated tape looks like:
		 	a b c: d e f
		co 0 0 0 0 e:  _1 0 0 c 1 b 1 a 0 d 1 e 1 f
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
