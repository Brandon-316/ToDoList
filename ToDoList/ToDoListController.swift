//
//  ToDoListController.swift
//  ToDoList
//
//  Created by Brandon Mahoney on 9/20/17.
//  Copyright © 2017 Brandon Mahoney. All rights reserved.
//

import UIKit
import CoreData

class ToDoListController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var dataSource: DataSource = {
        return DataSource(tableView: self.tableView, context: self.managedObjectContext)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                    return
            }
            
            let item = dataSource.object(at: indexPath)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }
  

}



