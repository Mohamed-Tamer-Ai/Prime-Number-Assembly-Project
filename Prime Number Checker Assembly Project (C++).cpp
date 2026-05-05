//  Prime Number Checker Assembly Project (C++)
//  Student: Mohamed Tamer Mohamed Elsheikh
//  Section: 19

#include <iostream> 
#include <string>   
#include <vector>   
#include <limits> 

using namespace std;

bool is_prime(int n)
{
    // Step 1 – Handle numbers <= 1
    if (n <= 1)
        return false;

    // Step 2 – 2 is prime
    if (n == 2)
        return true;

    // Step 3 – Eliminate all other even numbers
    if (n % 2 == 0)
        return false;

    // Step 4 – Check odd divisors from 3 up to sqrt(n)
    int divisor = 3;
    while (divisor * divisor <= n) // equivalent to divisor <= sqrt(n)
    {
        if (n % divisor == 0)
            return false; // divisor found → not prime

        divisor += 2; // only odd divisors needed
    }

    return true; // no divisor found → prime
}

int main()
{
    // Display student information header
    cout << "  Computer Architecture - Assembly Project" << endl;
    cout << "  Student : Mohamed Tamer Mohamed Elsheikh" << endl;
    cout << "  Section : 19" << endl;

    // ── Display first character + ASCII value of each name part ──
    vector<string> name_parts = {"Mohamed", "Tamer", "Mohamed", "Elsheikh"};

    cout << "\nFirst character of each name part:" << endl;
    for (const string &part : name_parts)
    {
        char first_char = part[0];         // first character of name part
        int ascii_value = (int)first_char; // cast char to int = ASCII value

        cout << "  " << first_char << " : " << ascii_value << endl;
    }

    // Prime-checking logic
    cout << endl;
    cout << "Enter an integer to check: ";

    int number;

    // Input validation: mirror Python's try/except ValueError
    if (!(cin >> number))
    {
        // Clear the error flag and discard bad input
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        cout << "Invalid input. Please enter a whole integer." << endl;
        return 1;
    }

    // Output the result
    if (is_prime(number))
        cout << "\n"
             << number << " is a prime number." << endl;
    else
        cout << "\n"
             << number << " is NOT a prime number." << endl;

    return 0;
}