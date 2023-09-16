//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Karen Vardanian on 10.09.2023.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }
    
    
    //CoreData
    //    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark :  .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                }
            } catch {
                print(error)
            }
        }
        tableView.reloadData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let ac = UIAlertController(title: "New Todoey task", message: "Add new Task", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Add Item", style: .default) { [weak self] action in
            
            if let currentCategory = self?.selectedCategory {
                do {
                    try self?.realm.write({
                        let newItem = Item()
                        newItem.title = textField.text ?? "---"
                        currentCategory.items.append(newItem)
                    })
                } catch {
                    print(error.localizedDescription)
                }
            }
            self?.tableView.reloadData()
        })
        
        ac.addTextField() { text in
            text.placeholder = "Create new item"
            textField = text
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    //MARK: - Model manipulation Methods
    
    
    
    func loadItems() {
        
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
        
        //        CoreData
        //        func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil)
        //        let categoryPredicate = NSPredicate(format: "category.name MATCHES %@", selectedCategory!.name!)
        //
        //        if let additionalPredicate = predicate {
        //            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        //        } else {
        //            request.predicate = categoryPredicate
        //        }
        //
        //        do {
        //            itemArray = try context.fetch(request)
        //        } catch {
        //            print("Error fetching from context \(error.localizedDescription)")
        //        }
    }
    
}

//MARK: - Search bar methods

//extension TodoListViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//        loadItems(with: request, predicate: predicate)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchBar.text?.count == 0 {
//            loadItems()
//
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}
