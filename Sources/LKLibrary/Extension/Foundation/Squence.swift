//
//  File.swift
//  
//
//  Created by Enter on 2022/5/31.
//

import Foundation

public extension Sequence where Element: AdditiveArithmetic {
    /// Returns the total sum of all elements in the sequence
    func sum() -> Element { reduce(.zero, +) }
}
