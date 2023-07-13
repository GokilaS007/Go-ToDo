//
//  ToDoTableCellView.swift
//  Go-ToDo
//
//  Created by Gokila on 13/07/23.
//

import Cocoa

class ToDoTableCellView: NSTableCellView, ToDoTableCellViewDelegate {

    @IBOutlet weak var completedCheckBox: NSButton!
    
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
}
