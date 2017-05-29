Rule 30 generator
By Jo King
Input number of lines
Assumes non wrapping and non negative
Uses 2x plus 7 cells where x is the number of rows

The tape looks like this:
32 N 0 1 1 0 0 record 0

N is the number of rows being printed
Record is the state of the world

gets an inputted multidigit number and stores it in one cell as N
>>,
[
	>(6++++++)[-<(8--------)>]<
	<[-<+>]<[->(10++++++++++)<]
	>>[-<+>],
]
creates " " char so it can be recycled rather than created over and over again
(8++++++++)[-<<(4++++)>>]

creates the initial record (a single 1)
>+>+>>>++<<<<<<
[
	decrement N
	print N minus 1 spaces
	-[<.>>+<-]>+[-<+>]

	prepare to print out the record
	>>>(6++++++)[->(8++++++++)<]>->
	[
		[-<+<+>>]<.<[->->+<<]>>[-<<+>>]<[->+<]>>
	]
	(10++++++++++).[-]<[-]+<+<
	[
		>>-[->>+<]<
		[-[>+>>+<<<-]>+[-<+>]]
		>>+<<<<-[>>>+++>[-<->]<[->+<]<+<<-]
		>>+[-<<+>>]<<<
	]
	<-
]

not necessary but nice for cleanup
>>->->>>[>]<[[-]<]<<<<<<[-]
ends on cell 0 with all other cells being 0
