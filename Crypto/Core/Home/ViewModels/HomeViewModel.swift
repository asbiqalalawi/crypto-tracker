//
//  HomeViewModel.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 13/12/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 12.66),
        StatisticModel(title: "Total Volume", value: "$1.54Tr"),
        StatisticModel(title: "Portfolio Value", value: "$42.5k", percentageChange: -2.66),
        StatisticModel(title: "Title 4", value: "$42.5k", percentageChange: 3.66),
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink{ [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty
        else {
            return coins
        }
        
        let loweredcasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(loweredcasedText) ||
            coin.symbol.lowercased().contains(loweredcasedText) ||
            coin.id.lowercased().contains(loweredcasedText)
        }
    }
    
}
