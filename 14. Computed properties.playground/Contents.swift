//1. Самостоятельно повторить проделанное в уроке
import Foundation

enum DateFormat: String {
  case year = "YYYY"
  case month = "MM"
  case day = "dd"
}

func convertIntoAppropriate(dateFormat: DateFormat) -> Int {
  let currentDate = Date()
  let dateFormatt = DateFormatter()
  dateFormatt.dateFormat = dateFormat.rawValue
  return Int(dateFormatt.string(from: currentDate))!
  
}


struct Student {
  var firstName: String {
    willSet {
      print("will set " + newValue + " insteaad of " + firstName)
    }
    didSet {
      print("Already set " + firstName + " and it was " + oldValue)
      firstName = firstName.capitalized
    }
  }
  var lastName: String {
    didSet {
      lastName = lastName.capitalized
    }
  }
  var fullName: String {
    get {
      return firstName + " " + lastName
    }
    set {
      print("full name wants to be set to: " + newValue)
      let words = newValue.components(separatedBy: " ")
      if words.count > 0 {
        firstName = words[0]
      }
      if words.count > 1 {
        lastName = words[1]
      }
    }
  }
  var dateOfBirth: DateOfBirth

  
  struct DateOfBirth {
    var day: Int {
      didSet {
        if day < 1 || day > 31 {
          day = 1
          print("Day will be set \(day)")
        }
      }
    }
    
    var month: Month
    
    var year: Int {
      didSet {
        if year < 1900 {
          year = 1900
          print("Year will be set \(year)")
        }
      }
    }
    
    enum Month: Int {
      case January = 1
      case February
      case March
      case April
      case May
      case June
      case July
      case August
      case September
      case October
      case November
      case December
    }
  }
  
  var age: Int {
    let currentYear = convertIntoAppropriate(dateFormat: .year)
    let currentMonth = convertIntoAppropriate(dateFormat: .month)
    let currentDay = convertIntoAppropriate(dateFormat: .day)
    return (dateOfBirth.month.rawValue < currentMonth) || (dateOfBirth.month.rawValue == currentMonth && dateOfBirth.day <= currentDay) ? currentYear - dateOfBirth.year : 2017 - dateOfBirth.year - 1
  }
  
  var ageOfStudies: Int {
    return age > 6 ? age - 6 : 0
  }
}

var some = Student(firstName: "Violetta", lastName: "Illarionova", dateOfBirth: Student.DateOfBirth(day: 2, month: .July, year: 1993))
some.firstName
some.lastName
some.fullName
some.firstName = "ZhanEtta"
some.fullName
some.fullName = "ViolettushKa Illarionova"
some.fullName
func printStudentData(student: Student) {
  print("Student \(student.firstName) \(student.lastName), \(student.age) year, \(student.ageOfStudies) year of studies")
}
printStudentData(student: some)

//
//3. 3. Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
//Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
//-midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
//-длина отрезка (при изменении, точка "А" остается, а точка "В" движется)


struct Segment {
  
  struct Point {
    var x: Double
    var y: Double
  }
  
  var pointA: Point
  var pointB: Point
  
  var middlePoint: Point {
    get {
      let midPointX = (pointA.x + pointB.x) / 2
      let midPointY = (pointA.y + pointB.y) / 2
      return Point(x: midPointX, y: midPointY)
    }
    set {
      let anotherX = newValue.x - middlePoint.x
      let anotherY = newValue.y - middlePoint.y
      
      pointA.x += anotherX
      pointB.x += anotherX
      
      pointA.y += anotherY
      pointB.y += anotherY
    }
  }
  
  var length: Double {
    get {
      return sqrt( pow((pointB.x - pointA.x), 2.0) + pow((pointB.y - pointA.y), 2.0))
    }
    set {
      pointB = Point(x:pointA.x + (pointB.x - pointA.x) * newValue / length, y: pointA.y + (pointB.y - pointB.y) * newValue / length)
    }
  }
} 

var someSegment = Segment(pointA: Segment.Point(x: 1, y: 5), pointB: Segment.Point(x: 15, y: 30))

someSegment.length
someSegment.middlePoint.x
someSegment.middlePoint.y












