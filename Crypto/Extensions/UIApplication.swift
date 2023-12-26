//
//  UIApplication.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 26/12/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
