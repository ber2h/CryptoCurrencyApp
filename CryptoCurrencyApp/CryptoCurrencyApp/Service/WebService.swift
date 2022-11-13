//
//  WebService.swift
//  CryptoCurrencyApp
//
//  Created by Bertuğ Horoz on 14.11.2022.
//

import Foundation

class WebService{
    func downloadCurrency(url: URL, completion: @escaping( [CryptoCurrencyModel]?) -> () ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                let cryptoList = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data)
                print(cryptoList)
                if let cryptoList = cryptoList{
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
