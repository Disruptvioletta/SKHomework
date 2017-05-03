 import Foundation
/* 1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
 */

func heart() -> String {
  return "\u{1F618}"
}

func  test() -> String {
  return "\u{1F63B}"
}

func randomShape() -> String {
  return "\u{1F63D}"
}

print(" \(heart()) " + "\(test()) " + "\(randomShape()) ")

//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func chess(letter: String, row:  Int) -> String {
  let searchRange: [String: Int] = ["A" : 1, "B" : 2, "C" : 3, "D" : 4, "E" : 5, "F" : 6, "G" : 7, "H" : 8]
  
  if let intCode = searchRange[letter], 1 <= row && row <= 8 {
    return (row % 2 == intCode % 2) ? " \u{25FB}" : " \u{25fc}"
  } else {
    return "fatalError"
  }
}
chess(letter: "B", row: 0)
let coordinateOne = chess(letter: "C", row: 2)
print(coordinateOne)
 
// You may declare function return type as Optional with the associated type String, and thus return nil.

//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
func reverseBackwards(array: [Any]) -> [Any] {
  var temporaryArray: [Any] = []
  for obj in array {
    temporaryArray.insert(obj, at: 0)
  }
  return temporaryArray
}

let a1 = reverseBackwards(array: [1,2,3,4,5,6,7])

// extra credit 3.0

func reverseLikeASwiftPro(array: [Any]) -> [Any] {
  return array.reversed()
}

let sampleImplementation = reverseLikeASwiftPro(array: [9,8,7,6])
print(sampleImplementation)

// 3.1

func reverseArrayFromSequence(seq: Any...) -> [Any] {
  var someArray = [Any]()
  for i in seq {
    someArray += [i]
  }
  return reverseBackwards(array: someArray)
}

let testExecution = reverseArrayFromSequence(seq: "f","r","d","u","i","d","w")
print(testExecution)

//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func reverseUsingInout(array: inout [Int]) {
  for object in array {
    array.insert(object, at: 0)
    array.removeLast()
  }
}

var testInout = [1,2,3,4,5,6,7,8,9]
reverseUsingInout(array: &testInout)
testInout

// 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

var sampleSentence = "Closures, what are they? 1 2 3 4 5 "
print(sampleSentence)

func modify(string: inout String) {
  let numbersToWords = ["0": "zero", "1": "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9" : "nine"]
  for character in string.lowercased().characters {
    switch character {
    case "a","e","i","o","u","y": string += String(character).uppercased()
    case "b"..."z" : string += String(character)
    case "0"..."9": string += numbersToWords[String(character)]!
    case ",","!","?",":",".": string += ""
    default: string += String(character)
    }
    string.remove(at: string.startIndex)
  }
  print(string)
}
modify(string: &sampleSentence)








