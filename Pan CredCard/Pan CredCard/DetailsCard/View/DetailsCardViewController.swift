//
//  DetailsCardViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class DetailsCardViewController: UIViewController {
    
    @IBOutlet weak var cardImageImageView: UIImageView!
    @IBOutlet weak var titleCardNameLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var titleCardAliasLabel: UILabel!
    @IBOutlet weak var cardAliasLabel: UILabel!
    @IBOutlet weak var titleCardNumberLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var titleCardCodSecLabel: UILabel!
    @IBOutlet weak var cardCodSecLabel: UILabel!
    
    @IBOutlet weak var titleCardIsCreditOrIsDebitLabel: UILabel!
    @IBOutlet weak var cardIsCreditOrIsDebitLabel: UILabel!
    
    public var cardName: String = ""
    public var card: Card = Card(id: 0, name: "", alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    public var viewModel: DetailsCardViewModel = DetailsCardViewModel()
    
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
    
    public func elementsConfig() {
        
        cardImageImageView.image = viewModel.convertBase64ToImage(base64String: card.image)
        
        let titleCardNameString = "Cartão"
        let cardNameString = card.name
        labelConfig(titleCardNameLabel, cardNameLabel, titleCardNameString, cardNameString)
        
        let titleCardAliasString = "Bandeira"
        let cardAliasString = card.alias
        labelConfig(titleCardAliasLabel, cardAliasLabel, titleCardAliasString, cardAliasString)
        
        let titleCardNumberString = "Número do cartão"
        let cardNumberString = card.number
        labelConfig(titleCardNumberLabel, cardNumberLabel, titleCardNumberString, cardNumberString)
        
        let titleCardCodSecString = "Código de segurança"
        let cardCodSecString = card.codSec
        labelConfig(titleCardCodSecLabel, cardCodSecLabel, titleCardCodSecString, cardCodSecString)
        
        let titleCardIsCreditOrIsDebitString = "Função"
        let cardIsCreditOrIsDebitString = viewModel.isDebitOrCredit(isDebit: card.credit, isCredit: card.debit)
        labelConfig(titleCardIsCreditOrIsDebitLabel, cardIsCreditOrIsDebitLabel, titleCardIsCreditOrIsDebitString, cardIsCreditOrIsDebitString)
        
    }
    
    public func labelConfig(_ titleLabel: UILabel,_ label: UILabel, _ textTitleLabel: String,_ textLabel: String) {
        titleLabel.text = textTitleLabel
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = UIColor.lightGray
        
        label.text = textLabel
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    public func accessibilityLabel(label: UILabel) {
        label.isAccessibilityElement = true
        label.accessibilityHint = label.text
    }
    
    public func accessebilityLabels() {
        
        accessibilityLabel(label: titleCardNameLabel)
        accessibilityLabel(label: cardNameLabel)
        
        accessibilityLabel(label: titleCardAliasLabel)
        accessibilityLabel(label: titleCardAliasLabel)
        
        accessibilityLabel(label: titleCardIsCreditOrIsDebitLabel)
        accessibilityLabel(label: titleCardIsCreditOrIsDebitLabel)
        
        accessibilityLabel(label: titleCardNumberLabel)
        accessibilityLabel(label: titleCardNumberLabel)
        
        accessibilityLabel(label: titleCardCodSecLabel)
        accessibilityLabel(label: titleCardCodSecLabel)
    }
}
