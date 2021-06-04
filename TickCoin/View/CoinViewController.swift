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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as! CoinTableViewCell
             
        let coinViewModel = self.coinArrayViewModel.cellForRowAt((indexPath.row))
             
        tableCell.coinName.text = coinViewModel.coinName
        tableCell.coinPrice.text = coinViewModel.price
        var randomR: Float = Float(Int.random(in: 0...255)/255)
        var randomG: Float = Float(Int.random(in: 0...255)/255)
        var randomB: Float = Float(Int.random(in: 0...255)/255)
        //tableCell.backgroundColor = UIColor(red: randomR, green: randomG, blue: randomB, alpha: 1.0)

        return tableCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coinArrayViewModel == nil ? 0 : self.coinArrayViewModel.numberOfRowsInSection()
    }

}

