//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Brandon Mahoney on 9/23/17.
//  Copyright © 2017 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var item: Item?
    var context: NSManagedObjectContext!
    
    
    
    @IBOutlet weak var detailTextField: UITextField!
    
    
    
    override func viewDidLoad() {
    
        if let item = item {
            detailTextField.text = item.text
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        if let item = item, let newText = detailTextField.text {
            item.text = newText
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = item {
            context.delete(item)
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
}
