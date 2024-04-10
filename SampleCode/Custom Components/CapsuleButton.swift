//
//  CapsuleButtonLabel.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Customized Button designed as a Capsule with colors based on the App's theme
struct CapsuleButton: View {
    
    var titleText: String
    var fontSize: CGFloat = 27
    var color: Color = .themePurple
    var borderColor: Color = .themeYellow
    var action: () -> Void
    
    init(_ titleText: String, fontSize: CGFloat = 27, color: Color = .themePurple, borderColor: Color = .themeYellow, action: @escaping () -> Void) {
        self.titleText = titleText
        self.color = color
        self.borderColor = borderColor
        self.fontSize = fontSize
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .aspectRatio(180/40, contentMode: .fit)
                    .foregroundColor(color)
                    .shadow(color: .black, radius: 2, x: 4, y: 3)
                RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 3)
                    .foregroundColor(borderColor)
                    .aspectRatio(180/40, contentMode: .fit)
                Text(titleText)
                    .foregroundColor(.white)
                    .font(.custom("Fredoka-Regular", size: fontSize))
                    .shadow(color: .gray, radius: 1, x: 2, y: 2)
            }
        }
    }
}
