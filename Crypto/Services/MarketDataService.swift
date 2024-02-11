//
//  MarketDataService.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 27/12/23.
//

import Foundation
import Combine

class MarketDataServices {
    
    @Published var marketData: MarketDataModel? = nil
    var marketSubscription: AnyCancellable?
    
    init() {
        getMarket()
    }
    
    func getMarket() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketSubscription?.cancel()
            })
    }
}
