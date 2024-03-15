import UIKit

//MARK: 1. soru: Bir sınıfta en az bir yazılım dilini bilenlerin sayısı 24. Sadece swift bilenler 12, sadece kotlin bilenler 8 olduğuna göre. Her iki dili bilenlerin sayısı kaçtır?

func calculateBilingualStudents() -> Int {
    let totalStudents = 24
    let swiftOnly = 12
    let kotlinOnly = 8
    
    let bilingualNumber = totalStudents - (swiftOnly + kotlinOnly)
    
    return bilingualNumber
}

let number = calculateBilingualStudents()
print("Her iki dili bilen öğrenci sayısı : \(number)")

//MARK: 2. soru: hashable protokolü
/*
 Hash Değeri (Hash Value): Bir nesnenin benzersiz bir sayısal değeri olarak düşünülebilir.
 Bu değer, nesnenin içeriği veya özellikleri temel alınarak hesaplanır.
 Hash değerleri, veri yapılarında hızlı arama ve eşleştirme işlemleri için kullanılır.
 
 Hash Değeri Hesaplama: Bir türün hash değerini hesaplayabilmesi için hashValue adında bir özellik tanımlanmalıdır. Bu özellik, türün içeriğine dayalı benzersiz bir sayısal değeri döndürmelidir.
 Eşitlik Karşılaştırması: Hashable protokolü, eşitlik karşılaştırmaları için kullanılır. İki nesnenin hash değerleri eşitse, bu nesnelerin eşit olduğu kabul edilir. Bu nedenle, == operatörünün doğru sonuç vermesi için hash değerleri doğru hesaplanmalıdır.
 Set ve Dictionary Kullanımı: Hashable protokolü, Set ve Dictionary gibi veri yapılarında anahtar olarak kullanılabilen türler için gereklidir. Bu yapılar, hızlı arama ve eşleştirme işlemleri için hash değerlerini kullanır.
*/


//MARK: 3. soru: symmetricDifference
//Bu yöntem, iki kümenin elemanlarını karşılaştırır ve bu kümelerde yalnızca birinde bulunan elemanları içeren yeni bir küme döndürür. Yani, iki kümenin kesişimini almaz, sadece bu kümelerde örtüşmeyen elemanları içerir.

//MARK: 4. soru: subset subtraction
//  Bu yöntem, iki küme arasındaki farkı bulmak için kullanılır. İlk kümede bulunan ancak ikinci kümede bulunmayan elemanları içeren yeni bir küme döndürür. subtracting(_:) metodu ile kullanılır

//MARK: https://projecteuler.net/archives soruları

/*
 Problem 4: Largest Palindrome Product
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 99 x 91. 
 Find the largest palindrome made from the product of two 3-digit numbers.
*/
// This algorithm is a bit heavy!

//func isPalindrome(_ num: Int) -> Bool {
//  let numString = String(num)
//  return numString == String(numString.reversed())
//}
//
//var largestPalindrome = 0
//
//for i in (100...999).reversed() {
//  for j in (100...999).reversed() {
//    let product = i * j
//    if isPalindrome(product) && product > largestPalindrome {
//      largestPalindrome = product
//    }
//  }
//}

//print("Largest palindrome made from the product of two 3-digit numbers is \(largestPalindrome)")

/*
 Problem 5
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. 
 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

func greatestCommonDivisor(_ number1: Int, _ number2: Int) -> Int {
    return number2 == 0 ? number1 : greatestCommonDivisor(number2, number1 % number2)
}

func leastCommonMultiple(_ numbers: [Int]) -> Int {
    return numbers.reduce(1) { currentLCM, nextNumber in
        currentLCM * nextNumber / greatestCommonDivisor(currentLCM, nextNumber)
    }
}

let numbersFrom1To20 = Array(1...20)
let smallestNumberDivisibleByAll = leastCommonMultiple(numbersFrom1To20)
print("Smallest positive number that is evenly divisible by all of the numbers from 1 to 20 is \(smallestNumberDivisibleByAll)")


/* 
 Problem 6
 The sum of the squares of the first ten natural numbers is 385. The square of the sum of the first ten natural numbers is 3025.
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 2640.
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

func sumSquareDifference(_ n: Int) -> Int {
    
    // Sum of squares
    var sumOfSquares = 0
    for i in 1...n {
        sumOfSquares += i * i
    }
    
    // Square of the sum
    let sum = (n * (n + 1)) / 2
    let squareOfSum = sum * sum
    
    let difference = abs(sumOfSquares - squareOfSum)
    
    return difference
}

let n = 100
let result = sumSquareDifference(n)
print("The difference between the sum of the squares and the square of the sum for the first \(n) natural numbers is \(result)")


