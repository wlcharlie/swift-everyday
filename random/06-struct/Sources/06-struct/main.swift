import Foundation
print("Hello, World!")

struct Car {
  var model: String
  var seats: Int
  private var gear: String

  init(model: String, seats: Int, gear: String) {
    self.model = model
    self.seats = seats
    self.gear = gear
  }

  mutating func changeGear(gear: String) {
    self.gear = gear
  }
}
