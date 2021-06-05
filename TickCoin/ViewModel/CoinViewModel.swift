//
//  CoinViewModel.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import Foundation

struct CoinArrayViewModel {
    let coin: CoinContent
}
extension CoinArrayViewModel {
    init(_ coin: CoinContent) {
        self.coin = coin
    }
    func coinAtIndex(_ index: Int) -> RatesViewModel {
        let coin = self.coin.rates[index]
        return RatesViewModel(rate: coin)
    }
    func numberOfRowsInSection() -> Int{
        return self.coin.rates.count
    }
}



struct RatesViewModel {
    let coin: Rates
}
extension RatesViewModel {
    init(rate: Rates) {
        self.coin = rate
    }
    var price: Double {
        return self.coin.rate
    }
    var name: String {
        return self.coin.asset_id_quote
    }
}


