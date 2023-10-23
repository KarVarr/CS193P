//
//  SearchViewController.swift
//  iMusic
//
//  Created by Karen Vardanian on 21.10.2023.
//

import UIKit
import Alamofire

class SearchViewController: UITableViewController {
    var tracks = [Track]()
    private var timer: Timer?
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = tracks[indexPath.row]
        
        cell.textLabel?.text = "\(track.artistName)\n\(track.collectionName ?? "")"
        cell.textLabel?.numberOfLines = 2
        
        
        DispatchQueue.global(qos: .userInteractive).async {
            if let imageUrlString = track.artworkUrl100, let imageUrl = URL(string: imageUrlString) {
                if let data = try? Data(contentsOf: imageUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.imageView?.image = image
                        }
                    }
                }
                
            }
        }
        
        return cell
    }
    
    
    
    
}


extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            let url = "https://itunes.apple.com/search"
            let parameters = ["term": "\(searchText)", "limit": "5"]
            
            AF.request(url, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: nil).responseData { dataResponse in
                if let error = dataResponse.error {
                    print("Error \(error)")
                    return
                }
                
                guard let data = dataResponse.data else { return }
                
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(SearchResponse.self, from: data)
                    print(response)
                    self.tracks = response.results
                    self.tableView.reloadData()
                } catch let error{
                    print("error Data = \(error)")
                }

            }
        })
    }
}
