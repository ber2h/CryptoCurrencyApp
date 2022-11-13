//
//  CryptoViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Bertuğ Horoz on 14.11.2022.
//

import Foundation

struct CryptoListModel{
    let cryptoCurrencyList : [CryptoCurrencyModel]
}

extension CryptoListModel{
        func numberOfRowsInSection() -> Int{
        return self.cryptoCurrencyList.count
    }
        func cryptoAtIndex(_ index: Int) -> CryptoViewModel{
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel{
    let cryptoCurrency : CryptoCurrencyModel
}
extension CryptoViewModel{
    var name : String{
    return self.cryptoCurrency.currency
    }
    var price : String{
    return self.cryptoCurrency.price
    }
}
    


