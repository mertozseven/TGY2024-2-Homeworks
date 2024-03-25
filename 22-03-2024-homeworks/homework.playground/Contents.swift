import UIKit

///*
// Largest Product in a Series
//
// The four adjacent digits in the
// 1000-digit number that have the greatest product are 9x9x8x9=5832.
//
// 73167176531330624919225119674426574742355349194934
// 96983520312774506326239578318016984801869478851843
// 85861560789112949495459501737958331952853208805511
// 12540698747158523863050715693290963295227443043557
// 66896648950445244523161731856403098711121722383113
// 62229893423380308135336276614282806444486645238749
// 30358907296290491560440772390713810515859307960866
// 70172427121883998797908792274921901699720888093776
// 65727333001053367881220235421809751254540594752243
// 52584907711670556013604839586446706324415722155397
// 53697817977846174064955149290862569321978468622482
// 83972241375657056057490261407972968652414535100474
// 82166370484403199890008895243450658541227588666881
// 16427171479924442928230863465674813919123162824586
// 17866458359124566529476545682848912883142607690042
// 24219022671055626321111109370544217506941658960408
// 07198403850962455444362981230987879927244284909188
// 84580156166097919133875499200524063689912560717606
// 05886116467109405077541002256983155200055935729725
// 71636269561882670428252483600823257530420752963450
//
// Find the thirteen adjacent digits in the
// 1000-digit number that have the greatest product. What is the value of this product?
// */
//
//let number = """
//73167176531330624919225119674426574742355349194934
//96983520312774506326239578318016984801869478851843
//85861560789112949495459501737958331952853208805511
//12540698747158523863050715693290963295227443043557
//66896648950445244523161731856403098711121722383113
//62229893423380308135336276614282806444486645238749
//30358907296290491560440772390713810515859307960866
//70172427121883998797908792274921901699720888093776
//65727333001053367881220235421809751254540594752243
//52584907711670556013604839586446706324415722155397
//53697817977846174064955149290862569321978468622482
//83972241375657056057490261407972968652414535100474
//82166370484403199890008895243450658541227588666881
//16427171479924442928230863465674813919123162824586
//17866458359124566529476545682848912883142607690042
//24219022671055626321111109370544217506941658960408
//07198403850962455444362981230987879927244284909188
//84580156166097919133875499200524063689912560717606
//05886116467109405077541002256983155200055935729725
//71636269561882670428252483600823257530420752963450
//"""
//
//let digits = Array(number.filter { $0.isNumber }).map { Int(String($0))! }
//let length = 13
//var maxProduct = 0
//
//for i in 0...(digits.count - length) {
//    let slice = digits[i..<(i+length)]
//    let product = slice.reduce(1, *)
//    maxProduct = max(maxProduct, product)
//}
//
//print(maxProduct)
//
///*
// Special Pythagorean Triplet
//
// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
// a * a + b * b = c * c.
// For example, 3 * 3 + 4 * 4 = 9 + 16 = 25 = 5 * 5.
//
// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.
// */
//
//func findPythagoreanTriplet(sum: Int) -> (Int, Int, Int)? {
//    for a in 1..<sum {
//        for b in a..<sum {
//            let c = sum - a - b
//            if a * a + b * b == c * c {
//                return (a, b, c)
//            }
//        }
//    }
//    return nil // No triplet found
//}
//
//if let triplet = findPythagoreanTriplet(sum: 1000) {
//    let product = triplet.0 * triplet.1 * triplet.2
//    print("\nPythagorean triplet: \(triplet)")
//    print("Product abc: \(product)")
//} else {
//    print("No Pythagorean triplet found for the sum of 1000")
//}

/*
 Summation of Primes
 
 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 
 Find the sum of all the primes below two million.
 */

//func sumOfPrimesSieve(below limit: Int) -> Int {
//    var isPrime = Array(repeating: true, count: limit)
//    var sum = 0
//
//    isPrime[0] = false
//    isPrime[1] = false
//
//    for number in 2..<limit {
//        if isPrime[number] {
//            sum += number
//            for multiple in stride(from: number * number, to: limit, by: number) {
//                isPrime[multiple] = false
//            }
//        }
//    }
//
//    return sum
//}
//
//let limit = 2_000_000
//let sum = sumOfPrimesSieve(below: limit)
//print("Sum of primes below \(limit) (Sieve): \(sum)")

/*
 ETL
 */

class ETL {
    static func transform(_ old: [String: [String]]) -> [String: Int] {
        
        var new = [String: Int]()
        
        for (score, letters) in old {
            for letter in letters {
                new[letter.lowercased()] = Int(score)
            }
        }
        
        return new
    }
}


/*
 Grains
 */

struct Grains {
    static func square(_ num: Int) -> UInt64 {
        // Write your code for the 'Grains' exercise in this file.
        guard num >= 1 else {
            return 0
        }
        guard num <= 64 else {
            return 0
        }
        return UInt64(pow(Double(2), Double(num - 1)))
    }
}

/*
 Sublist
 */

enum ListRelationship {
    case equal
    case superlist
    case sublist
    case unequal
}

func determineListRelationship<T: Equatable>(listOne: [T], listTwo: [T]) -> ListRelationship {

    if listOne.isEmpty && listTwo.isEmpty {
        return .equal
    } else if listOne.isEmpty {
        return .sublist
    } else if listTwo.isEmpty {
        return .superlist
    }

    if listOne.count <= listTwo.count && listTwo.elementsEqual(listOne.lazy.enumerated().map { $1 }) {
        return .sublist
    }

    if listTwo.count <= listOne.count && listOne.elementsEqual(listTwo.lazy.enumerated().map { $1 }) {
        return .superlist
    }

    if listOne == listTwo {
        return .equal
    }

    return .unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> ListRelationship {
    return determineListRelationship(listOne: listOne, listTwo: listTwo)
}


/*
 
 */
