//
//  ViewController.swift
//  CombineIntro
//
//  Created by Karen Vardanian on 13.10.2023.
//

import UIKit

class MyCustomTableCell: UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDataSource {
   
   
    
    
    private var tableView: UITableView = {
       let table = UITableView()
        table.register(MyCustomTableCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    //: *title*
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableCell
        
        
        return cell
    }

}

