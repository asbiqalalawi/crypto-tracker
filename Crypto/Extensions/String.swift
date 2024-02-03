//
//  String.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 03/02/24.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
