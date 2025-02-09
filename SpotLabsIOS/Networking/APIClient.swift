//
//  APIClient.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import Foundation

class APIClient {
    
    private func request<M: Model>(
        model: M.Type = M.self,
        path: String
    ) async throws -> M {
        guard let pathURL = URL(string: path) else {
            throw APIError.invalidRequestURL
        }
        
        let request = URLRequest(url: pathURL)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse,
           !(200...299 ~= response.statusCode) {
            throw APIError.apiError
        }
        
        do {
            return try model.decoder.decode(M.self, from: data)
        } catch {
            print("Raw JSON Response: \(String(data: data, encoding: .utf8) ?? "N/A")")
            throw APIError.decodingFailed(type: M.self,
                                          message: error.localizedDescription)
        }
    }
}

extension APIClient {
    func getTokens() async throws -> [Token] {
        let results = try await request(
            model: Results<Token>.self,
            path: "https://spot-labs.github.io/ios-interview-api/data.json"
        )
        return results.tokens
    }
}
