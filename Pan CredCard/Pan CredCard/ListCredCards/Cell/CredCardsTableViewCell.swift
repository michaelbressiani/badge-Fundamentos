//
//  CredCardsTableViewCell.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

protocol convertBase64ToImage {
    func convertBase64ToImage(_ base64String: String) -> UIImage
}

class CredCardsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCardImageView: UIImageView!
    
    var viewModel: ListCredCardsViewModel = ListCredCardsViewModel(viewController:  UIViewController())
    static let identifier: String = "CredCardsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(card: Card) {
        let image = viewModel.convertBase64ToImage(base64String: card.image)
        imageCardImageView.image = image
    }
}

