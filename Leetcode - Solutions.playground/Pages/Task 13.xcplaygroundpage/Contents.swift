import Foundation

let testData: String = "MDCXCV"

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
        var iter: Int = 0
        if s.count == 1 { return symbols[s[0]] ?? 0 }
        repeat {
            if iter >= s.count-1 { break }
            let current: Character = s[iter]
            let next: Character    = s[iter + 1]
            var twoCharFlag: Bool = false
            guard
                let currentValue = symbols[current],
                let nextValue = symbols[next]
            else {
                continue
            }
            if currentValue < nextValue {
                sum += nextValue - currentValue
                twoCharFlag = true
            }
            else {
                sum += symbols[current] ?? -1
            }
            iter += 1
            if twoCharFlag { iter += 1 }
        } while true
        
        guard
            let lastValue  = symbols[s[s.count - 1]],
            let beforeLast = symbols[s[s.count - 2]]
        else {
            return sum
        }
        sum += lastValue <= beforeLast ? lastValue : 0
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
