//
//  CryptoApp.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 08/12/23.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
