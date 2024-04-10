//
//  BackgroundVideoView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Represents the UIKit View called "LoopVideoPlayerUIView" which plays a looping video that can be used  as the background of screens
struct BackgroundVideoView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BackgroundVideoView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return LoopVideoPlayerUIView(frame: .zero, fileName: "bgLoop", fileExtension: "mov")
    }
}
