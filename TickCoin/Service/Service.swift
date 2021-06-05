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
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
                let crytpoList = try? JSONDecoder().decode(CoinContent.self, from: data)
                if let cryptoList = crytpoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
