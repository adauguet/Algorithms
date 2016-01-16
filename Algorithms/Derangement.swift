//
//  Derangement.swift
//  Derangement
//
//  Created by Antoine DAUGUET on 12/01/2016.
//  Copyright © 2016 Antoine DAUGUET. All rights reserved.
//

import Darwin

// Returns a derangement of a given array of elements
func derangement<T>(var array: [T]) -> [T] {
    assert(array.count > 1, "array.count <= 1 !")
    
    var i = array.count - 1
    var u = array.count
    var mark = [Bool](count: array.count, repeatedValue: false)

    // Returns a random integer between 0 and n - 1
    func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    while u >= 2 {
        if !mark[i] {
            var j: Int
            
            // Pick a random unmarked element
            repeat {
                j = random(i)
            } while mark[j]
            
            // swap them
            swap(&array[i], &array[j])
            
            if !mark[j] {
                mark[j] = true
                u--
            }
            u--
        }
        i--
    }
    return array
}