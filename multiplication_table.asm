#program that allows you to display the multiplication table of a value entered by the user. The program asks the user for any integer value and asks him up to where, in the multiplication table of that value, he wants to display, that is, the index at which he wants to stop within the multiplication table of the entered value. This index of the multiplication table can also exceed the value 10. A check is performed to ensure that the 2 values ??read from the keyboard (the value whose multiplication table is to be displayed and the index of the multiplication table) are not negative.

.data 0x10000000
	string_value: .asciiz    "Enter the value you want to read from the multiplication table:  "
	string_multiple: .asciiz "Enter how far in the table of that value you want to display: "
	string_index: .asciiz "Enter the index of the multiplication table you want to stop at: "
	string_mult: .asciiz " * "
	string_return: .asciiz "\n"
	string_equal: .asciiz " = "
	string_finish: .asciiz "Done!"
	string_error: .asciiz "The entered value cannot be negative \n"

.text	0x00400000
.globl __start
	__start:
		#Prints the string string_value to the screen
		la $a0, string_value
		li $v0, 4
		syscall
		#Read an integer from the keyboard
		li $v0, 5
		syscall
		move $s0, $v0	#now $t0 contains the value whose table I want to display
		blez $s0, error
		#Print the string index_string to the screen
		la $a0, string_index
		li $v0, 4
		syscall
		#Read an integer from the keyboard
		li $v0, 5
		syscall
		move $s1, $v0	#now $t0 contains the multiplication table index
		blez $s1, error

	cycle:
		#print the value on the screen so that N*1, N*2, etc... is displayed
		move $a0, $s0
		li $v0, 1
		syscall
		#Print the multiplication sign on the screen
		la $a0, string_mult
		li $v0, 4
		syscall
		add $t0, $t0, 1		#$t0 contains the multiplication table index
		add $t1, $t1, $s0 	#$t1 contains the result of the multiplication
		#Print the multiplication table index on the screen
		move $a0, $t0
		li $v0, 1
		syscall
		#Prints the equal sign on the screen
		la $a0, string_equal
		li $v0, 4
		syscall
		#Print the result of the multiplication on the screen
		move $a0, $t1
		li $v0, 1
		syscall
		#Print on screen the fact of going to the next line
		la $a0, string_return
		li $v0, 4
		syscall
		beq $t0, $s1, finished
		j cycle
	error:
		#Print the string error string on the screen
		la $a0, string_error
		li $v0, 4
		syscall

	finished:
		#Prints the string finished_string to the screen
		la $a0, string_finish
		li $v0, 4
		syscall

					
