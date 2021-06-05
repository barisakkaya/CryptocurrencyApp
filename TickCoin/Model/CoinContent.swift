//
//  CoinContent.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import Foundation

struct CoinContent: Codable {
    let asset_id_base: String
    let rates: [Rates]
}

struct Rates: Codable {
    let time: String
    let asset_id_quote: String
    let rate: Double
}
