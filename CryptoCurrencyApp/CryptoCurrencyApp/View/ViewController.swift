//
//  ViewController.swift
//  CryptoCurrencyApp
//
//  Created by Bertuğ Horoz on 14.11.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    private var cryptoListViewModel : CryptoListModel!
    var colorArray = [UIColor]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 100/255, green: 50/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 50/255, green: 50/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 1/255, green: 50/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 150/255, green: 50/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 200/255, green: 50/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 250/255, green: 50/255, blue: 200/255, alpha: 1.0)]
        
        getData()
    }

    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrency(url: url) { cryptos in
            if let cryptos = cryptos{
                self.cryptoListViewModel = CryptoListModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

