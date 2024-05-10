import Foundation

class Animal {
  let legs: Int
  init (legs: Int) {
    self.legs = legs
  }

  func speak() {
    print("the animal speaks")
  }
}

class Dog: Animal {
  init() {
    super.init(legs: 4)
  }

  override func speak() {
    print("Woof!")
  }
}

class Cat: Animal {
  let isTame: Bool

  init() {
    self.isTame = true
    super.init(legs: 4)
  }

  override func speak() {
    print("Meow!")
  }
}

class Corgi: Dog {
  override func speak() {
    print("Corgi Woof!")
  }
}

class Poodle: Dog {
  override func speak() {
    print("Poodle Woof!")
  }
}

class Persian: Cat {
  override func speak() {
    print("Persian Meow!")
  }
}

class Lion: Cat {
  override func speak() {
    print("Lion Meow!")
  }
}
