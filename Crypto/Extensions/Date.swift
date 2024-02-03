//
//  Date.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 29/01/24.
//

import Foundation

extension Date {
    
    // "2021-03-13T20:34:25.606Z"
    init(coinDateString: String ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinDateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
