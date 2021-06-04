//
//  Service.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import Foundation

class Service {
    
    func getRates(url: URL, completion: @escaping (CoinContent?) -> ()) {
        var request = URLRequest(url: url)
        request.setValue("18E22527-1F52-4112-8DB4-67C5BD47EA6F", forHTTPHeaderField: "X-CoinAPI-Key")
        request.httpMethod = "GET"
        print(request)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                let coinArray = try? JSONDecoder().decode(CoinContent.self, from: data)
                print(coinArray?.rates[0].asset_id_quote)
                
                if let coinArray = coinArray {
                    completion(coinArray)
                }
            
            }
        }.resume()
    }
}
