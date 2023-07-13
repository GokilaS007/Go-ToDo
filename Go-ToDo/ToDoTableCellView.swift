//
//  ToDoTableCellView.swift
//  Go-ToDo
//
//  Created by Gokila on 13/07/23.
//

import Cocoa

class ToDoTableCellView: NSTableCellView {

    @IBOutlet weak var completedCheckBox: NSButton!
    @IBAction func todoDeleteItem(_ sender: Any) {
        delegate?.deletedToDoItem(index: index)
    }
    
    var index = -1
    var delegate: ToDoTableCellViewDelegate?
    func configure(todoitems: [ToDoItem], index: Int, delegate: ToDoTableCellViewDelegate? ) {
        completedCheckBox.title = todoitems[index].title
        if todoitems[index].Completed {
            completedCheckBox.state = .on
        } else {
            completedCheckBox.state = .off
        }
    }
}

protocol ToDoTableCellViewDelegate {
    func deletedToDoItem(index: Int)
}

