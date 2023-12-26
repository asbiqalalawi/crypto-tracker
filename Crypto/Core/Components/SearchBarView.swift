//
//  SearchBarView.swift
//  Crypto
//
//  Created by SDS.Mac.012 on 26/12/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty
                    ? Color.theme.secondaryTextColor
                    : Color.theme.accentColor
                )
            TextField("Search by name or symbol...", text: $searchText)
                .autocorrectionDisabled()
                .foregroundStyle(Color.theme.accentColor)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(Color.theme.accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0),
                    alignment: .trailing
                )
                .onTapGesture {
                    UIApplication.shared.endEditing()
                    searchText = ""
                }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.backgroundColor)
                .shadow(
                    color: Color.theme.accentColor.opacity(0.15),
                    radius: 10
                )
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
