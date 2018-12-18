//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Smith, Sam on 12/18/18.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = "\tAuthor: \(book.author)"
        genreLabel.text = "\tGenre: \(book.genre)"
        lengthLabel.text = "\tLength: \(book.length) pages"
    }
    

}
