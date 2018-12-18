//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Smith, Sam on 12/18/18.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let unwind = "UnwindToBookTable"
    }
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
    
    func updateView() {
        guard let book = book else {return}
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "SaveBook" else {return}
        
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let genre = genreTextField.text ?? ""
        let length = lengthTextField.text ?? ""
        
        book = Book(title: title, author: author, genre: genre, length: length)
    }
    
}
