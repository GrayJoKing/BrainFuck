A brainfuck interpreter written in brainfuck
By Jo King 27/4/17
	Simulates negative cells and unbounded cells in both directions
	Exits when it executes a bracket with no match
	Reads code from input up to EOF or an exclamation mark with simulated input after the exclamation mark
Wrapping cells
Doesn't use negative cells

Reference:
Assigns instructions in the following format (not the most efficient I know)
	1 = minus
	2 = plus
	3 = left
	4 = right
	5 = start loop
	6 = end loop
	7 = input
	8 = output
	9 1 = end of program

Gets code ignoring anything that isn't a special char and stops at either an exclamation mark or EOF

in form
0 0 i n s t r u c t i o n s e t c 9 1 0

>>,
[
	subtract 33
	>(4++++)[-<(8--------)>]-<-
	[
		(10----------)
		[>]>
		[plus <++>>+>>]<<<
		-[>]>
		[comma <+++++++>>+>>]<<<
		-[>]>
		[minus <+>>+>>]<<<
		-[>]>
		[dot <++++++++>>+>>]<<<
		(14--------------)[>]>
		[left <+++>>+>>]<<<
		--[>]>
		[right <++++>>+>>]<
		(29+++++[-<<------>>]<<+)
		[>]>
		[start loop <+++++>>+>>]<<<
		--[>]>
		[end loop <++++++>>+>>]<<

		[-]<[+],>
	]
	>[[+]>]<<
]
(9+++++++++)>+

initialise the cells in the form

9 1 0 0 0 1 0

>>>>+<<<<<
[<]>
[
	-[<<]>
	[minus
		[>]>>>>-<<<<<[<]<
	]
	>-[<<]>
	[plus
		[>]>>>>+<<<<<[<]<
	]
	>-[<<]>
	[left
		[>]>>>[>>]>
		[
			->
			[-<<<<[<<]>+>[>>]>>]<
		]
		<+
		[<[->>+<<]<]
		<<[<]<
	]
	>-[<<]>
	[right
		[>]>>>
		[>[-<<+>>]>]
		<+<-<<[<<]>
		[->[>>]>>+<<<<[<<]>]
		>[<<]>
		[
			[>>]+
			[<[->>+<<]<]
			>+>-<<
		]
		<<<[<]<
	]
	>-[<<]>
	[start loop
		[>]>>>>[<]<<<[<]<<
		[
			[<]<<
			(5+++++)
			>>>
			[
				checks if start loop
				(5-----)
				[<<]>
				[[>]>+<<[<]<]
				checks if end loop
				>-[<<]>
				[
					[>]>
					[-<<[<]<<]
					>
				]
				<<
				[>>>(6++++++)[-<<+>>]]
				>
			]
			<<[<]>[<+<<]
		]
		>
	]
	>-[<<]>
	[end loop
		<->[>]>>>>[<]<<<
		[
			[<]>(7+++++++)<<<
			[
				checks if end loop
				(6------)
				[>>]<
				[
					add one to marker
					>>>>[>]>+<<[<]<
				]
				<
				checks if start loop
				+[>>]<
				[
					>>>>[>]>
					if marker not 0
					[->]<<
					if marker is 0
					[>>>]<[<]<
				]
				>>
				[<<<(5+++++)[->>+<<]]<
			]
			<<[<]--[>]>
		]
		<<[<]>+<
	]
	>-[<<]>
	[input
		[>]>>>>,<<<<<[<]<
	]
	>-[<<]>
	[output
		[>]>>>>.<<<<<[<]<
	]
	>-[<<]>
	[end-]
	<(9+++++++++)>>
	[+<<->>]>

]
