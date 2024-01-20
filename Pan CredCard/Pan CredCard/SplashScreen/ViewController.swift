//
//  ViewController.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleAppLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        moveToListCardsView()
        elementsConfig()
    }
    
    func elementsConfig() {
        
        titleAppLabel.text = "Pan CredCard"
        titleAppLabel.textColor = .white
        titleAppLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        view.backgroundColor = UIColor(red: 0/255.0, green: 176/255.0, blue: 240/255.0, alpha: 1.0)
        
    }
}

