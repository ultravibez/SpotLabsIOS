//
//  Model.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import Foundation

protocol Model: Codable {
    static var decoder: JSONDecoder { get }
}

extension Model {
    static var decoder: JSONDecoder {
        JSONDecoder()
    }
}
