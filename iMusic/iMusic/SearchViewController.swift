//
//  SearchViewController.swift
//  iMusic
//
//  Created by Karen Vardanian on 21.10.2023.
//

import UIKit
import Alamofire

class SearchViewController: UITableViewController {
    let arr = ["1","2","3","4","5","6","7","8","9","0"]

    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    

 

}


extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let url = "https://itunes.apple.com/search?term=\(searchText)&limit=3"
        
        AF.request(url).response { dataResponse in
            if let error = dataResponse.error {
                print("Error \(error)")
                return
            }
            
            guard let data = dataResponse.data else { return }
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "")
            
        }

    }
}
