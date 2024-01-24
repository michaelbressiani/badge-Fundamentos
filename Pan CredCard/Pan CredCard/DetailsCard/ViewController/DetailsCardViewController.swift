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
    var card: Card = Card(id: 0, name: "", alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    var viewModel: DetailsCardViewModel = DetailsCardViewModel()
    
    init?(coder: NSCoder, card: Card) {
        self.card = card
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsConfig()
        accessebilityLabels()
    }
    
    func elementsConfig() {
        credCardImageImageView.image = viewModel.convertBase64ToImage(base64String: card.image)
        credCardNameLabel.text = card.name
        credCardAliasLabel.text = card.alias
        credCardIsCreditLabel.text = String(card.credit)
        credCardIsDebitLabel.text = String(card.debit)
        credCardNumberLabel.text = card.number
        credCardCodSecLabel.text = card.codSec
    }
    
    func accessebilityLabels() {
        viewModel.accessibilityLabel(label: credCardNameLabel)
        viewModel.accessibilityLabel(label: credCardAliasLabel)
        viewModel.accessibilityLabel(label: credCardIsCreditLabel)
        viewModel.accessibilityLabel(label: credCardIsDebitLabel)
        viewModel.accessibilityLabel(label: credCardCodSecLabel)
    }
}
