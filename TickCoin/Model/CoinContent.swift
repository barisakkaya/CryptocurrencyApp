//
//  CoinContent.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import Foundation

struct CoinContent: Decodable {
    let rates: [rates]
}

struct rates: Decodable {
    let rate: String
    let time: String
    let asset_id_quote: String
}
