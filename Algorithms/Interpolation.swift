//
//  Interpolation.swift
//  Algorithms
//
//  Created by Antoine DAUGUET on 16/01/2016.
//  Copyright © 2016 Antoine DAUGUET. All rights reserved.
//

import Foundation

protocol Summable: Equatable {
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
}

protocol Scalable {
    func *(member: Self, factor: Double) -> Self
    func *(factor: Double, member: Self) -> Self
}

// Generic linear interpolation
func linearInterpolate<T where T: Summable, T: Scalable>(p: [T], x: Double) -> T {
    return p[0] + x * (p[1] - p[0])
}

// Generic bilinear interpolation
func bilinearInterpolate<T where T: Summable, T: Scalable>(p: [[T]], x: Double, y: Double) -> T {
    var arr = [T]()
    arr.append(linearInterpolate(p[0], x: y))
    arr.append(linearInterpolate(p[1], x: y))
    return linearInterpolate(arr, x: x)
}

// Generic cubic interpolation
func cubicInterpolate<T where T: Summable, T: Scalable>(p: [T], x: Double) -> T {
    var result = p[1] - p[2]
    result = 3 * (result) + p[3] - p[0]
    result = 4 * p[2] - p[3] + x * (result)
    result = 2 * p[0] - 5 * p[1] + result
    result = p[2] - p[0] + x * (result)
    return p[1] + 0.5 * x * (result)
}

// Generic bicubic interpolation
func bicubicInterpolate<T where T: Summable, T: Scalable>(p: [[T]], x: Double, y: Double) -> T {
    var arr = [T]()
    arr.append(cubicInterpolate(p[0], x: y));
    arr.append(cubicInterpolate(p[1], x: y));
    arr.append(cubicInterpolate(p[2], x: y));
    arr.append(cubicInterpolate(p[3], x: y));
    return cubicInterpolate(arr, x: x)
}
