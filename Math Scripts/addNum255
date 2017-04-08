Adds all inputted one digit numbers and outputs them in base 10
Has a maximum of 255

Gets first number and puts it in cell 2
>,

[
	Deletes 48 from the number
	(48------------------------------------------------)
	Adds it to cell 1
	[-<+>]
	Gets next number and puts it into cell 2
	,
]
Moves to cell 1
<

This calculates the base 10 equivalent to the value of a single cell
This is in the format:
	Quotient Number Modulo 1 0 0 Start of output

[
	Sets the Modulo to 10 and the 1constant to 1
	>>(10++++++++++)>+<<<
	Moves Quotient to Number (note that the original number starts off in the Quotient slot)
  [->+<]>
  [
		Deletes one from both Number and Modulo
		->-
		Splits the pointer by moving it to the 1constant if the Modulo is 0
			and the second 0 if the Modulo is not 0
		[>]>
		If the pointer is on the 1constant reset the Modulo
			add 1 to the Quotient
			move the pointer to the second 0
		[<(10++++++++++)<<+>>>>>]
		Move the pointer back to the Quotient
		<<<<
	]
	Moves to Start of the output
  >>>>>
	Moves to the next available slot and adds 11
	[>](11+++++++++++)
	Moves back to the Modulo
	[<]<<<
	Subtracts the Modulo from the 11
  [->>>>[>]<-[<]<<<]
	Moves the pointer back to the Quotient
  <<
]
Moves the pointer to the end of the output
>>>>>>[>]<
Outputs each number
[
	>(47+++++++++++++++++++++++++++++++++++++++++++++++)
  <[->+<]>.<<
]
