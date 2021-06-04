//
//  CoinContent.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import Foundation

struct CoinContent: Decodable {
    let asset_id_quote: String
    let rate: String
    let time: String
}
