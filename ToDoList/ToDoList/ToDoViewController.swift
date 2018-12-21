//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Smith, Sam on 12/21/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    /*---> OUTLET VARIABLES <---*/
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var publishDatePickerView: UIDatePicker!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*---> CLASS VARIABLES <---*/
    var isPickerHidden = true
    var todo: ToDo?
    
    /*---> OVERRIDE FUNCTIONS <---*/
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            navigationItem.title = "Book"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isRead
            publishDatePickerView.date = todo.published
            notesTextView.text = todo.notes
        }
        updateDueDateLabel(date: publishDatePickerView.date)
        updateSaveButtonState()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch(indexPath) {
        case [1,0]:
            return isPickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]:
            return largeCellHeight
        default: return normalCellHeight
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath) {
        case [1,0]:
            isPickerHidden = !isPickerHidden
            publishDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
        default: break
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard  segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let publishDate = publishDatePickerView.date
        let isComplete = isCompleteButton.isSelected
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isRead: isComplete, published: publishDate, notes: notes)
    }
    
    /*---> IBACTION FUNCTIONS <---*/
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    @IBAction func retrnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: publishDatePickerView.date)
    }
    
    /*---> CLASS FUNCTIONS <---*/
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    func updateDueDateLabel(date: Date) {
        publishDateLabel.text = ToDo.publishDateFormatter.string(from: date)
    }
    
    
}
