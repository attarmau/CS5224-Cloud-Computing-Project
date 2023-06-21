func factorial(of number: Int) -> Int {
    if number == 0 {
        return 1
    }
    
    var result = 1
    for i in 1...number {
        result *= i
    }
    
    return result
}

// Test the factorial function
let number = 5
let result = factorial(of: number)
print("The factorial of \(number) is \(result)")
