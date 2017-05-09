A brainfuck program that solves an inputted size Hanoi Tower
By Jo King
Non wrapping non negative cells
Input a multi digit number up to your cell size
Needs 5x plus 22 cells where x is the size of the tower
WARNING:
	Just like the Hanoi Tower this program will increase the number of instructions at a exponential rate
	A tower of size 10 takes 21 million instructions

Plan (note: this plan changed a lot in implementation)
N = Inputted number

space:
0 0
record:
(N spaces showing the positions of the pieces in binary notation where 2=0 1=1)
recordTemp:
0 0 (temp places for record to be)
gap:
0
N:
N (permanent)
greaterTotal:
(counter for the amount of disks on top of the next larger disk)
diskCounter:
(Counter for size of current disk (initially N))
gap2:
0 0 0
currentdisk:
1/2/3
diskBuffer:
(0 0 0 Markers showing what position to place the next disk in based on currentdisk)
output:
(repeated sections of 0 n n n where the ns represent the disk in this location)
printer
0 0 " "/"#" N 0

move to cell 3
get input
simplify to one cell (now N)
create N many cells to the right (now record)
count how many cells by moving record one to the left (recreates N at right side)
move N into position

start loop
	Go to end of record
	check value and move it to end of recordTemp
	if it's 1
		add N%2 plus 1 to currentdisk
		add N%2 plus 1 to base
	add one to currentdisk
	add one to base
	add one to pileCounter
	Duplicate N to gap and diskCounter
		Move gap back to N
	spread currentdisk over diskBuffer
	duplicate diskCounter to gap2 and 3 spaces over from whatever is marked in diskBuffer
		move gap2 back to diskCounter and decrement it
		remove marker from diskBuffer
		move currentdisk back from gap2
	move to diskCounter
	start loop
		move to end of record
		check if this bit doesn't match the previous bit
			add them together and subtract two
				if this is not 0 subtract one
					if this is 1 then they do not match
		if so:
			check if pileCounter is 1 or 2
			if 1
				add one to currentdisk
				if currentdisk is 4
					set to 1
			if 2
				subtract one from currentdisk
				if currentdisk is 0:
					add 3
		spread currentdisk over diskBuffer
			move gap2 back to currentdisk
		check if base = currentdisk
		if so
			subtract one from pileCounter
			if pilecounter is 0
				add 2 to pilecounter

		duplicate diskCounter to gap2 and whatever is marked in diskBuffer
			move gap2 back to diskCounter and decrement it
			reset diskBuffer
		end on diskCounter
	end loop

	move record left two spaces
	reset base diskCounter pileCounter currentdisk
	set start of output to 1
	create printer
		put 1 at end of input
		create " " at end of output
		duplicate N to end of output
	put pointer on start of right most output
	add one
	start loop
		subtract 1
		add one each of the 3 cells to the right
		move pointer to rightmost cell of those 3
		start loop
			print " "
			subtract this from N (keeping a copy of both N and the cell)
			print (result minus 1) many " "s
			print the cell number of "#"s
			print (result minus 1) many " "s
			remove result
			remove cell
			move " " and N over one to the left
			move left one from the start loop cell
		end loop
		move 4 over
		if this cell is 0
			add one
		else
			subtract one
	end loop
	delete printer
	add one to record
	if record overflows
		exit loop
	else
		move to N
end loop

START OF ACTUAL PROGRAM

get input
simplify to one cell (now N)
>,
[
	<(6++++++)[->(8--------)<]>
	>[->(10++++++++++)<]>[-<+>]
	<<[->+<],
]

create N many cells to the right (now record)
>[[>]+[<]>-]

count how many cells by moving record one to the left (recreates N at right side)
>[<[->+<]++>>]

move N into position
<[->>>+<<<]>>>

start loop
[

	Go to end of record
	<<+<<

	check value and move it to end of recordTemp
	-[->>+<]>>
	if it's 1
	[
		add N%2 to currentdisk and greaterTotal
		>>>++<[<+>>-[>>]<[>++>]<<-]<[->+<]>>[->+<]+<<
	]
	>>>
	add one to currentdisk and move into position
	+[->>>>+<<<<]
	Duplicate N to diskCounter
	<<[-<+>>>+<<]<[->+<]

	>>+>>>>>

	spread currentdisk over diskBuffer
	[[>]+[<]>-]

	duplicate diskCounter to gap2 and 4 spaces over from whatever is marked in diskBuffer
	<<<<+
	[
		->+>>>>[>]>>>+<<<<[<]<<<<
	]
	Decrement diskCounter (and move it back into place)
	>--[-<+>]

	condense marker from diskBuffer back into currentdisk
	>>>>[>]<
	[>[-<+>]<<]>[-<+>]

	move to diskCounter
	<<<<<
	start loop
	[
		move to end of record
		<<<<[<]>
		check if this bit doesn't match the previous bit
		to do so
			add them together and subtract two
			[-<+<+>>]<[->+<]
			<<[->+>+<<]>--
			if it's 1 then they do not match (0 or 2 is matching)
			[-<+>[-<->]]<
		if so:
		[

			->>[>]>
			add N and greaterCounter
			[-<+>>>>+<<<]>[-<+>>>+<<]
			<+[->+<]<[->+<]
			>[>]

			get modulo 2
			++<[>-[>]>>[<<++>>>]<<<<-]
			+>-
			if it's 0
			[
				-<->+>>
				subtract one from currentdisk
				-
				if currentdisk is 0:
				[>]<<
					add 3
					[>>+++<]
				<-
			]
			<
			if 1
			[
				add one to currentdisk
				->>++++>+
				check if currentdisk is 4
				[-<->]
				++++<[-<+>>-<]+<[[-]>-<]>
				if so
				[
					set currentdisk to 1
					->---
					<
				]
				<<
			]
			<<<<<[<]<
		]
		>>[>]>>+>>>>>

		spread currentdisk over diskBuffer
		[[>]+[<]>-]
		>[>]<[>>>>]+[<<<<]>>>[<]
		duplicate diskCounter to gap2 and whatever is marked in diskBuffer
		<<<<[>>>>+[>]<[>>>>]<<<<+[<<<<]>>>[<]<<<-]

		move diskCounter back and decrement
		>>>>-[-<<<<+>>>>]

		condense marker from diskBuffer back into currentdisk
		>[>]<
		[>[-<+>]<<]>[-<+>]


		end on diskCounter
		<<<<<
	]

	<[-]<
	copy N to end of input
		copy N over
		[->+>>>>>>>>>>[>>>>]>[>>>>]>[>>>>]<<<+<[<<<<]<[<<<<]<[<<<<]<<<<<<<]
		>[-<+>]
	set start of output to 1
	>>>>>>>>>
	move to end of output
	>[>>>>]>[>>>>]>[>>>>]>
	create " " at end of output
	(8++++++++)[-<(4++++)>]<<<<[->>+<<]
	put pointer on end of output
	add one
	<<<<+
	start loop
	[
		subtract 1
		-
		now we print out the disks
		>+>+>+
		[
			[>]>>[->>+>++<<<]>>[-<<+>>]>-<<<<<<[<]>-
			if the cell is positive
			[
				move the cell over some
				-[[>]>++>>>++[<]<[<]>-]
				subtract this from 2N
				>[>]>>>>-[->-<]>[--<+>>+<]>[-<+>]
				print (result) many " "s
				<<[-<.>]
				print the cell number of "#"s
				<+++<<-[->>.<<]>>---
				<<<<[<]
			]
			print (result or N) many " "s
			>[>]>>>>>+[-<<.>>]
			<<<<<<[<]>
		]
		move N and " " over 4
		>>[-<<<<+>>>>]>[-]<<<<

		print newline
		(10++++++++++).
		>(7+++++++)[-<(3+++)>]<+

		if the end of the output is 1 then end the loop else keep going
		<<<+<<<<[[-]>>>>-<<<<]>>>>[-<<<<+>>>>]<<<<
	]
	delete printer
	>>>>>>[-]>[-]

	print new line
	(10++++++++++).[-]

	move to record
	(15<<<<<<<<<<<<<<<)[<]>

	move record left two spaces
	[[-<<+>>]>]

	add one to record
	<<<[<]>[-[>](2++)>]
	<[-]>>>
	if record overflows
		exit loop
	else
		move to N
]

not necessary but for cleanup
>[-]<<<<<[[-]<]<

Ends at cell 0 with every cell = 0
