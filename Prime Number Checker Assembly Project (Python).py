#  Prime Number Checker Assembly Project (Python)
#  Student: Mohamed Tamer Mohamed Elsheikh
#  Section: 19

"""
Returns True if n is a prime number, False otherwise.

Algorithm:
1. Numbers <= 1 are not prime by definition.
2. 2 is the only even prime number.
3. Any other even number is not prime.
4. Check odd divisors from 3 up to sqrt(n).
    If any divisor divides n evenly, n is not prime.
"""

def is_prime(n: int) -> bool:

    # Step 1 – Handle numbers <= 1
    if n <= 1:
        return False

    # Step 2 – 2 is prime
    if n == 2:
        return True

    # Step 3 – Eliminate all other even numbers
    if n % 2 == 0:
        return False

    # Step 4 – Check odd divisors from 3 up to sqrt(n)
    divisor = 3
    while divisor * divisor <= n:       # equivalent to divisor <= sqrt(n)
        if n % divisor == 0:
            return False                # divisor found → not prime
        divisor += 2                    # only odd divisors needed

    return True                         # no divisor found → prime

def main():
    # Display student information
    print("=" * 45)
    print("  Computer Architecture – Assembly Project")
    print("  Student : Mohamed Tamer Mohamed Elsheikh")
    print("=" * 45)

    # Display first character + ASCII value of each name part
    name_parts = ["Mohamed", "Tamer", "Mohamed", "Elsheikh"]
    print("\nFirst character of each name part:")
    for part in name_parts:
        first_char = part[0]
        print(f"  {first_char} : {ord(first_char)}")

    # Prime-checking logic
    print()
    try:
        number = int(input("Enter an integer to check: "))
    except ValueError:
        print("Invalid input. Please enter a whole integer.")
        return

    if is_prime(number):
        print(f"\n{number} is a prime number.")
    else:
        print(f"\n{number} is NOT a prime number.")

if __name__ == "__main__":
    main()