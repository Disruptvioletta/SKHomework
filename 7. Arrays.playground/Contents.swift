import Foundation
/*
1. создать массив "дни в месяцах"
12 элементов содержащих количество дней в соответствующем месяце

используя цикл for и этот массив
  
  - выведите количество дней в каждом месяце (без имен месяцев)
 
- используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
- сделайте то же самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
- сделайте то же самое, только выводите дни в обратном порядке (порядок в массиве не меняется)

- для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года */

var daysAndNames = [(names: String, days: Int)]()
let quantityOfDaysInMonths = [31, 28, 31, 30, 31, 31, 31, 31, 31, 30, 31, 30]

for quantity in 0..<quantityOfDaysInMonths.count {
  print(quantity)
}
let namesOfMonths = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sep", "Oct", "Nov", "Dec"]

for i in 0..<quantityOfDaysInMonths.count {
  print(" \(namesOfMonths[i]) \(quantityOfDaysInMonths[i])")
}

for i in 0..<quantityOfDaysInMonths.count {
  daysAndNames.append((names: namesOfMonths[i], days: quantityOfDaysInMonths[i]))
}
print(daysAndNames)

for (key, value) in quantityOfDaysInMonths.enumerated() {
  print("\(key) \(value)")
}

for i in daysAndNames.reversed() {
  print(i)
}

let a = quantityOfDaysInMonths.sorted()
print(a)

let y = quantityOfDaysInMonths.sorted(by: >)
print(y)

let birthday = (month: 07, day: 02)
var daysUntilDateX = 0

for i in 0..<birthday.month - 1 {
  daysUntilDateX += quantityOfDaysInMonths[i]
}

daysUntilDateX += birthday.day - 1
print(" there are \(daysUntilDateX) days until \(namesOfMonths[birthday.month - 1]) \(birthday.day)")



/*2. Сделайте первое задание к уроку номер 4 используя массивы:

(создайте массив опшинал интов и посчитайте сумму)

- в одном случае используйте optional binding
- в другом forced unwrapping
- а в третьем оператор ??  nil coalescing operator */

var peter = "40"
var peter1 = "3"
var peter2 = "f"
var peter3 = "r6"
var peter4 = "99"

let arrayOfOptionalInts = [Int(peter),Int(peter1),Int(peter2),Int(peter3),Int(peter4)]
var summation = 0

//forced unwrapping
for i in arrayOfOptionalInts {
  if i != nil {
    summation += i!
  }
}
//optional binding
for i in arrayOfOptionalInts {
  if let element = i {
    summation += element
  }
}
// nil coalescing operator

for value in arrayOfOptionalInts {
   summation += value ?? 0
}

/*
 3. создайте строку алфавит и пустой массив строк

в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед */

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var oursArray = [String]()

for character in alphabet.characters {
  //oursArray.append(String(character)) oursArray.reversed()
  oursArray.insert(String(character), at: 0)
}
print(oursArray)



