//
//  CoinViewModel.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import Foundation

struct CoinArrayViewModel {
    let coin: [CoinContent]
}
extension CoinArrayViewModel {
    func cellForRowAt(_ index: Int) -> CoinViewModel {
        let coin = self.coin[index]
        return CoinViewModel(coin)
    }
    func numberOfRowsInSection() -> Int{
        return self.coin.count
    }
    
}

struct CoinViewModel {
    let coinRate: CoinContent
}
extension CoinViewModel {
    init(_ coin: CoinContent) {
        self.coinRate = coin
    }
    
    var coinName: String {
        return coinRate.asset_id_quote
    }
    
    var price: String {
        return coinRate.rate
    }
}
