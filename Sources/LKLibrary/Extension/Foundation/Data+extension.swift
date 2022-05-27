//
//  Data+extension.swift
//  JKSwiftExtension
//
//  Created by IronMan on 2020/11/28.
//

import UIKit
extension Data: LKExCompatible {}
// MARK: - 一、基本的扩展
public extension LKEx where Base == Data {

    // MARK: 1.1、base64编码成 Data
    /// 编码
    var encodeToData: Data? {
        return self.base.base64EncodedData()
    }
    
    // MARK: 1.2、base64解码成 Data
    /// 解码成 Data
    var decodeToDada: Data? {
        return Data(base64Encoded: self.base)
    }
    
    // MARK: 1.3、转成bytes
    /// 转成bytes
    var bytes: [UInt8] {
        return [UInt8](self.base)
    }
    
    
    
}



public extension  Data {
    
    /// 范型转Data, 如: Int64->Data
    /// - Parameter value: 范型
    init<T>(from value: T) {
        self = Swift.withUnsafeBytes(of: value) { Data($0)}
    }
    
    
    /// Data转范型, 如: Data->Int64
    /// - Parameter type: 类型
    /// - Returns: 范型
    func to <T>(type: T.Type) -> T? where T: ExpressibleByIntegerLiteral {
        var value: T = 0
        guard count >= MemoryLayout.size(ofValue: value) else {
            return nil
        }
        _ = Swift.withUnsafeMutableBytes(of: &value, { copyBytes(to: $0) })
        return value
    }
    
    
    /// 范型数组转Data, 如: [Int64]->Data
    /// - Parameter values: 范型数组
    init<T>(fromArray values: [T]) {
        self = values.withUnsafeBytes { Data($0)}
    }
    
    
    /// Data转范型数组, 如: Data->[Int64]
    /// - Parameter arrayType: 类型
    /// - Returns: 范型数组
    func to<T>(arrayType: T.Type) -> [T]? where T: ExpressibleByIntegerLiteral {
        var array = Array<T>(repeating: 0, count: self.count/MemoryLayout<T>.stride)
        _ = array.withUnsafeMutableBytes { copyBytes(to: $0) }
        return array
    }
    
    
    /// Hex字符串转Data
    /// - Parameter hex: Hex字符串
    init(hex: String) {
        self.init(Array<UInt8>(hex: hex))
    }

}

