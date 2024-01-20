//
//  CredCardsTableViewCell.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class CredCardsTableViewCell: UITableViewCell {
    
    static let identifier: String = "NameTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func configElements() {
//        nameCardLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
//    func setupCell(card: Card) {
//        nameCardLabel.text = Card.name
//    }
    
}
