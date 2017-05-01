

// 4.1

let one = Int("5555")
let two = Int("B44")
let three = Int("Zayn77")
let four = Int("Don't 404")
let five = Int("778811")

var resultOfFirstTask = 0

// Optional binding
if let a = one {
  resultOfFirstTask += a
}

if let a = two {
  resultOfFirstTask += a
}

if let a = three {
  resultOfFirstTask += a
}

if let a = four {
  resultOfFirstTask += a
}

if let a = five {
  resultOfFirstTask += a
}

print(resultOfFirstTask)
// forced unwrapping

var fuResultTaskOne = 0

if one != nil {
  fuResultTaskOne = fuResultTaskOne + one!
}
if two != nil {
  fuResultTaskOne = fuResultTaskOne + two!
}

if three != nil {
  fuResultTaskOne = fuResultTaskOne + three!
}

if four != nil {
  fuResultTaskOne = fuResultTaskOne + four!
}

if five != nil {
  fuResultTaskOne = fuResultTaskOne + five!
}

print(fuResultTaskOne)

// 4.2

let serverTupleParameters: (statusCode: Int, message: String?, errorMessage: String?) = (50, "Status Code is within range bounds", " Status Code is out of range")

if serverTupleParameters.statusCode >= 200 && serverTupleParameters.statusCode <= 300 {
  print(serverTupleParameters.message!)
} else {
  print(serverTupleParameters.errorMessage!)
}
// second part of assignment

let specialServerInformation: (message: String?, errorMessage: String?) = ("Hello, iOS development", nil)

if let serverInfo = specialServerInformation.message {
  print(serverInfo)
} else if let infoMessage = specialServerInformation.errorMessage {
  print(infoMessage)
}

let secretServerInformation:  (message: String?, errorMessage: String?) = (nil, "NSNotFound ")

if secretServerInformation.message != nil {
  print(secretServerInformation.message!)
} else {
  print(secretServerInformation.errorMessage!)
}

// 4.3

let student1: (studentName: String?, studentCarNumber: Int?, mark: Int?)
let student2: (studentName: String?, studentCarNumber: Int?, mark: Int?)
let student3: (studentName: String?, studentCarNumber: Int?, mark: Int?)
let student4: (studentName: String?, studentCarNumber: Int?, mark: Int?)
let student5: (studentName: String?, studentCarNumber: Int?, mark: Int?)
let student6: (studentName: String?, studentCarNumber: Int?, mark: Int?)

student1 = ("Dmitry", nil, 5)
student2 = ("Rosie", nil, nil)
student3 = ("Ksenia",88888, nil)
student4 = ("Victoria", 11111, 4)
student5 = ("Paris", 99999, 5)
student6 = ("David", 55555, 4)

if student1.studentCarNumber != nil {
  print(" Student \(student1.studentName!) has a car \(student1.studentCarNumber!) ")
} else {
  print(" Student \(student1.studentName!) has no car")
}

if student1.mark != nil {
  print(" Student \(student1.studentName!) completed a test with mark \(student1.mark!) ")
} else {
  print(" Student \(student1.studentName!) didn't attend a test ")
}


if let pupilAutoMobileNumber = student2.studentCarNumber {
  print("Student \(student2.studentName!) has a carNumber \(pupilAutoMobileNumber) ")
} else {
  print("Student \(student2.studentName!) has no car ")
}

if let pupilAssessment = student2.mark {
  print("Student \(student2.studentName!) has completed test with mark: \(pupilAssessment) ")
} else {
  print("Student \(student2.studentName!) decided not to attend a test ")
}


if student3.studentCarNumber == nil {
  print(" Student \(student3.studentName!) insufficient in funds to purchase a car ")
} else {
  print(" Student \(student3.studentName!) has a car with number: \(student3.studentCarNumber!) ")
}

if student3.mark == nil {
  print("Student \(student3.studentName!) has been ill during test assignment")
} else {
  print("Student \(student3.studentName!) received a mark \(student3.mark!)")
}

if let autoMobileRegistrationNumber = student4.studentCarNumber {
  print(" student \(student4.studentName!) owns a car with government registrated number: \(autoMobileRegistrationNumber) ")
} else {
  print(" student \(student4.studentName!) doesn't own a car")
}

if let testScore = student4.mark {
  print(" We evaluated \(student4.studentName!) knowledge on \(testScore) mark")
} else {
  print(" We couldn't evaluate \(student4.studentName!) knowledge due to unattendance of aforementioned")
}


if let parkingLotClient = student5.studentCarNumber {
  print("Our favorite client \(student5.studentName!)  drives a car with Government number: \(parkingLotClient) please, pay attention to Sir or Madam")
} else {
  print(" Student \(student5.studentName!) has got no car")
}

if let temporaryEstimationOfKnowledge = student5.mark {
  print(" Our precious student \(student5.studentName!) has derived a strong and definite : \(temporaryEstimationOfKnowledge) at the test" )
} else {
  print(" A human being \(student5.studentName!)decided to stay out of danger and out of subjective assessments")
}

//extra credit

student6.studentCarNumber != nil ? print("Student \(student6.studentName!) has a car w/ number \(student6.studentCarNumber!)") : print(" Student \(student6.studentName!)  doesnt't own any car")

student6.mark == nil ? print("\(student6.studentName!) test mark \(student6.mark!) ") : print(" \(student6.studentName!) passed no tests")





















