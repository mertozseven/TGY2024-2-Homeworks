import Foundation

/*
 
 Soru 1
 
 Fonksiyona parametre olarak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yazınız.
 Örneğin 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde olmalıdır
 
 */

func plusMinus(number: Int) -> String {
    var string = ""
    for i in 1...number {
        if i % 2 == 0 {
            string.append("-")
        } else {
            string.append("+")
        }
    }
    return string
}

plusMinus(number: 5)

/*
 
 Soru 2
 
 Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını yanına koyunuz.
 Örneğin parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 528, parametre 920 için 9520 olmalıdır
 
 */

func makeItBigger(number: Int) -> String {
    let numbString = String(number)
    var finalNumber = ""
    var numberIsAdded: Bool = false
    for num in numbString {
        let charNum = num.wholeNumberValue!
        if charNum < 5 && !numberIsAdded {
            finalNumber.append("5")
            finalNumber.append(num)
            numberIsAdded = true
        } else {
            finalNumber.append(num)
        }
    }
    return finalNumber
}

makeItBigger(number: 26)



/*
 Layers of Lasagna
 */

// TODO: define the 'expectedMinutesInOven' constant
let expectedMinutesInOven = 40
// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    let result = expectedMinutesInOven - elapsedMinutes
    return result
}
// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: Int) -> Int {
    return layers * 2
}
// TODO: define the 'totalTimeInMinutes' function
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    let remainingMinutesInOven = remainingMinutesInOven(elapsedMinutes: elapsedMinutes)
    let preparationTimeInMinutes = preparationTimeInMinutes(layers: layers)
    return elapsedMinutes + preparationTimeInMinutes
    
}

/*
 Difference of Squares
 */

class Squares {
    // Write your code for the 'Difference Of Squares' exercise here.
    var N: Int
    init(_ N: Int) {
        self.N = N
    }
    
    func sumOfSquares() -> Int {
        var result = 0
        for i in 1...N {
            result += i * i
        }
        return result
    }
    func squareOfSum() -> Int {
        var result = 0
        for i in 1...N {
            result += i
        }
        return result * result
    }
    func differenceOfSquares() -> Int {
        let sumOfTheSquares = sumOfSquares()
        let squaresOfTheSum = squareOfSum()
        return squaresOfTheSum - sumOfTheSquares
    }
}
Squares(10).differenceOfSquares()


/*
 RNA Transcription
 */

func toRna(_ dna: String) -> String {
    // Write your code for the 'Rna Transcription' exercise in this file.
    var finalString: String = ""
    for char in dna {
        if char == "G" {
            finalString.append("C")
        } else if char == "C" {
            finalString.append("G")
        } else if char == "T" {
            finalString.append("A")
        } else if char == "A" {
            finalString.append("U")
        }
    }
    return finalString
}

/*
 Two Fer
 */

func twoFer(name: String) {
        print("One for \(name), one for me.")
}
let names = ["Alice", "Bohdan", "Zaphod"]

func twoFer() {
    print("One for you, one for me.")
}

