//
//  Date+ISO8601.swift
//  LKLibrary
//
//  Created by Enter M1 on 11/8/24.
//

import Foundation

// MARK: - Date Parsing Extension
public extension String {
    /// ISO8601日期解析错误
    enum ISO8601ParsingError: Error {
        case invalidFormat(String)
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat(let dateString):
                return "Invalid date format: \(dateString)"
            }
        }
    }
    
    /// ISO8601日期格式化器
    private static let iso8601Formatters: [ISO8601DateFormatter] = {
        [
            {
                let formatter = ISO8601DateFormatter()
                formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                return formatter
            }(),
            {
                let formatter = ISO8601DateFormatter()
                formatter.formatOptions = [.withInternetDateTime]
                return formatter
            }(),
            {
                let formatter = ISO8601DateFormatter()
                formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds, .withTimeZone]
                return formatter
            }(),
            {
                let formatter = ISO8601DateFormatter()
                formatter.formatOptions = [.withFullDate, .withFullTime, .withTimeZone]
                return formatter
            }()
        ]
    }()
    
    /// 解析ISO8601格式的日期字符串
    /// - Returns: 解析后的Date对象
    /// - Throws: ISO8601ParsingError 如果解析失败
    func toISO8601Date() throws -> Date {
        for formatter in String.iso8601Formatters {
            if let date = formatter.date(from: self) {
                return date
            }
        }
        throw ISO8601ParsingError.invalidFormat(self)
    }
    
    /// 尝试解析ISO8601格式的日期字符串
    /// - Returns: 解析后的Date对象，如果解析失败返回nil
    func toISO8601DateOrNil() -> Date? {
        try? toISO8601Date()
    }
}

// MARK: - Date Formatting Extension
public extension Date {
    /// 默认的ISO8601格式化器
    private static let defaultISO8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    /// 将日期转换为ISO8601格式的字符串
    /// - Returns: ISO8601格式的日期字符串
    func toISO8601String() -> String {
        Date.defaultISO8601Formatter.string(from: self)
    }
}
