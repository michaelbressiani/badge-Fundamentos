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
        
        cardImageImageView.image = viewModel.convertBase64ToImage(base64String: card.image)
        
        titleConfig(titleCardNameLabel, "Cartão")
        config(cardNameLabel, card.name)
        
        titleConfig(titleCardAliasLabel, "Cartão")
        config(cardAliasLabel, card.alias)
        
        titleConfig(titleCardIsCreditOrIsDebitLabel, "Função")
        config(cardIsCreditOrIsDebitLabel, viewModel.isDebitOrCredit(isDebit: card.credit, isCredit: card.debit))
    
        titleConfig(titleCardNumberLabel, "Número do cartão")
        config(cardNumberLabel, card.number)
        
        titleConfig(titleCardCodSecLabel, "Código de segurança")
        config(cardCodSecLabel, card.codSec)
    }
    
    func titleConfig(_ label: UILabel, _ textLabel: String) {
        label.text = textLabel
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.lightGray
    }
    
    func config(_ label: UILabel, _ textLabel: String) {
        label.text = textLabel
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    func accessebilityLabels() {
        viewModel.accessibilityLabel(label: titleCardNameLabel)
        viewModel.accessibilityLabel(label: cardNameLabel)
        
        viewModel.accessibilityLabel(label: titleCardAliasLabel)
        viewModel.accessibilityLabel(label: titleCardAliasLabel)
        
        viewModel.accessibilityLabel(label: titleCardIsCreditOrIsDebitLabel)
        viewModel.accessibilityLabel(label: titleCardIsCreditOrIsDebitLabel)
        
        viewModel.accessibilityLabel(label: titleCardNumberLabel)
        viewModel.accessibilityLabel(label: titleCardNumberLabel)
        
        viewModel.accessibilityLabel(label: titleCardCodSecLabel)
        viewModel.accessibilityLabel(label: titleCardCodSecLabel)
    }
}
