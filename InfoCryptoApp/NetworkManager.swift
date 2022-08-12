//
//  NetworkManager.swift
//  InfoCryptoApp
//
//  Created by SIMONOV on 12.08.2022.
//

import Foundation


final class NetworkManager {
    func getCryptoData(completion: @escaping ([CryptoData]) -> Void) {
        
        guard let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=65d826b99ad9177574292332ff03b21ca80d24b6&ranks=1&interval=1d,30&convert=USD&per-page=10&page=1") else { return }
            
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let result = try JSONDecoder().decode([CryptoData].self, from: data)
                completion(result)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
    
    

        

