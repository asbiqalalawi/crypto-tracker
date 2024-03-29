//
//  LaunchView.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 09/02/24.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText : [String] = "Loading your portfolio...".map{ String($0) }
    @State private var showLoadingText: Bool = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loop: Int = 0
    
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launchBackground
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.launchAccent)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring) {
                
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loop += 1
                    
                    if loop >= 2 {
                        showLaunchView.toggle()
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
