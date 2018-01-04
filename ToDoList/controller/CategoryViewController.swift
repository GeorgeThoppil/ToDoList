//
//  CategoryViewController.swift
//  ToDoList
//
//  Created by GeorgeT on 2018-01-01.
//  Copyright © 2018 GeorgeT. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categoryArrayList = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArrayList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArrayList[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if  let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArrayList[indexPath.row]
        }
    }
 
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var tmpTextField = UITextField()
        
        let action = UIAlertAction(title: "Add", style: .default) { (alertAction) in
            let newCategory = Category(context: self.context)
            newCategory.name = tmpTextField.text!
            self.categoryArrayList.append(newCategory)
            self.saveCategories()
        }
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            tmpTextField = textField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            
        }
        self.tableView.reloadData()
    }
    
    func loadCategories() {
        let request : NSFetchRequest = Category.fetchRequest()
        do {
            categoryArrayList = try context.fetch(request)
        } catch {
            
        }
        tableView.reloadData()
    }
}
