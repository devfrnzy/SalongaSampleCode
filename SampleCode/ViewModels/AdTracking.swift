//
//  AdTracking.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import Foundation
import AppTrackingTransparency

class AdTracking {
    /// Requests for Advertiser Tracking Authorizationfor Ad-related concerns
    class func requestTrackingAuthorization() {
        ATTrackingManager.requestTrackingAuthorization { status in
            // Handle the result of the tracking authorization request
            switch status {
            case .authorized:
                // Tracking is authorized
                print("DEBUG: Tracking authorized")
            case .denied:
                // Tracking is denied by the user
                print("DEBUG: Tracking denied")
            case .notDetermined:
                // Tracking authorization has not been determined yet
                print("DEBUG: Tracking not determined")
            case .restricted:
                // Tracking is restricted
                print("DEBUG: Tracking restricted")
            @unknown default:
                print("DEBUG: An Unknown Status has occured for requesting tracking authorization")
            }
        }
    }
}
