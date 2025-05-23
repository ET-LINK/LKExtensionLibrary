//
//  CommonFont.swift
//  VoiceAssistant
//
//  Created by Enter M1 on 2024/5/21.
//

/*
 iOS 默认字体样式与大小对照表

     1.    largeTitle: 大标题（默认字体大小为 34pt）
     •    用于页面的主要标题，通常在导航栏中。
     2.    title: 一级标题（默认字体大小为 28pt）
     •    用于内容层级较高的标题。
     3.    title2: 二级标题（默认字体大小为 22pt）
     •    引入于 iOS 14，通常用于层次较低的标题。
     4.    title3: 三级标题（默认字体大小为 20pt）
     •    引入于 iOS 14，进一步细化的标题层级。
     5.    headline: 标题（默认字体大小为 17pt）
     •    用于显示重要的文本，例如新闻标题。
     6.    subheadline: 副标题（默认字体大小为 15pt）
     •    用于次要信息，通常作为 headline 的补充。
     7.    body: 正文（默认字体大小为 17pt）
     •    用于常规内容的显示，是最常用的字体样式。
     8.    callout: 标注（默认字体大小为 16pt）
     •    用于需要引起注意的次要信息。
     9.    footnote: 脚注（默认字体大小为 13pt）
     •    用于显示附加说明或注解信息。
     10.    caption: 标注（默认字体大小为 12pt）
     •    用于图片或者其他内容的简短说明。
     11.    caption2: 辅助标注（默认字体大小为 11pt）
     •    引入于 iOS 14，通常用于进一步说明的次要标注。
 */


import Foundation
import SwiftUI
import UIKit // 确保导入 UIKit

// MARK: - SwiftUI Font Extension
public extension Font {
    /// size 32
    public struct BigTitle {
        public static let bold = Font.system(size: 32, weight: .bold, design: .default)
        public static let semibold = Font.system(size: 32, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 32, weight: .regular, design: .default)
    }
    /// size 24
    public struct TitleLv1 {
        public static let bold = Font.system(size: 24, weight: .bold, design: .default)
        public static let semibold = Font.system(size: 24, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 24, weight: .regular, design: .default)
    }
    /// size 18
    public struct TitleLv2 {
        public static let bold = Font.system(size: 18, weight: .bold, design: .default)
        public static let semibold = Font.system(size: 18, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 18, weight: .regular, design: .default)
    }

    /// size 16
    public struct Body {
        public static let bold = Font.system(size: 16, weight: .bold, design: .default)
        public static let semibold = Font.system(size: 16, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 16, weight: .regular, design: .default)
    }
    /// size 14
    public struct Subhead {
        public static let bold = Font.system(size: 14, weight: .bold, design: .default)
        public static let semibold = Font.system(size: 14, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 14, weight: .regular, design: .default)
    }

    /// size 12
    public struct Caption1 {
        public static let semibold = Font.system(size: 12, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 12, weight: .regular, design: .default)
    }

    /// size 10
    public struct Caption2 {
        public static let semibold = Font.system(size: 10, weight: .semibold, design: .default)
        public static let regular = Font.system(size: 10, weight: .regular, design: .default)
    }

    // --- Number Fonts (Rounded Design) ---
    /// size 40, rounded
    public struct Number40 {
        public static let bold = Font.system(size: 40, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 40, weight: .regular, design: .rounded)
    }
    /// size 32, rounded
    public struct Number32 {
        public static let bold = Font.system(size: 32, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 32, weight: .regular, design: .rounded)
    }
    /// size 24, rounded
    public struct Number24 {
        public static let bold = Font.system(size: 24, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 24, weight: .regular, design: .rounded)
    }
    /// size 20, rounded
    public struct Number20 {
        public static let bold = Font.system(size: 20, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 20, weight: .regular, design: .rounded)
    }
    /// size 16, rounded
    public struct Number16 {
        public static let bold = Font.system(size: 16, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 16, weight: .regular, design: .rounded)
    }
    /// size 14, rounded
    public struct Number14 {
        public static let bold = Font.system(size: 14, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 14, weight: .regular, design: .rounded)
    }
    /// size 12, rounded
    public struct Number12 {
        public static let bold = Font.system(size: 12, weight: .bold, design: .rounded)
        public static let regular = Font.system(size: 12, weight: .regular, design: .rounded)
    }
}


// MARK: - UIKit UIFont Extension
public extension UIFont {

    // Helper for rounded system fonts
    private static func roundedSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        // Attempt to get the rounded font descriptor
        guard let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(.rounded) else {
            // Fallback to non-rounded system font if rounded isn't available (shouldn't happen for standard system fonts)
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        // Create the font with the rounded descriptor
        return UIFont(descriptor: descriptor, size: size)
    }

    /// size 32
    public struct BigTitle {
        public static let bold = UIFont.systemFont(ofSize: 32, weight: .bold)
        public static let semibold = UIFont.systemFont(ofSize: 32, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 32, weight: .regular)
    }
    /// size 24
    public struct TitleLv1 {
        public static let bold = UIFont.systemFont(ofSize: 24, weight: .bold)
        public static let semibold = UIFont.systemFont(ofSize: 24, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 24, weight: .regular)
    }
    /// size 18
    public struct TitleLv2 {
        public static let bold = UIFont.systemFont(ofSize: 18, weight: .bold)
        public static let semibold = UIFont.systemFont(ofSize: 18, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 18, weight: .regular)
    }

    /// size 16
    public struct Body {
        public static let bold = UIFont.systemFont(ofSize: 16, weight: .bold)
        public static let semibold = UIFont.systemFont(ofSize: 16, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    /// size 14
    public struct Subhead {
        public static let bold = UIFont.systemFont(ofSize: 14, weight: .bold)
        public static let semibold = UIFont.systemFont(ofSize: 14, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    /// size 12
    public struct Caption1 {
        public static let semibold = UIFont.systemFont(ofSize: 12, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 12, weight: .regular)
    }

    /// size 10
    public struct Caption2 {
        public static let semibold = UIFont.systemFont(ofSize: 10, weight: .semibold)
        public static let regular = UIFont.systemFont(ofSize: 10, weight: .regular)
    }

    /// size 40, rounded
    public struct Number40 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 40, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 40, weight: .regular)
    }
    /// size 32, rounded
    public struct Number32 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 32, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 32, weight: .regular)
    }
    /// size 24, rounded
    public struct Number24 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 24, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 24, weight: .regular)
    }
    /// size 20, rounded
    public struct Number20 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 20, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 20, weight: .regular)
    }
    /// size 16, rounded
    public struct Number16 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 16, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 16, weight: .regular)
    }
    /// size 14, rounded
    public struct Number14 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 14, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 14, weight: .regular)
    }
    /// size 12, rounded
    public struct Number12 {
        public static let bold = UIFont.roundedSystemFont(ofSize: 12, weight: .bold)
        public static let regular = UIFont.roundedSystemFont(ofSize: 12, weight: .regular)
    }
}

public extension Font {
    public static func outfit(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let weightString: String
        switch weight {
        case .bold: weightString = "Bold"
        case .semibold: weightString = "SemiBold"
        default: weightString = "Regular"
        }
        return .custom("Outfit-\(weightString)", size: size)
    }
}

public extension UIFont {
    public static func outfit(size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont? {
        let weightString: String
        switch weight {
        case .bold: weightString = "Bold"
        case .semibold: weightString = "SemiBold"
        default: weightString = "Regular"
        }
        return UIFont(name: "Outfit-\(weightString)", size: size)
    }
}
