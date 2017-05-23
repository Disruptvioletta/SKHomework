//Сегодня будем строить свою небольшую социальную сеть.
//1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).

//Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
//Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд

//2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
//У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
//Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
//3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
//Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
//Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
//Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
//
//Обязательно используем в заданиях Optional chaining и Type casting

class Human {
  var mother: Female?
  var father: Male?
  var brothers: [Male]?
  var sisters: [Female]?
  var pets: [Pet]?
}

class Male: Human {
  func move() {
    print("I can move mountains for you, dear")
  }
}

class Female: Human {
  func askMan() {
    print("Can you help me?")
  }
}

class Pet {
  func makeASound() {
    print("kek")
  }
}

class Cat: Pet {
  override func makeASound() {
    print("Meow meow")
  }
}

class Dog: Pet {
  override func makeASound() {
    print("Woof")
  }
}

func generate() -> (Male, [Human]) {
  let males = [Male(), Male(), Male(), Male(), Male(), Male()]
  let females = [Female(), Female(), Female(), Female(), Female(), Female()]
  
  let human = males[4]
  
  human.father = males[0]
  human.mother = females[0]
  
  // uncles
  
  human.mother?.brothers = [males[1],males[2]]
  
  // aunts
  
  human.mother?.sisters = [females[1]]
  human.father?.sisters = [females[2], females[3], females[4]]
  
  //grandFather
  
  human.father?.father = males[3]
  
  // grandMother
  human.mother?.mother = females[5]
  // pets
  
  human.mother?.pets = [Dog()]
  human.father?.pets = [Cat(), Cat()]
  
  
  return (human, males as [Human] + females)
}

let (human, humans) = generate()

var count = (aunts: 0, uncles: 0, females: 0, males: 0, dogs: 0, cats: 0)

count.uncles += human.mother?.brothers?.count ?? 0
count.aunts += human.mother?.sisters?.count ?? 0
count.aunts += human.father?.sisters?.count ?? 0

for i in humans {
  if let hu = i as? Male {
    count.males += 1
    hu.move()
  } else if let hu = i as? Female {
    count.females += 1
    hu.askMan()
  }
}

for SOMEhuman in humans {
  if SOMEhuman.pets == nil {
    continue
  }
  
  for pet in SOMEhuman.pets! {
    switch pet {
    case is Dog: count.dogs += 1
      pet.makeASound()
    case is Cat: count.cats += 1
      pet.makeASound()
    default: break
    }
    
  }
}


print(count)








