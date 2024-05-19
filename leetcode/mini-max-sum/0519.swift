import Foundation

/*
 * Complete the 'miniMaxSum' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    // sort the arr by its num
    guard arr.count == 5 else {
        fatalError("The arr should be just 5 elements")
    }
    
    let sortedArr = arr.sorted()
    let minArr = sortedArr[0..<4]
    let maxArr = sortedArr[1..<5]
    
    let min = minArr.reduce(0) { x, y in
        x + y
    }
    let max = maxArr.reduce(0) { x, y in
        x + y
    }
    
    print("\(min) \(max)")
    
}

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == 5 else { fatalError("Bad input") }

miniMaxSum(arr: arr)
