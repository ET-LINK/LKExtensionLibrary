//
//  CommonBackToolbarView.swift
//  VoiceAssistant
//
//  Created by Enter M1 on 9/12/24.
//

import SwiftUI

// 自定义 ViewModifier 用于全局应用返回按钮
public struct GlobalBackButtonModifier: ViewModifier {
    @Environment(\.dismiss) public var dismiss
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss() // 执行返回操作
                    }) {
                        Image(systemName: "arrow.left") // 自定义的SF Symbol箭头
                    }
                }
            }
            .overlay( // 保留侧滑手势，并隐藏默认返回按钮
                Color.clear
                    .contentShape(Rectangle()) // 响应触摸手势
            )
    }
}
