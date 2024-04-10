//
//  RoundSettingTextFieldStyle.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Custom style view modifier for Round Settings Text fields
struct RoundSettingTextFieldStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.themePurple)
            .underline()
            .font(.custom("Fredoka-Bold", size: 20))
            .frame(width: 50)
    }
    
}

extension TextField {
    
    func roundSettingStyle() -> some View {
        self.modifier(RoundSettingTextFieldStyle())
    }
    
}
