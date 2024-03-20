import UIKit


/*
 İki parametreli ve farklı tipli bir generic örneği yapınız.(T, U)
 */

struct Pair<T, U> {
    
    var first: T
    var second: U
    
    func combine<V>(_ value: V) -> String {
        return "\(first)\(second)\(value)"
    }
}

let pair = Pair(first: 10, second: "Hello")
let combined = pair.combine(5.0)
print(combined)


/*
 Euler's projest question 7
 */

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    if number <= 3 {
        return true
    }
    let sqrtNumber = Int(sqrt(Double(number)))
    for divisor in 2...sqrtNumber {
        if number % divisor == 0 {
            return false
        }
    }
    return true
}

func findNthPrime(n: Int) -> Int {
    var count = 0
    var num = 1

    while count < n {
        num += 1
        if isPrime(num) {
            count += 1
        }
    }
    return num
}

let n = 10001
let nthPrime = findNthPrime(n: n)
print("The \(n)st prime number is: \(nthPrime)")


/*
 Reverse String
 */
func reverseString(_ input : String) -> String {
    // Write your code for the 'Reverse String' exercise in this file.
    return String(input.reversed())
}
reverseString("ali")

/*
 Isogram
 */

func isIsogram(_ string: String) -> Bool {
    let lowercased = string.lowercased()
    let letters = lowercased.filter { $0.isLetter }
    let uniqueLetters = Set(letters)
    return letters.count == uniqueLetters.count
}

isIsogram("me r  t")

/*
 Raindrops
 */

func raindrops(_ number: Int) -> String {
    // Write your code for the 'Raindrops' exercise in this file.
    var result = ""
    if number % 3 == 0 {
        result.append("Pling")
    }
    if number % 5 == 0 {
        result.append("Plang")
    }
    if number % 7 == 0 {
        result.append("Plong")
    }
    if number % 3 != 0 && number % 5 != 0 && number % 7 != 0 {
        result.append("\(number)")
    }
    return result
}

raindrops(34)

/*
 Collatz Conjecture
 */

class CollatzConjecture {
  static func steps(_ number: Int) throws -> Int? {
    // Write your code for the 'Collatz Conjecture' exercise here.
      
        var n = number
        var steps = 0
        while n != 1 {
            if n % 2 == 0 {
                n /= 2
            } else {
                n = 3 * n + 1
            }
            steps += 1
        }
        return steps
  }
}


try CollatzConjecture.steps(12)

/*
 ISBN Verifier
 */

class IsbnVerifier {
    static func isValid(_ string: String) -> Bool {
        let isbn = string.filter { $0.isNumber || $0 == "X" }
        guard isbn.count == 10 else { return false }
        
        var sum = 0
        for (index, char) in isbn.enumerated() {
            if let digit = Int(String(char)) {
                sum += digit * (10 - index)
            } else if char == "X" && index == 9 {
                sum += 10
            } else {
                return false
            }
        }
        return sum % 11 == 0
    }
}

IsbnVerifier.isValid("3598P215088")



