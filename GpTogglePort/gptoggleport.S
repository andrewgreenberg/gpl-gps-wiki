/*---------------------------------------------------------------------------\
| Project:	gptoggleport @ http://gps.psas.pdx.edu/
|
| File:		gptoggleport.S
|
| Description:	Toggles GPIO[7] on the GP4020. Meant to be loaded via the
|		GP4020's bootloader in ROM.
|
| Building:	Using the eCos toolchain:
|		arm-elf-gcc -c -mcpuarm7tdmi gptoggleport.S
|		arm-elf-objcopy --output-target binary gptoggleport.o gptoggleport.bin
|		Use a hexediter to insert '00 00 2c' (the length of the file in bytes)
|		to the beginning of the file.
|
|    Date    | Notes
|------------|------------------------------------------------------------
| 08/04/2003 | Further simplified to the most basic program
| 07/23/2003 | Created. Thanks to John Zaitseff
|            | <J.Zaitseff@unsw.edu.au> for creating the ARM assembly
|            | template! Note that we're using the C proprocessor, which is
|	     | why we get the nice '//' comments
\---------------------------------------------------------------------------*/

// -----------------------------------------------------------------------
// Constant values

	.equ	GPIO_DIRECTION_REGISTER1, 	0xE0000000
	.equ	GPIO_DIRECTION_REGISTER2,	0x00005000
	.equ	GPIO_READ_REGISTER_OFFSET,	0x00000004
	.equ	GPIO_WRITE_REGISTER_OFFSET,	0x00000008

// -----------------------------------------------------------------------
// Assembly-language preamble for the main module

	.text		// Executable code follows
	.code 32	// aka .arm - we're in ARM mode

// -----------------------------------------------------------------------

// Make GPIO[7] an output by loading 0b01111111 into the GPIO direction register

	mov	r0, #0b01111111
	mov	r1, #GPIO_DIRECTION_REGISTER1
	add	r1, r1, #GPIO_DIRECTION_REGISTER2
	str	r0, [r1]

 // Make r1 point to the write register and load r0 with the GPIO write register (to not mess w/the rest of the pins)

	add	r1, r1, #GPIO_WRITE_REGISTER_OFFSET
	ldr	r0, [r1]

// Loop forever, toggling GPIO[7] low and high (at ~ 1.5385MHz as measured on GPIO[7])

loop:
	and	r0, r0, #0b01111111	// Make GPIO[7] = 0
	str	r0, [r1]
	orr	r0, r0, #0b10000000	// Make GPIO[7] = 1
	str	r0, [r1]
	b	loop			// Infinite loop (of course!)

// -----------------------------------------------------------------------

	.end
