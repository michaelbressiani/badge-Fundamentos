//
//  DetailsCardViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class DetailsCardViewController: UIViewController {

    @IBOutlet weak var aliasCardLabel: UILabel!
    
    var card: Card = Card(alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    
    init?(coder: NSCoder, card: Card) {
        self.card = card
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aliasCardLabel.text = card.alias
    }
    

   
}
