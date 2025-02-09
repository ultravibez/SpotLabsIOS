//
//  TokensViewModel.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import Foundation

@MainActor
final class TokensViewModel: ObservableObject {
    @Published var tokens: [Token] = []
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getAllTokens() async {
        do {
            let result = try await apiClient.getTokens()
            self.tokens = result
            print(result)
        } catch {
            print("Failed to fetch tokens: \(error)")
        }
    }
}
