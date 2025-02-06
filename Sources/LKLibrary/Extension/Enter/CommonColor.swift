//
//  CommonColor.swift
//  VoiceAssistant
//
//  Created by Enter M1 on 2024/5/21.
//

import Foundation
import SwiftUI
import UIKit

public extension Color {
//    public struct Background {
//        /// #F2F2F7 100%  #080A0E 100%
//        public static let bg1 = Color.init("color_bg_lv1")
//        /// #FFFFFF 100%  #1C1C20 100%
//        public static let bg2 = Color.init("color_bg_lv2")
//        /// #E1E6ED 100%  #333333 100%
//        public static let bg3 = Color.init("color_bg_lv3")
//        /// #EBEDF1 100%  ##37373B 100%
//        public static let bgPress = Color.init("color_bg_press")
//        /// #EEEEEE 100%  #2C2B2B 100%
//        public static let bgGray = Color.init("color_bg_gray")
//    }
//    public struct Button {
//        /// #080A0E 100%  #414245 100%
//        public static let bg = Color.init("color_btn_bg")
//        /// #2E3032 100%  #5C5C5C 100%
//        public static let press = Color.init("color_btn_press")
//        /// #FFFFFF 100%  #FFFFFF 100%
//        public static let text = Color.init("color_btn_text")
//        /// #AFAFAF 100%  #7A7A7A 100%
//        public static let disableBg = Color.init("color_btn_bg_disable")
//        /// #FFFFFF 50%  #FFFFFF 50%
//        public static let disableText = Color.init("color_btn_text_disable")
//    }
//    public struct Common {
//        public static let blue = Color.init("color_common_blue")
//        public static let green = Color.init("color_common_green")
//        public static let purple = Color.init("color_common_purple")
//        public static let red = Color.init("color_common_red")
//        public static let yellow = Color.init("color_common_yellow")
//        public static let darkBlue = Color.init("color_common_dark_blue")
//        //color_common_light_purple
//        public static let lightPurple = Color.init("color_common_light_purple")
//    }
//    public struct Deep {
//        /// #080A0E 100%
//        public static let lv1 = Color.init("color_dark_lv1")
//
//        /// #080A0E 70%
//        public static let lv2 = Color.init("color_dark_lv2")
//        /// #080A0E 50%
//        public static let lv3 = Color.init("color_dark_lv3")
//        /// #080A0E 20%
//        public static let lv4 = Color.init("color_dark_lv4")
//    }
//    public struct Light {
//        /// #FFFFFF 100%
//        public static let lv1 = Color.init("color_light_lv1")
//        /// #FFFFFF 70%
//        public static let lv2 = Color.init("color_light_lv2")
//        /// #FFFFFF 50%
//        public static let lv3 = Color.init("color_light_lv3")
//        /// #FFFFFF 20%
//        public static let lv4 = Color.init("color_light_lv4")
//        /// #FFFFFF 10%
//        public static let lv5 = Color.init("color_light_lv5")
//    }
//    public struct Musk {
//        public static let reverse30 = Color.init("color_musk_reverse_30")
//        public static let reverse50 = Color.init("color_musk_reverse_50")
//        public static let same30 = Color.init("color_musk_same_30")
//        public static let same50 = Color.init("color_musk_same_50")
//        public static let same80 = Color.init("color_musk_same_80")
//        public static let same90 = Color.init("color_musk_same_90")
//    }
//    public struct Outline {
//        public static let lv1 = Color.init("color_outline_lv1")
//        public static let lv2 = Color.init("color_outline_lv2")
//    }
//    public struct Line {
//        public static let lv1 = Color.init("color_line_lv1")
//        public static let lv2 = Color.init("color_line_lv2")
//    }
//    public struct Primary {
//        public static let black = Color.init("color_primary_black")
//        public static let blackLv2 = Color.init("color_primary_black_lv2")
//        public static let white = Color.init("color_primary_white")
//    }
//    public struct Text {
//        // 100%
//        public static let lv1 = Color.init("color_text_lv1")
//        // 70%
//        public static let lv2 = Color.init("color_text_lv2")
//        // 50%
//        public static let lv3 = Color.init("color_text_lv3")
//    }
//    public struct Custom {
//        public static let golden = Color.init("color_golden")
//        public static let icon = Color.init("color_icon_icon")
//    }
//
    public struct Gray {
        public static let gray2 = Color(uiColor: UIColor.Gray.gray2!)
        public static let gray3 = Color(uiColor: UIColor.systemGray6)
        public static let gray4 = Color(UIColor.Gray.gray4!)
        public static let gray6 = Color(UIColor.Gray.gray6!)
        public static let gray8 = Color(UIColor.Gray.gray8!)
        public static let gray10 = Color(UIColor.Gray.gray10!)
        public static let gray12 = Color(UIColor.Gray.gray12!)
        public static let gray14 = Color(UIColor.Gray.gray14!)
        public static let gray16 = Color(UIColor.Gray.gray16!)
        public static let gray18 = Color(UIColor.Gray.gray18!)
        public static let gray20 = Color(UIColor.Gray.gray20!)
        public static let gray22 = Color(UIColor.Gray.gray22!)
        public static let gray24 = Color(UIColor.Gray.gray24!)
        public static let gray26 = Color(UIColor.Gray.gray26!)
        public static let gray28 = Color(UIColor.Gray.gray28!)
        public static let gray30 = Color(UIColor.Gray.gray30!)
        public static let gray32 = Color(UIColor.Gray.gray32!)
        public static let gray34 = Color(UIColor.Gray.gray34!)
        public static let gray36 = Color(UIColor.Gray.gray36!)
        public static let gray38 = Color(UIColor.Gray.gray38!)
        public static let gray40 = Color(UIColor.Gray.gray40!)
        public static let gray42 = Color(UIColor.Gray.gray42!)
        public static let gray44 = Color(UIColor.Gray.gray44!)
        public static let gray46 = Color(UIColor.Gray.gray46!)
        public static let gray48 = Color(UIColor.Gray.gray48!)
        public static let gray50 = Color(UIColor.Gray.gray50!)
        public static let gray52 = Color(UIColor.Gray.gray52!)
        public static let gray54 = Color(UIColor.Gray.gray54!)
        public static let gray56 = Color(UIColor.Gray.gray56!)
        public static let gray58 = Color(UIColor.Gray.gray58!)
        public static let gray60 = Color(UIColor.Gray.gray60!)
        public static let gray62 = Color(UIColor.Gray.gray62!)
        public static let gray64 = Color(UIColor.Gray.gray64!)
        public static let gray66 = Color(UIColor.Gray.gray66!)
        public static let gray68 = Color(UIColor.Gray.gray68!)
        public static let gray70 = Color(UIColor.Gray.gray70!)
        public static let gray72 = Color(UIColor.Gray.gray72!)
        public static let gray74 = Color(UIColor.Gray.gray74!)
        public static let gray76 = Color(UIColor.Gray.gray76!)
        public static let gray78 = Color(UIColor.Gray.gray78!)
        public static let gray80 = Color(UIColor.Gray.gray80!)
        public static let gray82 = Color(UIColor.Gray.gray82!)
        public static let gray84 = Color(UIColor.Gray.gray84!)
        public static let gray86 = Color(UIColor.Gray.gray86!)
        public static let gray88 = Color(UIColor.Gray.gray88!)
        public static let gray90 = Color(UIColor.Gray.gray90!)
        public static let gray92 = Color(UIColor.Gray.gray92!)
        public static let gray94 = Color(UIColor.Gray.gray94!)
        public static let gray96 = Color(UIColor.Gray.gray96!)
        public static let gray98 = Color(UIColor.Gray.gray98!)
        public static let black = Color(UIColor.Gray.black!)
        public static let white = Color(UIColor.Gray.white!)
        
    }
}
//
extension UIColor {
//    public struct Background {
//        public static let bg1 = UIColor.init(named: "color_bg_lv1") ?? .black
//        public static let bg2 = UIColor.init(named:"color_bg_lv2") ?? .black
//        public static let bg3 = UIColor.init(named:"color_bg_lv3") ?? .black
//        public static let bgPress = UIColor.init(named:"color_bg_press") ?? .black
//    }
//    public struct Button {
//        public static let bg = UIColor.init(named:"color_btn_bg") ?? .black
//        public static let press = UIColor.init(named:"color_btn_press") ?? .black
//        public static let text = UIColor.init(named:"color_btn_text") ?? .black
//        public static let bgDisable = UIColor.init(named:"color_btn_bg_disable") ?? .black
//        public static let textDisable = UIColor.init(named:"color_btn_text_disable") ?? .black
//
//    }
//    public struct Common {
//        public static let blue = UIColor.init(named:"color_common_blue") ?? .black
//        public static let green = UIColor.init(named:"color_common_green") ?? .black
//        public static let purple = UIColor.init(named:"color_common_purple") ?? .black
//        public static let red = UIColor.init(named:"color_common_red") ?? .black
//        public static let yellow = UIColor.init(named:"color_common_yellow") ?? .black
//        public static let darkBlue = UIColor.init(named:"color_common_dark_blue") ?? .black//color_common_dark_blue
//        //color_common_light_purple
//        public static let lightPurple = UIColor.init(named:"color_common_light_purple") ?? .black
//    }
//    public struct Deep {
//        public static let lv1 = UIColor.init(named:"color_dark_lv1") ?? .black
//        public static let lv2 = UIColor.init(named:"color_dark_lv2") ?? .black
//        public static let lv3 = UIColor.init(named:"color_dark_lv3") ?? .black
//        public static let lv4 = UIColor.init(named:"color_dark_lv4") ?? .black
//    }
//    public struct Light {
//        public static let lv1 = UIColor.init(named:"color_light_lv1") ?? .black
//        public static let lv2 = UIColor.init(named:"color_light_lv2") ?? .black
//        public static let lv3 = UIColor.init(named:"color_light_lv3") ?? .black
//        public static let lv4 = UIColor.init(named:"color_light_lv4") ?? .black
//        public static let lv5 = UIColor.init(named:"color_light_lv5") ?? .black
//    }
//    public struct Musk {
//        public static let reverse30 = UIColor.init(named:"color_musk_reverse_30") ?? .black
//        public static let reverse50 = UIColor.init(named:"color_musk_reverse_50") ?? .black
//        public static let same30 = UIColor.init(named:"color_musk_same_30") ?? .black
//        public static let same50 = UIColor.init(named:"color_musk_same_50") ?? .black
//    }
//    public struct Outline {
//        public static let lv1 = UIColor.init(named:"color_outline_lv1") ?? .black
//        public static let lv2 = UIColor.init(named:"color_outline_lv2") ?? .black
//    }
//    public struct Line {
//        public static let lv1 = UIColor.init(named:"color_line_lv1") ?? .black
//        public static let lv2 = UIColor.init(named:"color_line_lv2") ?? .black
//    }
//    public struct Primary {
//        public static let black = UIColor.init(named:"color_primary_black") ?? .black
//        public static let blackLv2 = UIColor.init(named:"color_primary_black_lv2") ?? .black
//        public static let white = UIColor.init(named:"color_primary_white") ?? .black
//    }
//    public struct Text {
//        public static let lv1 = UIColor.init(named:"color_text_lv1") ?? .black
//        public static let lv2 = UIColor.init(named:"color_text_lv2") ?? .black
//        public static let lv3 = UIColor.init(named:"color_text_lv3") ?? .black
//    }
//    public struct Custom {
//        public static let golden = UIColor.init(named:"color_golden") ?? .black
//        public static let icon = UIColor.init(named:"color_icon_icon") ?? .black
//    }
//
    public struct Gray {
        public static let gray2 = UIColor(hexString: "#050505")
        public static let gray4 = UIColor(hexString: "#0a0a0a")
        public static let gray6 = UIColor(hexString: "#0f0f0f")
        public static let gray8 = UIColor(hexString: "#141414")
        public static let gray10 = UIColor(hexString: "#1a1a1a")
        public static let gray12 = UIColor(hexString: "#1f1f1f")
        public static let gray14 = UIColor(hexString: "#242424")
        public static let gray16 = UIColor(hexString: "#292929")
        public static let gray18 = UIColor(hexString: "#2e2e2e")
        public static let gray20 = UIColor(hexString: "#333333")
        public static let gray22 = UIColor(hexString: "#383838")
        public static let gray24 = UIColor(hexString: "#3d3d3d")
        public static let gray26 = UIColor(hexString: "#424242")
        public static let gray28 = UIColor(hexString: "#474747")
        public static let gray30 = UIColor(hexString: "#4d4d4d")
        public static let gray32 = UIColor(hexString: "#525252")
        public static let gray34 = UIColor(hexString: "#575757")
        public static let gray36 = UIColor(hexString: "#5c5c5c")
        public static let gray38 = UIColor(hexString: "#616161")
        public static let gray40 = UIColor(hexString: "#666666")
        public static let gray42 = UIColor(hexString: "#6b6b6b")
        public static let gray44 = UIColor(hexString: "#707070")
        public static let gray46 = UIColor(hexString: "#757575")
        public static let gray48 = UIColor(hexString: "#7a7a7a")
        public static let gray50 = UIColor(hexString: "#808080")
        public static let gray52 = UIColor(hexString: "#858585")
        public static let gray54 = UIColor(hexString: "#8a8a8a")
        public static let gray56 = UIColor(hexString: "#8f8f8f")
        public static let gray58 = UIColor(hexString: "#949494")
        public static let gray60 = UIColor(hexString: "#999999")
        public static let gray62 = UIColor(hexString: "#9e9e9e")
        public static let gray64 = UIColor(hexString: "#a3a3a3")
        public static let gray66 = UIColor(hexString: "#a8a8a8")
        public static let gray68 = UIColor(hexString: "#adadad")
        public static let gray70 = UIColor(hexString: "#b3b3b3")
        public static let gray72 = UIColor(hexString: "#b8b8b8")
        public static let gray74 = UIColor(hexString: "#bdbdbd")
        public static let gray76 = UIColor(hexString: "#c2c2c2")
        public static let gray78 = UIColor(hexString: "#c7c7c7")
        public static let gray80 = UIColor(hexString: "#cccccc")
        public static let gray82 = UIColor(hexString: "#d1d1d1")
        public static let gray84 = UIColor(hexString: "#d6d6d6")
        public static let gray86 = UIColor(hexString: "#dbdbdb")
        public static let gray88 = UIColor(hexString: "#e0e0e0")
        public static let gray90 = UIColor(hexString: "#e6e6e6")
        public static let gray92 = UIColor(hexString: "#ebebeb")
        public static let gray94 = UIColor(hexString: "#f0f0f0")
        public static let gray96 = UIColor(hexString: "#f5f5f5")
        public static let gray98 = UIColor(hexString: "#fafafa")
        public static let black = UIColor(hexString: "#000000")
        public static let white = UIColor(hexString: "#ffffff")
    }
}



public extension Color {
    /// Creates a color from a hex string (e.g. "#3498db").
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
