//
//  Date+Extension.swift
//  nuannuan
//
//  Created by 王冲 on 2019/12/1.
//  Copyright © 2019 王冲. All rights reserved.
//

import Foundation

extension Date: LKExCompatible {}
/// 时间戳的类型
public enum JKTimestampType: Int {
    /// 秒
    case second
    /// 毫秒
    case millisecond
}

// MARK: - 一、Date 基本的扩展
public extension LKEx where Base == Date {
    // MARK: 1.1、获取当前 秒级 时间戳 - 10 位
    /// 获取当前 秒级 时间戳 - 10 位
    static var secondStamp : String {
        let timeInterval: TimeInterval = Base().timeIntervalSince1970
        return "\(Int(timeInterval))"
    }
    
    // MARK: 1.2、获取当前 毫秒级 时间戳 - 13 位
    /// 获取当前 毫秒级 时间戳 - 13 位
    static var milliStamp : String {
        let timeInterval: TimeInterval = Base().timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
    
    // MARK: 1.3、获取当前的时间 Date
    /// 获取当前的时间 Date
    static var currentDate : Date {
        return Base()
    }
    
    // MARK: 1.4、从 Date 获取年份
    /// 从 Date 获取年份
    var year: Int {
        return jk_calendar.component(Calendar.Component.year, from: self.base)
    }
    
    // MARK: 1.5、从 Date 获取月份
    /// 从 Date 获取年份
    var month: Int {
        return jk_calendar.component(Calendar.Component.month, from: self.base)
    }
    
    // MARK: 1.6、从 Date 获取 日
    /// 从 Date 获取 日
    var day: Int {
        return jk_calendar.component(.day, from: self.base)
    }
    
    // MARK: 1.7、从 Date 获取 小时
    /// 从 Date 获取 日
    var hour: Int {
        return jk_calendar.component(.hour, from: self.base)
    }
    
    // MARK: 1.8、从 Date 获取 分钟
    /// 从 Date 获取 分钟
    var minute: Int {
        return jk_calendar.component(.minute, from: self.base)
    }
    
    // MARK: 1.9、从 Date 获取 秒
    /// 从 Date 获取 秒
    var second: Int {
        return jk_calendar.component(.second, from: self.base)
    }
    
    // MARK: 1.10、从 Date 获取 毫秒
    /// 从 Date 获取 毫秒
    var nanosecond: Int {
        return jk_calendar.component(.nanosecond, from: self.base)
    }
    
    // MARK: 1.11、从日期获取 星期(英文)
    /// 从日期获取 星期
    var weekday: String {
        jk_formatter.dateFormat = "EEEE"
        
        return jk_formatter.string(from: self.base)
    }
    
    // MARK: 1.12、从日期获取 星期(中文)
    var weekdayStringFromDate: Int {
        var calendar = Calendar(identifier: .gregorian)
        let timeZone = TimeZone.current
        calendar.timeZone = timeZone
        let theComponents = calendar.dateComponents([.weekday], from: self.base as Date)
        return  theComponents.weekday! - 1
    }
    
    /// 当月第一天是星期几
    static func monthStartFromWeek() ->Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = jk_calendar
        let components = calendar.dateComponents(Set<Calendar.Component>([.year, .month]), from: Date())
        let startOfMonth = calendar.date(from: components)
        let firstWeekDay = calendar.ordinality(of: .day, in: .weekOfMonth, for: startOfMonth!)
        return firstWeekDay! - 1
    }
    
    /// 本周开始日期
    static func startOfThisWeek() -> Date {
        let date = Date()
        let calendar = jk_calendar
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.yearForWeekOfYear, .weekOfYear]), from: date)
        let startOfWeek = calendar.date(from: components)!
        return startOfWeek
    }
    
    /// 获取一周时间
    func getWeeksDate() -> [Date]? {
        //当前时间
        var calender = jk_calendar
        calender.locale = Locale.current
        var comp = calender.dateComponents([.year, .month, .day, .weekday], from: self.base)

        //当前时间是几号、周几
        let currentDay = comp.day
        let weeKDay = comp.weekday

        //如果获取当前时间的日期和周几失败，返回nil
        guard let day = currentDay, let week = weeKDay else {
            return nil
        }

        //由于1代表的是周日，因此计算出准确的周几
        var currentWeekDay = 0
        if week == 1 {
            currentWeekDay = 1
        } else {
            currentWeekDay = week
        }

        //1 ... 7表示周一到周日
        //进行遍历和currentWeekDay进行比较，计算出之间的差值，即为当前日期和一周时间日期的差值，即可计算出一周时间内准备的日期
        var dates: [Date] = []
        for index in 1 ... 7 {
            let diff = index - currentWeekDay
            comp.day = day + diff
            let date = calender.date(from: comp)
        
            //由于上述方法返回的Date为可选类型，要进行判空处理
            if let _ = date {
                dates.append(date!)
            }
        }

        //返回时间数组
        return dates
    }

    
    // MARK: 1.13、从日期获取 月(英文)
    /// 从日期获取 当前地区的月(英文)
    var monthAsString: String {
        jk_formatter.dateFormat = "MMMM"
        
        return jk_formatter.string(from: self.base)
    }
}

//MARK: - 二、时间格式的转换
// MARK: 时间条的显示格式
public enum JKTimeBarType {
    // 默认格式，如 9秒：09，66秒：01：06，
    case normal
    case second
    case minute
    case hour
}
public extension LKEx where Base == Date {
    
    // MARK: 2.1、时间戳(支持10位和13位)按照对应的格式 转化为 对应时间的字符串
    /// 时间戳(支持10位和13位)按照对应的格式 转化为 对应时间的字符串 如：1603849053 按照 "yyyy-MM-dd HH:mm:ss" 转化后为：2020-10-28 09:37:33
    /// - Parameters:
    ///   - timestamp: 时间戳
    ///   - format: 格式
    ///   - utcZone: 是否使用UTC时区, 否为系统时区
    /// - Returns: 对应时间的字符串
    static func timestampToFormatterTimeString(timestamp: String, format: String = "yyyy-MM-dd HH:mm:ss", utcZone:Bool = false) -> String {
        // 时间戳转为Date
        let date = timestampToFormatterDate(timestamp: timestamp)
        // let dateFormatter = DateFormatter()
        // 设置 dateFormat
        jk_formatter.dateFormat = format
        if utcZone {
            jk_formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        } else {
            jk_formatter.timeZone = .autoupdatingCurrent
        }
        // 按照dateFormat把Date转化为String
        return jk_formatter.string(from: date)
    }
    
    // MARK: 2.2、时间戳(支持 10 位 和 13 位) 转 Date
    /// 时间戳(支持 10 位 和 13 位) 转 Date
    /// - Parameter timestamp: 时间戳
    /// - Returns: 返回 Date
    static func timestampToFormatterDate(timestamp: String) -> Date {
        guard timestamp.count == 10 ||  timestamp.count == 13 else {
            #if DEBUG
            fatalError("时间戳位数不是 10 也不是 13")
            #else
            return Date()
            #endif
        }
        guard let timestampInt = timestamp.ex.toInt() else {
            #if DEBUG
            fatalError("时间戳位有问题")
            #else
            return Date()
            #endif
        }
        let timestampValue = timestamp.count == 10 ? timestampInt : timestampInt / 1000
        // 时间戳转为Date
        let date = Date(timeIntervalSince1970: TimeInterval(timestampValue))
        return date
    }

    
    // MARK: 2.3、Date 转换为相应格式的时间字符串，如 Date 转为 2020-10-28
    /// Date 转换为相应格式的字符串，如 Date 转为 2020-10-28
    /// - Parameter format: 转换的格式
    /// - Parameter utcZone: 是否使用UTC时区, 不用则为系统时区
    /// - Returns: 返回具体的字符串
    func toformatterTimeString(formatter: String = "yyyy-MM-dd HH:mm:ss", utcZone: Bool = false) -> String {
        // let dateFormatter = DateFormatter()
        if utcZone {
            jk_formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        } else {
            jk_formatter.timeZone = .autoupdatingCurrent
        }
        jk_formatter.dateFormat = formatter
        return jk_formatter.string(from: self.base)
    }
    
    // MARK: 2.4、带格式的时间转 时间戳，支持返回 13位 和 10位的时间戳，时间字符串和时间格式必须保持一致
    /// 带格式的时间转 时间戳，支持返回 13位 和 10位的时间戳，时间字符串和时间格式必须保持一致
    /// - Parameters:
    ///   - timeString: 时间字符串，如：2020-10-26 16:52:41
    ///   - formatter: 时间格式，如：yyyy-MM-dd HH:mm:ss
    ///   - timestampType: 返回的时间戳类型，默认是秒 10 为的时间戳字符串
    /// - Returns: 返回转化后的时间戳
    static func formatterTimeStringToTimestamp(timesString: String, formatter: String, timestampType: JKTimestampType = .second, utcZone: Bool = false) -> String {
        jk_formatter.dateFormat = formatter
        if utcZone {
            jk_formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        } else {
            jk_formatter.timeZone = .autoupdatingCurrent
        }
        guard let date = jk_formatter.date(from: timesString) else {
            #if DEBUG
            fatalError("时间有问题")
            #else
            return ""
            #endif
        }
        if timestampType == .second {
            return "\(Int(date.timeIntervalSince1970))"
        }
        return "\(Int((date.timeIntervalSince1970) * 1000))"
    }
    
    // MARK: 2.5、带格式的时间转 Date
    /// 带格式的时间转 Date
    /// - Parameters:
    ///   - timesString: 时间字符串
    ///   - formatter: 格式
    /// - Returns: 返回 Date
    static func formatterTimeStringToDate(timesString: String, formatter: String, utcZone: Bool = false) -> Date {
        jk_formatter.dateFormat = formatter
        if utcZone {
            jk_formatter.timeZone = TimeZone.init(abbreviation: "UTC")
        } else {
            jk_formatter.timeZone = .autoupdatingCurrent
        }
        guard let date = jk_formatter.date(from: timesString) else {
            #if DEBUG
            fatalError("时间有问题")
            #else
            return Date()
            #endif
        }
        /*
        guard let resultDate = getNowDateFromatAnDate(date) else {
            return Date()
        }
        */
        return date
    }
    
    // MARK: 2.6、秒转换成播放时间条的格式
    /// 秒转换成播放时间条的格式
    /// - Parameters:
    ///   - secounds: 秒数
    ///   - type: 格式类型
    /// - Returns: 返回时间条
    static func getFormatPlayTime(seconds: Int, type: JKTimeBarType = .normal) -> String {
        if seconds <= 0{
            return "00:00"
        }
        // 秒
        let second = seconds % 60
        if type == .second {
            return String(format: "%02d", seconds)
        }
        // 分钟
        var minute = Int(seconds / 60)
        if type == .minute {
            return String(format: "%02d:%02d", minute, second)
        }
        // 小时
        var hour = 0
        if minute >= 60 {
            hour = Int(minute / 60)
            minute = minute - hour * 60
        }
        if type == .hour {
            return String(format: "%02d:%02d:%02d", hour, minute, second)
        }
        // normal 类型
        if hour > 0 {
            return String(format: "%02d:%02d:%02d", hour, minute, second)
        }
        if minute > 0 {
            return String(format: "%02d:%02d", minute, second)
        }
        return String(format: "00:%02d", second)
    }
    
    // MARK: 2.7、Date 转 时间戳
    /// Date 转 时间戳
    /// - Parameter timestampType: 返回的时间戳类型，默认是秒 10 为的时间戳字符串
    /// - Returns: 时间戳
    func dateToTimeStamp(timestampType: JKTimestampType = .second) -> String {
        // 10位数时间戳 和 13位数时间戳
        let interval = timestampType == .second ? CLongLong(Int(self.base.timeIntervalSince1970)) : CLongLong(round(self.base.timeIntervalSince1970 * 1000))
        return "\(interval)"
    }
    
    // 转成当前时区的日期
    func dateFromGMT() -> Date {
        let secondFromGMT: TimeInterval = TimeInterval(TimeZone.current.secondsFromGMT(for: self.base))
        return self.base.addingTimeInterval(secondFromGMT)
    }
    
    /// 将日期格式化为标准字符串格式
    /// - Parameters:
    ///   - style: 日期样式 (.short, .medium, .long, .full)
    ///   - timeStyle: 时间样式 (.none, .short, .medium, .long, .full)，默认为.none
    ///   - locale: 区域设置，默认为系统当前区域
    ///   - isRelative: 是否使用相对日期格式化，默认为false
    /// - Returns: 格式化后的日期字符串
    func relativeFormat(
                      style: DateFormatter.Style,
                      timeStyle: DateFormatter.Style = .none,
                      locale: Locale = .current,
                      isRelative: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = timeStyle
        formatter.locale = locale
        formatter.doesRelativeDateFormatting = isRelative
                          return formatter.string(from: self.base)
    }
}

// MARK: - 三、前天、昨天、今天、明天、后天、是否同一年同一月同一天 的判断
public extension LKEx where Base == Date {
    
    // MARK: 3.1、今天的日期
    /// 今天的日期
    static let todayDate: Date = Date()
    
    // MARK: 3.2、昨天的日期（相对于date的昨天日期）
    /// 昨天的日期
    static var yesterDayDate: Date? {
        return jk_calendar.date(byAdding: DateComponents(day: -1), to: Date())
    }
    
    // MARK: 3.3、明天的日期
    /// 明天的日期
    static var tomorrowDate: Date? {
        return jk_calendar.date(byAdding: DateComponents(day: 1), to: Date())
    }
    
    // MARK: 3.4、前天的日期
    /// 前天的日期
    static var theDayBeforYesterDayDate: Date? {
        return jk_calendar.date(byAdding: DateComponents(day: -2), to: Date())
    }
    
    // MARK: 3.5、后天的日期
    /// 后天的日期
    static var theDayAfterYesterDayDate: Date? {
        return jk_calendar.date(byAdding: DateComponents(day: 2), to: Date())
    }
    
    // MARK: 3.6、是否为今天（只比较日期，不比较时分秒）
    /// 是否为今天（只比较日期，不比较时分秒）
    /// - Returns: bool
    var isToday: Bool {
        return jk_calendar.isDate(self.base, inSameDayAs: Date())
    }
    
    // MARK: 3.7、是否为昨天
    /// 是否为昨天
    var isYesterday: Bool {
        // 1.先拿到昨天的 date
        guard let date = Base.ex.yesterDayDate else {
            return false
        }
        // 2.比较当前的日期和昨天的日期
        return jk_calendar.isDate(self.base, inSameDayAs: date)
    }
    /// 上个月
    static var lastMonthDate: Date? {
        return jk_calendar.date(byAdding: DateComponents(month:-1), to: Date())
    }
    
    // MARK: 3.8、是否为前天
    /// 是否为前天
    var isTheDayBeforeYesterday: Bool  {
        // 1.先拿到前天的 date
        guard let date = Base.ex.theDayBeforYesterDayDate else {
            return false
        }
        // 2.比较当前的日期和昨天的日期
        return jk_calendar.isDate(self.base, inSameDayAs: date)
    }
    
    // MARK: 3.9、是否为今年
    /// 是否为今年
    var isThisYear: Bool  {
        let calendar = jk_calendar
        let nowCmps = calendar.dateComponents([.year], from: Date())
        let selfCmps = calendar.dateComponents([.year], from: self.base)
        let result = nowCmps.year == selfCmps.year
        return result
    }
    
    // MARK: 3.10、两个date是否为同一天
    /// 是否为  同一年  同一月 同一天
    /// - Returns: bool
    func isSameDay(date: Date) -> Bool {
        let calendar = jk_calendar
        return calendar.isDate(self.base, inSameDayAs: date)
    }
    
    // MARK: 3.11、当前日期是不是润年
    /// 当前日期是不是润年
    var isLeapYear: Bool {
        let year = base.ex.year
        return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)))
    }
    
    /// 日期的加减操作
    /// - Parameter day: 天数变化
    /// - Returns: date
    private func adding(day: Int) -> Date? {
        return jk_calendar.date(byAdding: DateComponents(day:day), to: self.base)
    }
   
    
    /// 是否为  同一年  同一月 同一天
    /// - Parameter date: date
    /// - Returns: 返回bool
    private func isSameYearMountDay(_ date: Date) -> Bool {
        let com = jk_calendar.dateComponents([.year, .month, .day], from: self.base)
        let comToday = jk_calendar.dateComponents([.year, .month, .day], from: date)
        return (com.day == comToday.day &&
            com.month == comToday.month &&
            com.year == comToday.year )
    }
    
    // MARK: 3.12、是否为本周
    /// 是否为本周
    /// - Returns: 是否为本周
    var isThisWeek: Bool {
        let calendar = jk_calendar
        // 当前时间
        let nowComponents = calendar.dateComponents([.weekOfYear, .year], from: Date())
        // self
        let selfComponents = calendar.dateComponents([.weekOfYear,.year], from: self.base as Date)
        return (selfComponents.year == nowComponents.year) && (selfComponents.weekOfYear == nowComponents.weekOfYear)
    }
    
    /// 是否为  同一年  同一月 同一周
    /// - Returns: bool
    func isSameWeek(date: Date) -> Bool {
        let calendar = jk_calendar
        // date
        let dateComponents = calendar.dateComponents([.weekOfYear, .year], from: date)
        // self
        let selfComponents = calendar.dateComponents([.weekOfYear, .year], from: self.base as Date)
        return (selfComponents.year == dateComponents.year) && (selfComponents.weekOfYear == dateComponents.weekOfYear)
    }
}

// MARK: - 四、相对的时间变化
public extension LKEx where Base == Date {
    
    // MARK: 4.1、取得与当前时间的间隔差
    /// 取得与当前时间的间隔差
    /// - Returns: 时间差
    func callTimeAfterNow() -> String {
        let timeInterval = Date().timeIntervalSince(self.base)
        if timeInterval < 0 {
            return "刚刚"
        }
        let interval = fabs(timeInterval)
        let i60 = interval / 60
        let i3600 = interval / 3600
        let i86400 = interval / 86400
        let i2592000 = interval / 2592000
        let i31104000 = interval / 31104000
        
        var time:String!
        if i3600 < 1 {
            let s = NSNumber(value: i60 as Double).intValue
            if s == 0 {
                time = "刚刚"
            } else {
                time = "\(s)分钟前"
            }
        } else if i86400 < 1 {
            let s = NSNumber(value: i3600 as Double).intValue
            time = "\(s)小时前"
        } else if i2592000 < 1 {
            let s = NSNumber(value: i86400 as Double).intValue
            time = "\(s)天前"
        } else if i31104000 < 1 {
            let s = NSNumber(value: i2592000 as Double).intValue
            time = "\(s)个月前"
        } else {
            let s = NSNumber(value: i31104000 as Double).intValue
            time = "\(s)年前"
        }
        return time
    }
    
    // MARK: 4.2、获取两个日期之间的数据
    /// 获取两个日期之间的数据
    /// - Parameters:
    ///   - date: 对比的日期
    ///   - unit: 对比的类型
    /// - Returns: 两个日期之间的数据
    func componentCompare(from date: Date, unit: Set<Calendar.Component> = [.year,.month,.day]) -> DateComponents {
        let calendar = jk_calendar
        let component = calendar.dateComponents(unit, from: date, to: base)
        return component
    }
    
    func numberOfYears(from date: Date) -> Int? {
        return componentCompare(from: date, unit: [.year]).year
    }
    
    // MARK: 4.3、获取两个日期之间的天数
    /// 获取两个日期之间的天数
    /// - Parameter date: 对比的日期
    /// - Returns: 两个日期之间的天数
    func numberOfDays(from date: Date) -> Int? {
       return componentCompare(from: date, unit: [.day]).day
    }
    
    // MARK: 4.4、获取两个日期之间的小时
    /// 获取两个日期之间的小时
    /// - Parameter date: 对比的日期
    /// - Returns: 两个日期之间的小时
    func numberOfHours(from date: Date) -> Int? {
       return componentCompare(from: date, unit: [.hour]).hour
    }
    
    // MARK: 4.5、获取两个日期之间的分钟
    /// 获取两个日期之间的分钟
    /// - Parameter date: 对比的日期
    /// - Returns: 两个日期之间的分钟
    func numberOfMinutes(from date: Date) -> Int? {
       return componentCompare(from: date, unit: [.minute]).minute
    }
    
    // MARK: 4.6、获取两个日期之间的秒数
    /// 获取两个日期之间的秒数
    /// - Parameter date: 对比的日期
    /// - Returns: 两个日期之间的秒数
    func numberOfSeconds(from date: Date) -> Int? {
       return componentCompare(from: date, unit: [.second]).second
    }
}

// MARK: - 五、某年月份的天数获取
public extension LKEx where Base == Date {
    
    // MARK: 5.1、获取某一年某一月的天数
    /// 获取某一年某一月的天数
    /// - Parameters:
    ///   - year: 年份
    ///   - month: 月份
    /// - Returns: 返回天数
    static func daysCount(year: Int, month: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        case 2:
            let isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
            return isLeapYear ? 29 : 28
        default:
            fatalError("非法的月份:\(month)")
        }
    }
    
    // MARK: 5.2、获取当前月的天数
    /// 获取当前月的天数
    /// - Returns: 返回天数
    static func currentMonthDays() -> Int {
        return daysCount(year: Date.ex.currentDate.ex.year, month: Date.ex.currentDate.ex.month)
    }
}
