//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Karen Vardanian on 14.09.2023.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    
    let realm = try! Realm()
    
    
    var categories: Results<Category>?
    
    //    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categories?[indexPath.row]
        cell.textLabel?.text = category?.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let categoriesDeleteItem = categories?[indexPath.row] {
                do {
                    try realm.write({
                        realm.delete(categoriesDeleteItem)
                    })
                } catch {
                    print(error)
                }
            }
            tableView.deleteRows(at: [indexPath], with: .middle)
        }
    }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! TodoListViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categories?[indexPath.row]
            }
        }
        
        
        func save(category: Category) {
            do {
                try realm.write({
                    realm.add(category)
                })
            } catch {
                print("Not saved! \(error)")
            }
            tableView.reloadData()
        }
        
        func loadCategories() {
            //Realm
            categories = realm.objects(Category.self)
            
            //CoreData
            //        let request: NSFetchRequest<Category> = Category.fetchRequest()
            //
            //        do {
            //            categories = try context.fetch(request)
            //        } catch {
            //            print("Error fetching from context \(error.localizedDescription)")
            //        }
            
            tableView.reloadData()
        }
        
        
        @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
            let ac = UIAlertController(title: "Add Category", message: "Enter a name of category", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Add", style: .default) { [weak self] action in
                let category = Category()
                category.name = ac.textFields?.first?.text ?? "--"
                self?.save(category: category)
            })
            
            ac.addTextField() { text in
                text.placeholder = "Buy grocery!"
            }
            
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            present(ac, animated: true)
        }
    }
