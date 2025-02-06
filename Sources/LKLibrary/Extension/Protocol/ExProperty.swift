//
//  File.swift
//  
//
//  Created by Enter on 2022/5/27.
//

import UIKit
import Foundation
public struct LKEx<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol LKExCompatible {}

public extension LKExCompatible {
    
    static var ex: LKEx<Self>.Type {
        get{ LKEx<Self>.self }
        set {}
    }
    
    var ex: LKEx<Self> {
        get { LKEx(self) }
        set {}
    }
}

/// Define Property protocol
internal protocol LKSwiftPropertyCompatible {
  
    /// Extended type
    associatedtype T
    
    ///Alias for callback function
    typealias SwiftCallBack = ((T?) -> ())
    
    ///Define the calculated properties of the closure type
    var swiftCallBack: SwiftCallBack?  { get set }
}
