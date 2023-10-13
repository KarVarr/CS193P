//
//  ViewController.swift
//  CombineIntro
//
//  Created by Karen Vardanian on 13.10.2023.
//

import Combine
import UIKit

class MyCustomTableCell: UITableViewCell {
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        
        return button
    }()
    
    let action = PassthroughSubject<String, Never>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 10, y: 3, width: contentView.frame.size.width - 20, height: contentView.frame.size.height - 6)
    }
    
    @objc func didTapButton() {
        action.send("Cool, button is pressed!")
    }
}

class ViewController: UIViewController, UITableViewDataSource {
   
    private var models = [String]()
    var observers = [AnyCancellable]()
    
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
        
        APICaller.shared.fetchCompanies()
            .receive(on: DispatchQueue.main)
            .sink { completion in
            switch completion {
            case .finished: print("finished")
            case.failure(let error): print(error)
            }
        } receiveValue: { [weak self] value in
            self?.models = value
            self?.tableView.reloadData()
        }.store(in: &observers)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return models.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableCell else {
            fatalError()
        }
        cell.action.sink { string in
            print(string)
        }.store(in: &observers)
        
        
        return cell
    }

}

