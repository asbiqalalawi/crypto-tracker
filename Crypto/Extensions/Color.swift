//
//  Color.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 08/12/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let greenColor = Color("IjoColor")
    let redColor = Color("AbangColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}
