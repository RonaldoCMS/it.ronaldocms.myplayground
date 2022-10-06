import UIKit

var greeting = "Hello, playground"

func max(num1: Int, num2: Int) -> Int {
    if num1 >= num2 {
        return num1
    }
    return num2
}

func isMaggiorenne(eta: Int) -> Bool {
    return eta >= 18
}

enum nationals {
    case IT
    case DE
    case EN
    case ES
}


func patente(eta:Int, national: nationals) -> Bool {
    switch(national) {
    case .IT:
        return eta >= 18
    case .DE:
        return eta >= 16
    case .EN:
        return eta >= 18
    case .ES:
        return eta >= 21
    }
}

func multipleFor(multiple: Int, for_: Int) -> Bool {
    return multiple % for_ == 0
}

enum CelsiusError: Error {
    case invalidNumber
}


func celsiusToFahrenheit(celsius: Double) throws -> Double {
    if celsius <= -273.15 {
        throw CelsiusError.invalidNumber
    }
    return celsius + 273.15
}

func isProgressive(num1: Int, num2: Int, num3: Int) -> Bool {
    return (num2 - num1 == num1) && (num3 - num2 == num1)
}

func isBisestile(year: Int) -> Bool {
    return (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
}

enum TypeTriangolo {
    case ISOSCERE
    case SCALENO
    case EQUILATERO
}

func getTypeOfTriangolo(lato1: Int, lato2: Int, lato3: Int) -> TypeTriangolo {
    if(lato1 != lato2 && lato2 != lato3) {
        return .SCALENO
    } else if (lato1 == lato2 && lato2 == lato3) {
        return .EQUILATERO
    }
    return .ISOSCERE
}

func yearFromMoon(year: Int) -> Int {
    return year - 1969
}

func orderByAsc(array: inout [Int]) {
    for i in 0..<array.count - 1 {
        for j in (i+1)..<array.count {
            if(array[i] > array[j]) {
                var temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
}

func compreso(a: Int, b: Int, c: Int) -> Bool {
    return b >= a && b <= c
}

enum VocaliError: Error {
    case CharacterLength
}

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

func isVocale(str: String) throws -> Bool {
    if(str.count > 1) {
        throw VocaliError.CharacterLength
    }
     return str.matches("[a:A]|[E:e]|[I:i]|[O:o]|[U:u]")
}

//Il programma legge due numeri e controlla se il primo è maggiore del secondo.
print(max(num1: 10, num2: 20))

//L’utente inserisce la propria età e il programma dice se è maggiorenne (ovvero con età maggiore uguale a 18 anni)
print(isMaggiorenne(eta: 20))

/*
 L’utente inserisce a quanti anni si può prendere la patente nello stato in cui si vive (in Italia a 18 anni ma in altri stati a 16, 17 o a 21),
    l’utente inserisce quanti anni ha;
    il programma risponde se l’utente può prendere la patente.
 */
print(patente(eta: 20, national: .IT))

// Il programma legge due numeri e controlla se il primo è multiplo del secondo.
print(multipleFor(multiple: 9, for_: 4))

/*L’utente inserisce una temperatura in Celsius e il calcolatore la converte in Fahrenheit ed in Kelvin. Se la temperatura inserita è minore dello zero assoluto (-273,15), il calcolatore segnala un errore.
    Si ricordi che:
    Fahrenheit = (9/5) · Celsius + 32
    Kelvin = Celsius + 273,15
 */
print(try celsiusToFahrenheit(celsius: -1))

/*
Il programma letti tre numeri, determini se possono essere considerati in progressione aritmetica;
 una progressione aritmetica è una serie di numeri in cui la differenza tra due numeri successivi è costante.
*/
print(isProgressive(num1: 3, num2: 6, num3: 19))

/*
 L’utente inserisce un anno ed il calcolatore verifica se l’anno inserito è bisestile.
 Un anno è bisestile se è divisibile per 4 ma non per 100, oppure se è divisibile per 400 (ad esempio il 1900 non è stato bisestile, mentre il 2000 lo è stato).
 */
print(isBisestile(year: 2000))

/*
 Il programma legge tre lunghezze dei lati di un triangolo e dice se il triangolo è scaleno, isoscele o equilatero
 */
print(getTypeOfTriangolo(lato1: 30, lato2: 30, lato3: 30))

/*
 La prima volta che l’uomo è andato sulla Luna è stato il 1969,
 creare un programma che chiede l’anno di nascita all’utente e gli risponde quanti anni prima o quanti anni dopo
 */
print(yearFromMoon(year: 1950))


//Il programma legge tre numeri e li mette in ordine crescente.
var myArray = [10, 3, 15]
orderByAsc(array: &myArray)
print(myArray)

//Inseriti tre numeri A, B e C dire se B è compreso tra A e C.
print(compreso(a: 2, b: 5, c: 10))

print(try isVocale(str: "Z"))
