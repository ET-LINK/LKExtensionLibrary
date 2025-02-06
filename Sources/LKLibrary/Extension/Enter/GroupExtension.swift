//
//  GroupExtension.swift
//  VoiceAssistant
//
//  Created by Enter M1 on 9/23/24.
//

import Foundation
import UIKit

fileprivate let componentFormatter = DateComponentsFormatter()

extension Double {
    public func timeIntervalToString(unitsStyle: DateComponentsFormatter.UnitsStyle = .short, dropLeading: Bool = true) -> String {
        if self > 3600 {
            componentFormatter.allowedUnits = [.hour, .minute, .second]
        } else {
            componentFormatter.allowedUnits = [.minute, .second]
        }
        componentFormatter.unitsStyle = unitsStyle
        if dropLeading {
            componentFormatter.zeroFormattingBehavior = .dropLeading
        } else {
            componentFormatter.zeroFormattingBehavior = .pad
        }
        
        return componentFormatter.string(from: self) ?? ""
    }
}

extension UIApplication {
    public var rootViewController: UIViewController? {
        if let windowScene = self.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           let rootViewController = window.rootViewController {
            return rootViewController
        }
        return nil
    }
}
