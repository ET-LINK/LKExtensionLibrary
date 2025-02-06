//
//  HapticManager.swift
//  LKLibrary
//
//  Created by Enter M1 on 12/13/24.
//

import Foundation
import SwiftUI

public class HapticManager {
    public static var shared = HapticManager()
    
    public enum FeedbackStyle {
        case heavy, light, medium, rigid, soft, success, error
    }
    
    public func tap(style: FeedbackStyle) {
        #if !os(macOS)
        switch style {
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .rigid:
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        case .soft:
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        case .success:
            generateHapticFeedback(.success)
        case .error:
            generateHapticFeedback(.error)
        }
        
        #endif
    }
    
    public func generateHapticFeedback(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
}
