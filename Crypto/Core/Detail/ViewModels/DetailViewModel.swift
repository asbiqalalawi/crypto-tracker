//
//  DetailViewModel.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 19/01/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataServices
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataServices(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { (returnedCoins) in
                print(returnedCoins)
            }
            .store(in: &cancellables)
    }
}
