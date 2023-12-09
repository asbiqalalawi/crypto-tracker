//
//  CircleButton.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 09/12/23.
//

import SwiftUI

struct CircleButton: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.backgroundColor)
            )
            .shadow(
                color: Color.theme.accentColor.opacity(0.25),
                radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding()
    }
}

#Preview {
    Group {
        CircleButton(iconName: "heart.fill")
        CircleButton(iconName: "info")
        CircleButton(iconName: "plus")
    }
}
