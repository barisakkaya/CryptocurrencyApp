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
    func cellForRowAt(_ index: Int) -> CoinViewModel {
        let coin = self.coin.rates[index]
        return CoinViewModel(coin)
    }
    func numberOfRowsInSection() -> Int{
        return self.coin.rates.count
    }
}

struct CoinViewModel {
    let coinRate: rates
}
extension CoinViewModel {
    init(_ coin: rates) {
        self.coinRate = coin
    }
    
    var time: String {
        return coinRate.time
    }
    
    var coinName: String {
        return coinRate.asset_id_quote
    }
    
    var price: String {
        return coinRate.rate
    }
}
