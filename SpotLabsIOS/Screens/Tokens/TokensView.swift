//
//  TokensView.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import SwiftUI

struct TokensView: View {
    @StateObject private var viewModel = TokensViewModel(apiClient: APIClient())

    var body: some View {
        NavigationView {
            List(viewModel.tokens) { token in
                TokenCellView(token: token)
            }
            .navigationTitle("Crypto Tokens")
            .task {
                await viewModel.getAllTokens()
            }
        }
    }
}

#Preview {
    TokensView()
}
