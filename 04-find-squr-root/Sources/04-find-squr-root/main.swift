import Foundation

enum FindSquareRootError: Error {
  case outOfBounds
  case noRoot
}

func findSquareRoot(_ number: Int) throws -> Int {
  let boundaryMin = 1
  let boundaryMax = 10_000

  guard boundaryMin <= number && number <= boundaryMax else {
    throw FindSquareRootError.outOfBounds
  }

  for num in boundaryMin...boundaryMax {
    let sqrtValue = num * num

    if sqrtValue == number {
      return num
    }
    if sqrtValue > number {
      break
    }
  }

  throw FindSquareRootError.noRoot
}

do {
  let result = try findSquareRoot(9)
  print(result)
} catch FindSquareRootError.outOfBounds {
  print("out of bounds")
} catch FindSquareRootError.noRoot {
  print("no root")
}
