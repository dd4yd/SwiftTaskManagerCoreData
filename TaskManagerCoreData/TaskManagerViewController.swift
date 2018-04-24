//
//  TaskManagerViewController.swift
//  TaskManagerCoreData
//
//  Created by David Dean on 4/24/18.
//  Copyright © 2018 David Dean. All rights reserved.
//

import UIKit
import CoreData

class TaskManagerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            let tasks = try PersistenceService.context.fetch(fetchRequest)
            self.tasks = tasks
            self.tableView.reloadData()
        } catch {}
    
    }
    
    @IBAction func onNewTask(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add task", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let title = alert.textFields!.first!.text!
            let desc = alert.textFields!.last!.text!
            let task = Task(context: PersistenceService.context)
            task.title = title
            task.desc = desc
            PersistenceService.saveContext()
            self.tasks.append(task)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension TaskManagerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = tasks[indexPath.row].title
        cell.detailTextLabel?.text = tasks[indexPath.row].desc
        return cell
    }
    
}
