//
//  ToDoTableCellView.swift
//  Go-ToDo
//
//  Created by Gokila on 13/07/23.
//

import Cocoa

class ToDoTableCellView: NSTableCellView {

    @IBOutlet weak var completedCheckBox: NSButton!
    
    @IBAction func completedButtonClicked(_ sender: Any) {
        delegate?.completedCheckBoxClicked(index: index)
    }
    var index = -1
    var delegate: ToDoTableCellViewDelegate?
}

protocol ToDoTableCellViewDelegate {
    func completedCheckBoxClicked(index: Int)
}
