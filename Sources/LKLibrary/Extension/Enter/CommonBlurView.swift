//
//  CommonBlueView.swift
//  VoiceAssistant
//
//  Created by Enter M1 on 9/20/24.
//
import Foundation
import UIKit
import SwiftUI

public struct CommonBlurView: UIViewRepresentable {
    public let style: UIBlurEffect.Style
    public init(style: UIBlurEffect.Style = .systemMaterial) {
        self.style = style
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
