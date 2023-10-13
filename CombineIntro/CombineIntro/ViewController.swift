//
//  ViewController.swift
//  CombineIntro
//
//  Created by Karen Vardanian on 13.10.2023.
//

import Combine
import UIKit

class MyCustomTableCell: UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDataSource {
   
    private var models = [String]()
    var observer: AnyCancellable?
    
    private var tableView: UITableView = {
       let table = UITableView()
        table.register(MyCustomTableCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        observer = APICaller.shared.fetchCompanies()
            .receive(on: DispatchQueue.main)
            .sink { completion in
            switch completion {
            case .finished: print("finished")
            case.failure(let error): print(error)
            }
        } receiveValue: { [weak self] value in
            self?.models = value
            self?.tableView.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableCell else {
            fatalError()
        }
        cell.textLabel?.text = models[indexPath.row]
        
        
        return cell
    }

}

