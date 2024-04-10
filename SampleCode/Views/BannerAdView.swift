//
//  BannerAdView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

/// Shows the Banner Ad when available. Shows a "Purchase Remove Ads" banner otherwise.
struct BannerAdView: View {
    
    //TODO: Add View Model for Banner Ad to handle hasBannerAd and Banner Ad Loading
    @State var hasBannerAd = false
    
    var body: some View {
        ZStack {
            if hasBannerAd {
                //TODO: Add Banner Ad from Admob
            } else {
                Button {
                    //TODO: Add functionality where the user will be able to purchase the "Remove Ads" IAP
                } label: {
                    ZStack {
                        
                        Image("popupBG")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width, height: 60)
                            .border(Color.black)
                        Text("Purchase remove ads for an Ad-free experience")
                            .font(.custom("Pacifico-Regular", size: 18))
                            .foregroundColor(Color.themeDarkPurple)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .onAppear {
            //TODO: Request Banner Ad via View Model, once a Banner ad is loaded, show Banner Ad
        }
    }
    
}


#Preview {
    BannerAdView()
}
