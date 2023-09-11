//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Karen Vardanian on 10.09.2023.
//

import UIKit
import CoreData 

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark :  .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let ac = UIAlertController(title: "New Todoey task", message: "Add new Task", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Add Item", style: .default) {[weak self] action in
            guard let self = self else { return }
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text ?? "---"
            newItem.done = false
            self.itemArray.append(newItem)
            
            self.saveItems()
        })
        
        ac.addTextField() { text in
            text.placeholder = "Create new item"
            textField = text
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        
    }
    
    //MARK: - Model manipulation Methods
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
    
}

