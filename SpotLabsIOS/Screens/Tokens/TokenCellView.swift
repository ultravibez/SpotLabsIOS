//
//  TokenCellView.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import SwiftUI

struct TokenCellView: View {
    let token: Token

    var body: some View {
        HStack(spacing: 15) {
            CachedAsyncImage(url: URL(string: token.logoURI)!)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 4)

            VStack(alignment: .leading, spacing: 5) {
                Text(token.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(token.symbol)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text("$\(token.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}
