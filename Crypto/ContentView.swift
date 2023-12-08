//
//  ContentView.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 08/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color.theme.backgroundColor
            
            VStack {
                Text("Hallo Test")
                    .foregroundStyle(Color.theme.accentColor)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
