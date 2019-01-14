//
//  AddTaskController.swift
//  ToDoList
//
//  Created by Brandon Mahoney on 9/20/17.
//  Copyright © 2017 Brandon Mahoney. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {

    var managedObjectContext: NSManagedObjectContext!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("AddTaskController Context: \(managedObjectContext.description)")
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.text = text
        
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
