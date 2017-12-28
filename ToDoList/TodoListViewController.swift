//
//  ViewController.swift
//  ToDoList
//
//  Created by GeorgeT on 2017-12-27.
//  Copyright © 2017 GeorgeT. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find mike", "Buy Eggos", "Destory Demogorgaon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

