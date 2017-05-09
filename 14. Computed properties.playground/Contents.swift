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

    //2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
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
  print("Student \(student.firstName) \(student.lastName), \(student.age) year, \(student.ageOfStudies) year studies")
}

printStudentData(student: some)


//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B

