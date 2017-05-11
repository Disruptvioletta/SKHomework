import UIKit
import Foundation

//1. Создать структуру “Описание файла” содержащую свойства:
//- путь к файлу
//- имя файла
//- максимальный размер файла на диске
//- путь к папке, содержащей этот файл
//- тип файла (скрытый или нет)
//- содержимое файла (можно просто симулировать контент)
//
//Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.


struct FileDescription {
  
  static let maximumDiskSpace = Int(4.0 * pow(1024.0, 3.0))
  
  var contentOfFile: String {
    return "I can have it all"
  }
  var fileName: String
  var pathToFolder: String
  var fileType: Bool
  
  var pathToFile: String {
    return pathToFolder + fileName
  }
}

let some = FileDescription(fileName: "SomeName", pathToFolder: "/Home/Documents", fileType: true)
some.pathToFile

//2. Создайте enum, который будет представлять некую цветовую гамму. Этот enum должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

enum Colors: Int {
  static let startColor = Colors.manatee
  static let endColor = Colors.lime
  static let numberOfColors: Int = 4
  static func hexToRGB(hex: Int) -> UIColor {
    
    let red = Double((hex & 0x00FF0000) >> 16) / 255.0
    let green = Double((hex & 0x0000FF00) >> 8) / 255.0
    let blue = Double(hex & 0x000000FF) / 255.0
    let alpha = 1.0
    return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
  }
  case manatee = 0x979aaa
  case azure = 0x007fff
  case snowBlue = 0xace5ee
  case lime = 0x00ff00
}

var shadeOfManatee = Colors.manatee
Colors.hexToRGB(hex: shadeOfManatee.rawValue)


//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии - минимально возможный рост и вес
//- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса

class Human {
  class var maxNameLength: Int {
    return 20
  }
  class var minNameLength: Int {
    return 2
  }
  class var maxAge: Int {
    return 100
  }
  class var minAge: Int {
    return 0
  }
  class var maxWeight: Double {
    return 650.0
  }
  class var minWeight: Double {
    return 0.0
  }
  class var minHeight: Double {
    return 0.3
  }
  class var maxHeight: Double {
    return 2.5
  }
  
  struct InstanceCount {
    static var human = 0
  }
  
  var name: String {
    didSet {
      if name.characters.count > Human.maxNameLength || name.characters.count < Human.minNameLength {
        name = oldValue
      }
    }
  }
  var surname: String {
    didSet {
      if surname.characters.count > Human.maxNameLength || surname.characters.count < Human.minNameLength {
        surname = oldValue
      }
    }
  }
  var age: Int {
    didSet{
      if age > Human.maxAge || age < Human.minAge {
        age = oldValue
      }
    }
  }
  var weight: Double {
    didSet{
      if weight > Human.maxWeight || weight < Human.minWeight {
        weight = oldValue
      }
    }
  }
  
  init(name: String, surname: String, age: Int, weight: Double) {
    self.name = name
    self.surname = surname
    self.age = age
    self.weight = weight
    
    Human.InstanceCount.human += 1
  }
}

let kirill = Human.init(name: "Kirill", surname: "Skobelev", age: 25, weight: 67.0)

Human.InstanceCount.human

kirill.age = 150
kirill

kirill.age = 98
kirill


