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
    @Published var errorMessage: String = ""
    @Published var isErrorPresented = false
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getAllTokens() async {
        do {
            let result = try await apiClient.getTokens()
            self.tokens = result
        } catch {
            self.errorMessage = "Failed to load tokens. Please check your network connection or try again later."
            isErrorPresented = true
        }
    }
}
