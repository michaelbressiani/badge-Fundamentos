//
//  DetailsCardViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class DetailsCardViewController: UIViewController {
    
    @IBOutlet weak var credCardImageImageView: UIImageView!
    @IBOutlet weak var credCardNameLabel: UILabel!
    @IBOutlet weak var credCardAliasLabel: UILabel!
    @IBOutlet weak var credCardIsCreditLabel: UILabel!
    @IBOutlet weak var credCardIsDebitLabel: UILabel!
    @IBOutlet weak var credCardNumberLabel: UILabel!
    @IBOutlet weak var credCardCodSecLabel: UILabel!
    
    var cardName: String = ""
    var card: Card = Card(alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    
    init?(coder: NSCoder, cardName: String, card: Card) {
        self.cardName = cardName
        self.card = card
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = convertBase64ToImage(card.image) {
            credCardImageImageView.image = image
        }
        
        func convertBase64ToImage(_ base64String: String) -> UIImage? {
            if let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
                return UIImage(data: imageData)
            }
            return nil
        }
        
        credCardNameLabel.text = cardName
        credCardAliasLabel.text = card.alias
        credCardIsCreditLabel.text = String(card.credit)
//        credCardDebitLabel.text = String(card.debit)
        credCardNumberLabel.text = card.number
        credCardCodSecLabel.text = card.codSec
    }
}
