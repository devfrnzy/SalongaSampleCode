//
//  CountdownTimerView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// A bar that decreases as the timer ticks
struct CountdownTimerView: View {
    @ObservedObject var viewModel: TickTimer
    
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: geometry.size.width, height: 10)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    
                    LinearGradient(gradient: Gradient(colors: [.themePurple, Color.themePurple]), startPoint: .leading, endPoint: .trailing)
                        .cornerRadius(20)
                        .frame(width: min(CGFloat((viewModel.totalTime - viewModel.timeRemaining) / viewModel.totalTime) * geometry.size.width, geometry.size.width), height: 10)
                        .animation(.linear, value: viewModel.timeRemaining)
                }
            }
            .frame(height: 10)
        }
    }
    
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
       let turnTimer = TickTimer(totalTime: 10)
        CountdownTimerView(viewModel: turnTimer)
    }
}
