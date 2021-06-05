//
//  ViewController.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 26.05.2021.
//

import UIKit

class CoinViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var coinArrayViewModel: CoinArrayViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getAllDatas()
    }
    
    func getAllDatas() {
        let coinURL = URL(string: "https://rest.coinapi.io/v1/exchangerate/USD")!
        Service().getRates(url: coinURL) { coins in
            if let coins = coins {
                
                self.coinArrayViewModel = CoinArrayViewModel(coin: coins)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coinArrayViewModel == nil ? 0 : self.coinArrayViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as! CoinTableViewCell
             
        let coinViewModel = self.coinArrayViewModel.coinAtIndex(indexPath.row)
        print(coinViewModel.name)
        print(coinViewModel.price)
        
        tableCell.coinName.text = coinViewModel.name
        tableCell.coinPrice.text = String(format:"%.4f",1/coinViewModel.price)
        
        return tableCell
    }

}

