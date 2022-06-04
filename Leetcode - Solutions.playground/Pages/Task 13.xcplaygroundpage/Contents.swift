import Foundation

let testData: String = "CMXCVI"

class Solution {
    func romanToInt(_ s: String) -> Int {
        var sum: Int = 0
        let symbols = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ] as [Character: Int]
        if s.count == 1 { return symbols[s[0]] ?? 0 }
        for iter in 0..<s.count {
            let currentValue: Int = symbols[s[iter]] ?? 0
            if iter < s.count-1 && currentValue < symbols[s[iter + 1]] ?? 0 {
                sum -= currentValue
            }
            else {
                sum += currentValue
            }
        }
        return sum
    }
}

extension String {
    subscript(_ i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

let solution = Solution()
print(solution.romanToInt(testData))
