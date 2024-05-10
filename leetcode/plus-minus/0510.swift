func plusMinus(arr: [Int]) -> Void {
    let len = Double(arr.count)
    var dict: [String: Double] = ["+": 0, "-": 0, "0": 0]
    
    for num in arr {
        switch num {
            case _ where num > 0:
                let posValue = dict["+"]!
                dict.updateValue(posValue + 1, forKey: "+")
            case _ where num < 0:
                let negValue = dict["-"]!
                dict.updateValue(negValue + 1, forKey: "-")
            default:
                let zeroValue = dict["0"]!
                dict.updateValue(zeroValue + 1, forKey: "0")
        }
    }
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 6
    formatter.maximumFractionDigits = 6
    
    let positiveRatio = Double(round((dict["+"]! / len * 1000000)) / 1000000)
    let negRatio = Double(round((dict["-"]! / len * 1000000)) / 1000000)
    let zeroRatio = Double(round((dict["0"]! / len * 1000000)) / 1000000)
    
    print("\(formatter.string(for: positiveRatio)!)")
    print("\(formatter.string(for: negRatio)!)")
    print("\(formatter.string(for: zeroRatio)!)")
}