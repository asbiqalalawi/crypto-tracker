//
//  SettingsView.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 04/02/24.
//

import SwiftUI

struct SettingsView: View {
    
    private let youtubeURL = URL(string: "https://www.youtube.com/@SwiftfulThinking")!
    private let nickURL = URL(string: "https://www.nicksarno.com")!
    private let coingeckoURL = URL(string: "https://www.coingecko.com")!
    private let githubURL = URL(string: "https://github.com/asbiqalalawi")!
    private let repositoryURL = URL(string: "https://github.com/asbiqalalawi/crypto-tracker")!
    private let linkedInURL = URL(string: "https://www.linkedin.com/in/asbiqalalawi/")!
    
    var body: some View {
        NavigationStack {
            List {
                swiftfullThinking
                coinGecko
                developer
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            })
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var swiftfullThinking: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on youtube. It uses MVVM Architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding(.vertical)
            Group {
                Link("Subscribe Youtube Channel", destination: youtubeURL)
                Link("About The Creator", destination: nickURL)
            }
            .font(.headline)
            .foregroundStyle(Color.blue)
        } header: {
            Text("Swiftful Thinking")
        }
    }
    
    private var coinGecko: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app come from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding(.vertical)
            Group {
                Link("Visit CoinGecko", destination: coingeckoURL)
            }
            .font(.headline)
            .foregroundStyle(Color.blue)
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var developer: some View {
        Section {
            VStack(alignment: .leading) {
                Image("github")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was develop by Asbiq Al Alawi. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding(.vertical)
            Group {
                Link("Project Repository", destination: repositoryURL)
                Link("Visit Github Profile", destination: githubURL)
                Link("Visit LinkedIn Profile", destination: linkedInURL)
            }
            .font(.headline)
            .foregroundStyle(Color.blue)
        } header: {
            Text("Developer")
        }
    }
}
