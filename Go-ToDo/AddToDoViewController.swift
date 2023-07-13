//
//  AddToDoViewController.swift
//  Go-ToDo
//
//  Created by Gokila on 13/07/23.
//

import Cocoa

class AddToDoViewController: NSViewController {
    @IBOutlet weak var addToDoTextField: NSTextField!
    @IBAction func submitButtonClicked(_ sender: Any) {
        var stringValue = addToDoTextField.stringValue
        if stringValue != " " {
            delegate?.submitItem(text: stringValue)
            dismiss(nil)
        } else {
            return
        }
    }
    var delegate: AddToDoViewControllerDelegate?
}
protocol AddToDoViewControllerDelegate {
    func submitItem(text: String)
}
