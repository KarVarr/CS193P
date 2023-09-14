//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Karen Vardanian on 14.09.2023.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

      loadItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name

                return cell
    }
    

    func saveItem() {
        do {
            try context.save()
        } catch {
            print("Not saved! \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItem() {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching from context \(error.localizedDescription)")
        }
        
        tableView.reloadData()

    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Add Category", message: "Enter a name of category", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Add", style: .default) { [weak self] action in
            let category = Category(context: self!.context)
            category.name = ac.textFields?.first?.text
            self?.categories.append(category)
            
            self?.saveItem()
        })
        
        ac.addTextField() { text in
            text.placeholder = "Buy grocery!"
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
}
