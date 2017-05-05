// MARK: 11 closures

let numbersOne = [3,5,6,8,1,2,9,7,4,11,45,666,88]

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
  var filtered = [Int]()
  for i in array {
    if f(i) {
      filtered.append(i)
    }
  }
  return filtered
}

//func compare(i: Int) -> Bool {
//  return i % 2 == 0
//}

//filterArray(array: numbersOne, f: compare(i:))
// i это локальная переменная, первый аргумент
// in это просто открывается тело функции


filterArray(array: numbersOne, f: {(i: Int) -> Bool in
  return i % 2 == 0
})

filterArray(array: numbersOne, f: {(i: Int) -> Bool in
  return i < 10
})

filterArray(array: numbersOne, f: { (i: Int) -> Bool in
  return i % 3 == 0
})

filterArray(array: numbersOne, f: {(i: Int) -> Bool in
  return i % 4 == 0
})

let b = filterArray(array: numbersOne,f: {i in i % 2 == 1 })

let c = filterArray(array: numbersOne,f: { $0 % 3 == 0 })

let d = filterArray(array: numbersOne) { $0 % 3 == 0}

let anotherNumbersTwo = [44,22,3,22,111,77,88]

var countArray = 0

filterArray(array: numbersOne,f: { value in
  for include in anotherNumbersTwo {
    countArray += 1
    if include == value {
      return true
    }
  }
  return false
  
})

var ddd: Dictionary<Int,Bool> = [:]

var sweetDictionary = [Int:Bool]()
for value in anotherNumbersTwo {
  sweetDictionary[value] = true
}
var count = 0

filterArray(array: numbersOne, f: { value in
  count += 1
  return sweetDictionary[value] != nil
})

//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.

func first(argument:() -> ()) {
  var sum = 0
  for i in 1...10 {
    sum += 1
    print(" \(i) loop iteration")
  }
  print("Summation = \(sum)")
  argument()
}

first { print("Alexey Skutarenko") }


//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.

let wallet = [10,30,40,60,50,90,20,30,10]
let modifiedWallet = wallet.sorted(by: { $0 < $1 })
modifiedWallet

let anotherModifiedWallet = wallet.sorted(by: { $0 > $1 })
anotherModifiedWallet

let test = wallet.sorted()
// extra credit

let vkFriends = ["Dmitry","David","Egor","Mari","Alexander"]
let funcImplementation = vkFriends.sorted { (a1: String, a2: String) -> Bool in
  return a1 > a2
}
let alphabetical = vkFriends.sorted { (argument1: String, argument2: String) -> Bool in
  return argument1 < argument2
}

let coins = [1,5,10,2]
let foldedCoins = coins.sorted { (a1: Int, a2: Int) -> Bool in
  return a1 < a2
}

//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет.
//В самой функции создайте опшинал переменную. 
//Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер.
//Если клоужер возвращает да, то вы записываете значение массива в переменную.
//в конце функции возвращайте переменную.используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.
func multiply(f: Int, s: Int) -> Int {
  return f * s
}
multiply(f: 11, s: 11)

let randomNumbers = [11,22,33,44,121]
// had to do that

func calculateMinOrMaxNumberFrom(array: [Int], usingClosure: (Int,Int?) -> Bool) -> Int {
  var value: Int?
  for i in array {
    if usingClosure(i,value) {
      value = i
    }
  }
  return value!
}

let maxElement = calculateMinOrMaxNumberFrom(array: randomNumbers) { (argument1, argument2) -> Bool in
  if argument2 != nil {
    argument1 > argument2!
  }
  return true
}
maxElement

let minElement = calculateMinOrMaxNumberFrom(array: randomNumbers) { $1 != nil ? $0 < $1! : true }

minElement

//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

var sampleSentence = "If I could fly, I'd be coming right back home to you; I think I might give up everything, just ask me to! 123895332184832"
var arrayOfCharacters = Array(sampleSentence.characters).map { String($0) }

func priority(string: String) -> Int {
  switch string.lowercased() {
  case "a","e","i","o","u","y": return 0
  case "b"..."z": return 1
  case "0"..."9": return 2
  case "!"..."~": return 3
  default: return 4
  }
}

let resultCharacters = arrayOfCharacters.sorted {
  if priority(string: $0) == priority(string: $1) {
    if $0.uppercased() == $1.uppercased() {
      return $0 < $1
    } else {
      return $0.uppercased() <= $1.uppercased()
    }
  } else {
    return priority(string: $0) < priority(string: $1)
  }
}

print(resultCharacters)
let sortedAsPerRequest = resultCharacters.joined(separator: " ")
print(sortedAsPerRequest)


//5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)

let lettersArray = ["G","H","R","A","L"]

func calculateMinOrMaxCharacter(array: [String], closure: (String, String?) -> Bool) -> String {
  var value: String?
  
  for i in array {
    if closure(i, value) {
      value = i
    }
  }
  return value!
}

let maxCharacter = calculateMinOrMaxCharacter(array: lettersArray) { (arg1, arg2) -> Bool in
  if arg2 != nil {
    return arg1 > arg2!
  }
  return true
}
print(maxCharacter)

let minCharacter = calculateMinOrMaxCharacter(array: lettersArray) { (arg1, arg2) -> Bool in
  if arg2 != nil {
    return arg1 < arg2!
  }
  return true
}

print(minCharacter)

