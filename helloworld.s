# Purpose: Print "Hello world!" into STDOUT.
#
# Input: None
#
# Output: A string
#
#
.section .data

# define the string
string:
.ascii "Hello world!\n"

# find the end of the string
string_end:
.equ string_len, string_end - string

### CONSTANTS ###
.equ WRITE, 4
.equ EXIT, 1

# FILE DESCRIPTORS
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2

.equ LINUX_SYSCALL, 0x80
### END CONSTANTS ###

.section .text
.globl _start
_start:

movl $WRITE, %eax
movl $STDOUT, %ebx
movl $string, %ecx
movl $string_len, %edx
int $LINUX_SYSCALL 

# end
movl $EXIT, %eax
movl $0, %ebx
int $LINUX_SYSCALL
