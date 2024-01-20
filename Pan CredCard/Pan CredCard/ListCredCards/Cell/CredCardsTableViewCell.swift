//
//  CredCardsTableViewCell.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class CredCardsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCardImageView: UIImageView!
    
    static let identifier: String = "CredCardsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func configElements() {
    }
    func setupCell(card: Card) {
        if let image = convertBase64ToImage(card.image) {
            imageCardImageView.image = image
        }
    }
    
    func convertBase64ToImage(_ base64String: String) -> UIImage? {
        if let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
            return UIImage(data: imageData)
        }
        return nil
    }
}
