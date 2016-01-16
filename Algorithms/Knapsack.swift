//
//  Knapsack.swift
//  Algorithms
//
//  Created by Antoine DAUGUET on 15/01/2016.
//  Copyright © 2016 Antoine DAUGUET. All rights reserved.
//

import Foundation

protocol KnapsackElement : Hashable, Equatable, CustomStringConvertible {
    var value: Int { get }
    var weight: Int { get }
}

func knapsack<T: KnapsackElement>(values values: [T], W: Int) -> Set<T> {
    
    let n = values.count
    
    var m = Array(count:n + 1, repeatedValue:Array(count:W + 1, repeatedValue:0))
    
    for i in 1...n {
        for j in 0...W {
            if (values[i - 1].weight <= j) {
                m[i][j] = max(m[i - 1][j], m[i - 1][j - values[i - 1].weight] + values[i - 1].value)
            } else {
                m[i][j] = m[i - 1][j]
            }
        }
    }
    
    var elements = Set<T>()
    
    var i = n
    var k = W
    while (i > 0 && k > 0) {
        if m[i][k] != m[i - 1][k] {
            elements.insert(values[i - 1])
            i--
            k -= values[i].weight
        } else {
            i--
        }
    }
    
    return elements
}