//
//  StatisticView.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 27/12/23.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accentColor)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor)
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Preveiw: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat1)
    }
}
