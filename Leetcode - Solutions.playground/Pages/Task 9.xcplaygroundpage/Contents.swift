import Foundation
let testData: Int = 21

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let str: String = String(x)
        if str.count == 1 { return true }
        for iter in 0...str.count/2-1 {
            let leftChar: Character = str[str.index(str.startIndex, offsetBy: iter)]
            let rightChar: Character = str[str.index(str.endIndex, offsetBy: -iter-1)]
            if leftChar != rightChar { return false }
        }
        return true
    }
}


let solution = Solution()
print(solution.isPalindrome(testData))
