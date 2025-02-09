//
//  Results.swift
//  SpotLabsIOS
//
//  Created by Matan Dahan on 09/02/2025.
//

import Foundation

struct Results<Item: Model>: Model {
    let tokens: [Item]
}
