//
//  PopupTitle.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Serves as a view modifier for all Popup Titles
struct PopupTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Pacifico-Regular", size: 30))
            .foregroundStyle(.themeYellow)
            .shadow(color: .black, radius: 1, x: 1, y: 1)
    }
    
}

extension Text {
    
    func popupTitle() -> some View {
        self.modifier(PopupTitle())
    }
    
}
