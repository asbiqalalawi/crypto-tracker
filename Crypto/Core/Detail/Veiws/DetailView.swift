//
//  DetailView.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 14/01/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing. \(coin.name)")
    }
    
    var body: some View {
        Text("Hello")
    }
}

struct DetailView_Preveiw: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
