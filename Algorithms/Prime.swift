extension Int {
    
    // Returns true if a given number is prime, false otherwise
	func isPrime() -> Bool {
	    if self <= 1 { return false }
	    if self <= 3 { return true }
	    
        // All primes are of the form 6k ± 1
        // This is because all integers can be expressed as (6k + i) with i in (-1, 0, 1, 2, 3, 4) exepted 2 and 3
        // 2 divides (6k + 0), (6k + 2), (6k + 4) and 3 divides (6k + 3)
        // Other than 2 and 3, we only need to check numbers of form (6k ± 1) < sqrt(n)
        // Source : https://en.wikipedia.org/wiki/Primality_test
	    
	    // First test if divided by 2 or 3
	    if self % 2 == 0 || self % 3 == 0 { return false }
	    
	    // Then test if divided by numbers of form (6k ± 1) < sqrt(n)
        var i = 6
        while i * i <= self {
            if self % (i - 1) == 0 || self % (i + 1) == 0 { return false }
            i = i + 6
        }
        return true
	}
	
	// Returns all prime factors of an given integer
	func primeFactorize() -> [Int] {
	    if self.isPrime() {
	        return [self]
	    }
	    for integer in 2...self {
            if self % integer == 0 {
                return [integer] + (self/integer).primeFactorize()
            }
        }
	    return []
	}
}

// Example
for number in 1...10000 {
    if number.isPrime() { print(number) }
}
