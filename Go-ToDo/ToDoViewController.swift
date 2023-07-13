//
//  ToDoViewController.swift
//  Go-ToDo
//
//  Created by Gokila on 13/07/23.
//

import Cocoa

class ToDoViewController: NSViewController {
   
    @IBOutlet weak var todoTableView: NSTableView!
    var todoitems:[ToDoItem] = [ToDoItem(title: "Gokila", Completed: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    @IBAction func addTodoButtonClicked(_ sender: Any) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let addTodoviewController = storyboard.instantiateController(withIdentifier: "AddToDoViewController") as! AddToDoViewController
        self.presentAsModalWindow(addTodoviewController)
        addTodoviewController.delegate = self
    }
}
extension ToDoViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.todoitems.count
    }
}
extension ToDoViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let todoTableCell = todoTableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "ToDoTableCellView"), owner: nil) as? ToDoTableCellView else {
            return nil
        }
        todoTableCell.index = row
        todoTableCell.delegate = self
        todoTableCell.completedCheckBox.title = todoitems[row].title
        return todoTableCell
    }
}
extension ToDoViewController: AddToDoViewControllerDelegate {
    func submitItem(text: String) {
        todoitems.append(ToDoItem(title: text, Completed: false))
        todoTableView.reloadData()
    }
}

extension ToDoViewController: ToDoTableCellViewDelegate {
    func completedCheckBoxClicked(index: Int) {
        var todoitemCheck = todoitems[index]
        todoitemCheck.Completed = !todoitemCheck.Completed
        todoitems[index] = todoitemCheck
        todoTableView.reloadData()
    }
}
