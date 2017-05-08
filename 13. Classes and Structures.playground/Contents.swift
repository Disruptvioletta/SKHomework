

//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний балл. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
struct Student {
  var name: String
  var lastName: String
  var yearOfBirth: Int
  var averageMark: Double
}

var one1 = Student(name: "Alexey", lastName: "Skutarenko", yearOfBirth: 1988, averageMark: 4.0)
var one2 = Student(name: "Violechik", lastName: "Illarionova", yearOfBirth: 1993, averageMark: 3.0)
var one3 = Student(name: "Dmitriy", lastName: "Rosov", yearOfBirth: 1997, averageMark: 2.0)
var one4 = Student(name: "Egor", lastName: "Petrov", yearOfBirth: 1998, averageMark: 5.0)
var one5 = Student(name: "Alexander", lastName: "Zimin", yearOfBirth: 1990, averageMark: 1.0)
var one6 = Student(name: "Ivan", lastName: "Zimin", yearOfBirth: 1993, averageMark: 4.0)

let schoolJournal = [one1, one2, one3, one4, one5, one6]

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func printOutToConsole(array: [Student]) {
  var count = 1
  for i in array {
    print("\(count): \(i.name) \(i.lastName) Year: \(i.yearOfBirth) Average: \(i.averageMark)")
    count += 1
  }
}
printOutToConsole(array: schoolJournal)

//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
print("\n3 \n")
let descendingAverage = schoolJournal.sorted { $0.averageMark > $1.averageMark }
printOutToConsole(array: descendingAverage)

print("\n4 \n")

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

let ascendingLastName = schoolJournal.sorted {
  if $0.lastName == $1.lastName {
    $0.name < $1.name
  } else {
    $0.lastName < $1.lastName
  }
  return true
}

printOutToConsole(array: ascendingLastName)

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
print("\n5 \n")

var copyOfExistingArray = schoolJournal
copyOfExistingArray[0].name = "James"
copyOfExistingArray[0].lastName = "Potter"
copyOfExistingArray[0].yearOfBirth = 2001
copyOfExistingArray[0].averageMark = 1.0

print(schoolJournal[0])
print(copyOfExistingArray[0])

//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
print("\n6 \n")

class Pupil {
  var name = "Violett"
  var lastName = "Illarionova"
  var yearOfBirth = 1993
  var averageMark = 5.0
  
  init(name: String, lastName: String, yearOfBirth: Int, averageMark: Double) {
    self.name = name
    self.lastName = lastName
    self.yearOfBirth = yearOfBirth
    self.averageMark = averageMark
  }
}

var universityJournal: [Pupil] = []

universityJournal.append(Pupil(name: "Bill", lastName: "Shmill", yearOfBirth: 1989, averageMark: 3.0))
universityJournal.append(Pupil(name: "Bob", lastName: "Shmob", yearOfBirth: 1991, averageMark: 4.0))
universityJournal.append(Pupil(name: "Peter", lastName: "Shmiter" ,yearOfBirth: 2001, averageMark: 4.0))
universityJournal.append(Pupil(name: "Dmitriy", lastName: "Shmitry", yearOfBirth: 2000, averageMark: 2.0))
universityJournal.append(Pupil(name: "Violetta", lastName: "Shmill", yearOfBirth: 1993, averageMark: 1.0))



func printToConsoleClassInstance(array: [Pupil]) {
  var count = 1
  for i in array {
    print("\(count) \(i.name) \(i.lastName) Year of Birth: \(i.yearOfBirth) Average test mark: \(i.averageMark)")
    count += 1
  }
}
print("Group in array of classes")


printToConsoleClassInstance(array: universityJournal)
print("\nSorted by average mark")
//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

let averageGroupMark = universityJournal.sorted { $0.averageMark > $1.averageMark }
printToConsoleClassInstance(array: averageGroupMark)
print("Old array")
printToConsoleClassInstance(array: universityJournal)

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
print("\nSorted by surname or name. New instance of the same class")
let sortByLastNameOrName = universityJournal.sorted {( $0.lastName != $1.lastName) ? ($0.lastName < $1.lastName) : ($0.name < $1.name )}
printToConsoleClassInstance(array: sortByLastNameOrName)
print("\ncheck what happened to the old array \n")
printToConsoleClassInstance(array: universityJournal)
print("\n Decided to check how to  mutate existing class, not its instance")
print("OOOOLD Arrayy")
printToConsoleClassInstance(array: universityJournal)
universityJournal = universityJournal.sorted {( $0.lastName == $1.lastName) ? ($0.name < $1.name) : ($0.lastName < $1.lastName )}
print("\n Sorted old array in ascending order \n")
printToConsoleClassInstance(array: universityJournal)
print("\n what about old one, huh? \n")

print("\n I still cannot comprehend")
var lastChance = universityJournal.sorted { (argument: Pupil, argument2: Pupil) -> Bool in
  return (argument.lastName == argument2.lastName) ? (argument.name > argument2.name) : (argument.lastName > argument2.lastName)
}
printToConsoleClassInstance(array: lastChance)
print("\n test\n")
printToConsoleClassInstance(array: universityJournal)

//6.5 Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
// Какой результат в 5м задании? Что изменилось и почему?

var fifthElement = universityJournal
fifthElement[0].averageMark = 9.0
fifthElement[1].averageMark = 9.0
fifthElement[2].averageMark = 9.0
fifthElement[3].averageMark = 9.0
fifthElement[4].averageMark = 9.0
print("\n Initial array")
printToConsoleClassInstance(array: universityJournal)
print("\n Final result")
printToConsoleClassInstance(array: fifthElement)

// 7 Выполните задание шахмат из урока по энумам используя структуры либо классы



