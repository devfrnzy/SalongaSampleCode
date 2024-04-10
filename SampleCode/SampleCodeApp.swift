//
//  SampleCodeApp.swift
//  SampleCode
//
//  Created by Emmanuel Salonga on 4/9/24.
//

import SwiftUI

@main
struct SampleCodeApp: App {
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .onAppear {
                    WordDataManager.saveWordsFromPlist()
                }
        }
    }
}
