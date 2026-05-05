# Prime Number Assembly Project

Prime-number checking project written in **MIPS Assembly**, with reference implementations in **C++** and **Python**.

This repository contains a small “Computer Architecture / Assembly” style assignment that:

- Prints student information
- Prints the first character of each name part and its ASCII code
- Prompts the user for an integer
- Determines whether the integer is **prime**

## Files

- **`Prime Number Checker Assembly Project (Mips Assemply).asm`** — MIPS Assembly implementation (SPIM/MARS-style syscalls).
- **`Prime Number Assembly Project (Low Level).asm`** — low-level assembly variant of the same idea (prime checker + student info output).
- **`Prime Number Checker Assembly Project (C++).cpp`** — C++ reference implementation.
- **`Prime Number Checker Assembly Project (Python).py`** — Python reference implementation.

## How it works (prime check)

All versions follow the same logic:

1. `n <= 1` → not prime
2. `n == 2` → prime
3. `n` even → not prime
4. Try dividing by odd numbers starting from `3`
   - Assembly version checks divisors up to `n/2`
   - C++/Python versions check divisors up to `sqrt(n)`

## Running

### MIPS Assembly (`.asm`)

You can run the MIPS program using a MIPS simulator such as **MARS** or **QtSPIM**.

1. Open `Prime Number Checker Assembly Project (Mips Assemply).asm`
2. Assemble
3. Run
4. Enter an integer when prompted

> Note: The assembly code uses the standard syscall convention (`$v0=4` print string, `$v0=5` read integer, `$v0=10` exit), which is supported by SPIM/MARS.

### Python

```bash
python "Prime Number Checker Assembly Project (Python).py"
```

### C++

```bash
g++ "Prime Number Checker Assembly Project (C++).cpp" -o prime_checker
./prime_checker
```

## Example output (conceptual)

```
=== Student Information ===
Name    : Mohamed Tamer Mohamed Elsheikh
Section : 19

First character of each name:
M : 77
T : 84
M : 77
E : 69
===========================

Enter an integer: 17
17 is a PRIME number.
```

## License

No license file is currently included in this repository. If you want, add a LICENSE to clarify usage rights.
