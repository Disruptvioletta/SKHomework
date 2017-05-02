/*
 1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(
 
 После всех этих перетрубаций посчитайте общий бал группы и средний бал
 
 2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
 В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.
 
 3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.
 
 Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).
*/
import Foundation
//1 
// Viva la diva, viva Victoria, Cleopatra.
var studentGradeList = ["Viva" : 4, "Diva" : 5, "Alex" : 5, "Pavel" : 3, "Cleopatra": 1, "Faith" : 5, "Victoria" : 5]
studentGradeList.updateValue(4, forKey: "Pavel")
studentGradeList.updateValue(2, forKey: "Cleopatra")
studentGradeList["Viva"] = nil
studentGradeList.removeValue(forKey: "Faith")
print(studentGradeList)

var totalGrade = 0
for i in studentGradeList.values {
  totalGrade += i
}

print(" The summation of group effort is \(totalGrade)")
let averageGrade = Int(round(Double(totalGrade)/Double(studentGradeList.count)))
print(" Total mark for a group is \(totalGrade)  and an average value \(averageGrade)")
//2
let months = ["jan" : 31, "feb": 28, "march" : 31, "apr" : 31, "may" : 31, "june" : 31, "july" : 31, "aug" : 31,"sep" : 31, "oct" : 31, "nov" : 31, "dec" : 31]

for (key, value) in months {
  print(" \(key) - \(value)")
}


for key in months.keys {
  if let value = months[key] {
    print(" \(key) \(value)")
  } else {
    print(" no value for key \(key)")
  }
}

//3

var emptyChessDeck = [String : Bool]()
let eCDSize   = 8
let cellNames = "ABCDEFGH"
let blackCell = " \u{25FB}"
let whiteCell = " \u{25fc}"

print("  A  B C D  E F  G H")
for i in 0..<eCDSize {
    print("\(eCDSize - i)", terminator: "")
    for column in 0..<eCDSize {
        let range = Range(uncheckedBounds: (lower: cellNames.startIndex, upper: cellNames.endIndex))
        var lineName = cellNames.substring(with: range)
        let oneCellName = lineName + String(column + 1)
        emptyChessDeck[oneCellName] = (column + i) % 2 != 0 ? true : false
        print((i + column) % 2 == 1 ? blackCell : whiteCell,  terminator: "")
        if column == eCDSize - 1 {
            print()
        }
    }
}
 

