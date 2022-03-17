//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Adem Deliaslan on 14.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorPaletteArray = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorPaletteArray = [
            UIColor(displayP3Red: 0/255, green: 166/255, blue: 251/255, alpha: 1.0),
            UIColor(displayP3Red: 5/255, green: 130/255, blue: 202/255, alpha: 1.0)
        ]
        
        
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceTextLabel.text = cryptoViewModel.price
        cell.currencyTextLabel.text = cryptoViewModel.name
        //renkleri direkt atamak için
//        if indexPath.row  % 2 == 0 {
//            cell.backgroundColor = UIColor(displayP3Red: 0/255, green: 166/255, blue: 251/255, alpha: 1.0)
//        } else {
//            cell.backgroundColor = UIColor(displayP3Red: 5/255, green: 130/255, blue: 202/255, alpha: 1.0)
//        }
        //renkleri dizi içerisinde tanımlanan şekilde almk için
        cell.backgroundColor = colorPaletteArray[indexPath.row % 2]
        return cell
    }
    
}

