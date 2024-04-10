//
//  CoordinatorView.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI
import AppTrackingTransparency

/// Serves as the App's root view which handles navigation from AppCoordinator
struct CoordinatorView: View {
    
    /// Handles navigation and building of Views to be presented
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                //TODO: Add condition where the Banner Ads only show when user did not purchase the Remove Ads IAP
                // Banner Ad is added here in order to show the ad on all screens without having to load an ad on each screen
                BannerAdView()
                
                // Main Navigation View
                NavigationStack(path: $coordinator.path) {
                    ZStack {
                        VStack {
                            coordinator.build(page: .home)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .navigationDestination(for: Page.self) { page in
                                    coordinator.build(page: page)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                                    coordinator.build(fullScreenCover: fullScreenCover)
                                }
                        }
                    }
                }
            }
        }
        .onAppear {
            // Request Tracking Authorization after a delay in order to let the user see the initial screen first
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                AdTracking.requestTrackingAuthorization()
            }
        }
        .environmentObject(coordinator)
    }

    
    
    
}
