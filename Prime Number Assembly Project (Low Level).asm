# Prime Number Checker Assembly Project (Mips Assemply)
#  Student: Mohamed Tamer Mohamed Elsheikh
#  Section: 19

#  DATA SEGMENT  –  all variables / strings stored in memory:
.data

    # storing full name and section number
    full_name:       .asciiz  "Mohamed Tamer Mohamed Elsheikh"
    section_num:     .asciiz  "Section: 19"

    # Labels for the name-initials display:
    header_info:     .asciiz  "\n=== Student Information ===\n"
    lbl_name:        .asciiz  "Name    : Mohamed Tamer Mohamed Elsheikh\n"
    lbl_section:     .asciiz  "Section : 19\n"
    header_init:     .asciiz  "\nFirst character of each name:\n"
    separator:       .asciiz  " : "
    newline:         .asciiz  "\n"
    divider:         .asciiz  "===========================\n"

    # Prime-checker messages:
    prompt_msg:      .asciiz  "\nEnter an integer: "
    prime_msg:       .asciiz  " is a PRIME number.\n"
    not_prime_msg:   .asciiz  " is NOT a prime number.\n"

#  TEXT SEGMENT  –  executable instructions:
.text
.globl main

main:
# SECTION A: Display student info header:

    # Print the info header banner
    li   $v0, 4                  # syscall 4 = print string
    la   $a0, header_info        # load address of header_info string
    syscall

    # Print full name label
    li   $v0, 4
    la   $a0, lbl_name
    syscall

    # Print section number label
    li   $v0, 4
    la   $a0, lbl_section
    syscall

    # Print the initials-section header
    li   $v0, 4
    la   $a0, header_init
    syscall

# SECTION B: Display 1st character of each name part + ASCII:

    # Mohamed → M (ASCII 77)
    li   $v0, 11                 # syscall 11 = print character
    li   $a0, 'M'                # load character 'M'
    syscall

    li   $v0, 4                  # print " : "
    la   $a0, separator
    syscall

    li   $v0, 1                  # syscall 1 = print integer
    li   $a0, 77                 # ASCII value of 'M'
    syscall

    li   $v0, 4                  # print newline
    la   $a0, newline
    syscall

    # --- Tamer → T (ASCII 84) ---
    li   $v0, 11                 # print character 'T'
    li   $a0, 'T'
    syscall

    li   $v0, 4
    la   $a0, separator
    syscall

    li   $v0, 1                  # print ASCII value 84
    li   $a0, 84
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    # --- Mohamed → M (ASCII 77) ---
    li   $v0, 11                 # print character 'M'
    li   $a0, 'M'
    syscall

    li   $v0, 4
    la   $a0, separator
    syscall

    li   $v0, 1                  # print ASCII value 77
    li   $a0, 77
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    # --- Elsheikh → E (ASCII 69) ---
    li   $v0, 11                 # print character 'E'
    li   $a0, 'E'
    syscall

    li   $v0, 4
    la   $a0, separator
    syscall

    li   $v0, 1                  # print ASCII value 69
    li   $a0, 69
    syscall

    li   $v0, 4
    la   $a0, newline
    syscall

    # Print divider line before main program logic
    li   $v0, 4
    la   $a0, divider
    syscall

# SECTION C: Read integer input from the user

    li   $v0, 4                  # print the input prompt
    la   $a0, prompt_msg
    syscall

    li   $v0, 5                  # syscall 5 = read integer
    syscall
    move $t0, $v0                # $t0 = n (the number to test)

# SECTION D: Prime-checking algorithm:

#     THe registers used:
#     $t0 = n            (input number – preserved throughout)
#     $t1 = scratch / loop limit
#     $t2 = divisor      (starts at 3, increments by 2)
#     $t3 = n / 2        (upper bound for divisor loop)
#     $t4 = remainder    (result of n mod divisor)

    # Check 1: n <= 1  →  NOT prime 
    li   $t1, 1
    ble  $t0, $t1, not_prime     # branch if n <= 1
    
    # Check 2: n == 2  →  IS prime (only even prime) 
    li   $t1, 2
    beq  $t0, $t1, is_prime      # branch if n == 2

    # Check 3: n is even (n % 2 == 0)  →  NOT prime 
    andi $t1, $t0, 1             # bitwise AND with 1 isolates LSB
    beqz $t1, not_prime          # if LSB == 0, number is even → not prime

    # Check 4: Trial division by odd numbers 3 .. n/2 
    li   $t2, 3                  # divisor starts at 3
    srl  $t3, $t0, 1             # $t3 = n >> 1  (integer divide by 2 = n/2)
                                 # need to check up to n/2 only
                                 
check_loop:
    # If divisor > n/2, no factor was found → prime
    bgt  $t2, $t3, is_prime      # branch to is_prime if $t2 > $t3 (branch if greater than)

    # Compute n mod divisor
    div  $t0, $t2                # LO = n / divisor, HI = n mod divisor
    mfhi $t4                     # $t4 = remainder (n mod divisor)

    # If remainder == 0, divisor divides n evenly → NOT prime
    beqz $t4, not_prime

    # Advance to next odd divisor (skip even numbers)
    addi $t2, $t2, 2             # divisor += 2

    j    check_loop              # repeat loop

# SECTION E: Output results:

is_prime:
    # Print the number followed by the "IS prime" message
    li   $v0, 1
    move $a0, $t0                # print n
    syscall

    li   $v0, 4
    la   $a0, prime_msg          # print " is a PRIME number."
    syscall

    j    exit                    # jump to program exit

not_prime:
    # Print the number followed by the "NOT prime" message
    li   $v0, 1
    move $a0, $t0                # print n
    syscall

    li   $v0, 4
    la   $a0, not_prime_msg      # print " is NOT a prime number."
    syscall

    # Fall through to exit

# SECTION F: Exit program:

exit:
    li   $v0, 10                 # syscall 10 = exit
    syscall
