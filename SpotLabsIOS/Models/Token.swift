//
//  Token.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import Foundation

struct Token: Model, Identifiable {
    let id: String
    let name: String
    let price: Double
    let symbol: String
    let logoURI: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "address"
        case name
        case price
        case symbol
        case logoURI
    }
}
