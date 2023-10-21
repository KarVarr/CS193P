//
//  SearchViewController.swift
//  iMusic
//
//  Created by Karen Vardanian on 21.10.2023.
//

import UIKit

class SearchViewController: UITableViewController {
    let arr = ["1","2","3","4","5","6","7","8","9","0"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
