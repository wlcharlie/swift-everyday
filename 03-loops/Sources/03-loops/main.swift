import Foundation

for number in 1...100 {
  if number % 3 == 0 && number % 5 == 0 {
    print("FizzBuzz")
    continue
  }

  if number % 3 == 0 {
    print("Fizz")
    continue
  }

  if number % 5 == 0 {
    print("Buzz")
    continue
  }

  print(number)
}
