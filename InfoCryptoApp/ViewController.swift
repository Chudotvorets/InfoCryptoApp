//
//  ViewController.swift
//  InfoCryptoApp
//
//  Created by SIMONOV on 12.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let networkService = NetworkManager()
    
    var dataModel: [CryptoData] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        networkRequest()
      
    }
    private func networkRequest() {
        networkService.getCryptoData { [weak self] data in
            if let self = self  {
                self.dataModel = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifire, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        cell.configure(model: dataModel[indexPath.row])
        
        return cell
    }
    
    
}

