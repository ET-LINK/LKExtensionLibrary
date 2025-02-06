//
//  Array+Extension.swift
//  JKSwiftExtension
//
//  Created by IronMan on 2020/9/7.
//

import Foundation

// MARK: - 数组 的基本扩展
public extension Array {
    
    /// 安全的取某个索引的值
    /// - Parameter index: 索引
    /// - Returns: 对应 inde 的 value
    func indexValue(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /// 从数组中返回一个随机元素
    var sample: Element? {
        //如果数组为空，则返回nil
        guard count > 0 else { return nil }
        let randomIndex = Int(arc4random_uniform(UInt32(count)))
        return self[randomIndex]
    }
    
    /// 从数组中从返回指定个数的元素
    ///
    /// - Parameters:
    ///   - size: 希望返回的元素个数
    ///   - noRepeat: 返回的元素是否不可以重复（默认为false，可以重复）
    func sample(size: Int, noRepeat: Bool = false) -> [Element]? {
        //如果数组为空，则返回nil
        guard !isEmpty else { return nil }
        
        var sampleElements: [Element] = []
        
        //返回的元素可以重复的情况
        if !noRepeat {
            for _ in 0..<size {
                sampleElements.append(sample!)
            }
        }
            //返回的元素不可以重复的情况
        else{
            //先复制一个新数组
            var copy = self.map { $0 }
            for _ in 0..<size {
                //当元素不能重复时，最多只能返回原数组个数的元素
                if copy.isEmpty { break }
                let randomIndex = Int(arc4random_uniform(UInt32(copy.count)))
                let element = copy[randomIndex]
                sampleElements.append(element)
                //每取出一个元素则将其从复制出来的新数组中移除
                copy.remove(at: randomIndex)
            }
        }
        
        return sampleElements
    }
    
}

// MARK: - 二、数组 有关索引 的扩展方法
public extension Array where Element : Equatable {
    
    /// 获取数组中的指定元素的索引值
    /// - Parameter item: 元素
    /// - Returns: 索引值数组
    func indexes(_ item: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0..<count where self[index] == item {
            indexes.append(index)
        }
        return indexes
    }
    
}

// MARK: - 三、遵守 Equatable 协议的数组 (增删改查) 扩展
public extension Array where Element : Equatable {
    
    // MARK: 3.1、删除数组的中的元素(可删除第一个出现的或者删除全部出现的)
    /// 删除数组的中的元素(可删除第一个出现的或者删除全部出现的)
    /// - Parameters:
    ///   - element: 要删除的元素
    ///   - isRepeat: 是否删除重复的元素
    @discardableResult
    mutating func remove(_ element: Element, isRepeat: Bool = true) -> Array {
        var removeIndexs: [Int] = []
        
        for i in 0 ..< count {
            if self[i] == element {
                removeIndexs.append(i)
                if !isRepeat { break }
            }
        }
        // 倒序删除
        for index in removeIndexs.reversed() {
            self.remove(at: index)
        }
        return self
    }
    
    // MARK: 3.2、从删除数组中删除一个数组中出现的元素，支持是否重复删除, 否则只删除第一次出现的元素
    /// 从删除数组中删除一个数组中出现的元素，支持是否重复删除, 否则只删除第一次出现的元素
    /// - Parameters:
    ///   - elements: 被删除的数组元素
    ///   - isRepeat: 是否删除重复的元素
    @discardableResult
    mutating func removeArray(_ elements: [Element], isRepeat: Bool = true) -> Array {
        for element in elements {
            if self.contains(element) {
                self.remove(element, isRepeat: isRepeat)
            }
        }
        return self
    }
}

// MARK: - 四、遵守 NSObjectProtocol 协议对应数组的扩展方法
public extension Array where Element : NSObjectProtocol {
    
    // MARK: 4.1、删除数组中遵守NSObjectProtocol协议的元素，是否删除重复的元素
    /// 删除数组中遵守NSObjectProtocol协议的元素
    /// - Parameters:
    ///   - object: 元素
    ///   - isRepeat: 是否删除重复的元素
    @discardableResult
    mutating func remove(object: NSObjectProtocol, isRepeat: Bool = true) -> Array {
        var removeIndexs: [Int] = []
        for i in 0..<count {
            if self[i].isEqual(object) {
                removeIndexs.append(i)
                if !isRepeat {
                    break
                }
            }
        }
        for index in removeIndexs.reversed() {
            self.remove(at: index)
        }
        return self
    }
    
    // MARK: 4.2、删除一个遵守NSObjectProtocol的数组中的元素，支持重复删除
    /// 删除一个遵守NSObjectProtocol的数组中的元素，支持重复删除
    /// - Parameters:
    ///   - objects: 遵守NSObjectProtocol的数组
    ///   - isRepeat: 是否删除重复的元素
    @discardableResult
    mutating func removeArray(objects: [NSObjectProtocol], isRepeat: Bool = true) -> Array {
        for object in objects {
            if self.contains(where: {$0.isEqual(object)} ){
                self.remove(object: object, isRepeat: isRepeat)
            }
        }
        return self
    }
}

// MARK: - 五、针对数组元素是 String 的扩展
public extension Array where Self.Element == String {
    
    // MARK: 5.1、数组转字符转（数组的元素是 字符串），如：["1", "2", "3"] 连接器为 - ，那么转化后为 "1-2-3"
    /// 数组转字符转（数组的元素是 字符串），如：["1", "2", "3"] 连接器为 - ，那么转化后为 "1-2-3"
    /// - Parameter separator: 连接器
    /// - Returns: 转化后的字符串
    func toStrinig(separator: String = "") -> String {
        return self.joined(separator: separator)
    }
    
    
}

// Hex字符串 和 Array<UInt8>的变化
extension Array where Element == UInt8 {
    
    /// 新建空数组
    /// - Parameter reserveCapacity: 数组大小
    init(reserveCapacity: Int) {
        self = Array<Element>()
        self.reserveCapacity(reserveCapacity)
    }
    
    
    /// 获取当前数组的完整切片
    var slice: ArraySlice<Element> {
        return self[self.startIndex ..< self.endIndex]
    }
    
    /// hex to array
    /// - Parameter hex: array
    public init(hex: String) {
        self.init(reserveCapacity: hex.unicodeScalars.lazy.underestimatedCount)
        var buffer: UInt8?
        var skip = hex.hasPrefix("0x") ? 2 : 0
        for char in hex.unicodeScalars.lazy {
            guard skip == 0 else {
                skip -= 1
                continue
            }
            guard char.value >= 48 && char.value <= 102 else {
                removeAll()
                return
            }
            let v: UInt8
            let c: UInt8 = UInt8(char.value)
            switch c {
            case let c where c <= 57:
                v = c - 48
            case let c where c >= 65 && c <= 70:
                v = c - 55
            case let c where c >= 97:
                v = c - 87
            default:
                removeAll()
                return
            }
            if let b = buffer {
                append(b << 4 | v)
                buffer = nil
            } else {
                buffer = v
            }
        }
        if let b = buffer {
            append(b)
        }
    }
    
    public func toHexString() -> String {
        return `lazy`.reduce("") {
            var s = String($1, radix: 16)
            if s.count == 1 {
                s = "0" + s
            }
            return $0 + s
        }
    }
}

extension Array {
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

