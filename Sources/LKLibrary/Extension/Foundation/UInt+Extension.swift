//
//  UInt+Extension.swift
//  JKSwiftExtension
//
//  Created by IronMan on 2020/10/10.
//

import UIKit
extension UInt: LKExCompatible {}
// MARK: - 一、UInt 与其他类型的转换
public extension LKEx where Base == UInt {
    // MARK: 1.1、转 Int
    /// 转 Int
    var uintToInt: Int { return Int(self.base) }
}
