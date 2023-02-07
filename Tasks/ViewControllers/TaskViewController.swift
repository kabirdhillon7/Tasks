//
//  TaskViewController.swift
//  Tasks
//
//  Created by Kabir Dhillon on 12/3/22.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        guard let task = task, let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let taskToCompare = UserDefaults().value(forKey: "task_\(x+1)") as? String, task == taskToCompare {
                UserDefaults().removeObject(forKey: "task_\(x+1)")
                break
            }
        }
        
        UserDefaults().set(count-1, forKey: "count")
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
