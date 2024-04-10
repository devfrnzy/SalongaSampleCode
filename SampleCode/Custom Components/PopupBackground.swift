//
//  PopupBackground.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Generic background for all popups
struct PopupBackground: View {
    var body: some View {
        Image("popupBG")
            .resizable()
            .cornerRadius(30)
        RoundedRectangle(cornerRadius: 30)
            .stroke(lineWidth: 5)
            .foregroundColor(.gray)
    }
}
