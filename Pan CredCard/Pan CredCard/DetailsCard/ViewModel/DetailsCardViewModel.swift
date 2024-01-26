//
//  DetailsViewModel.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 22/01/24.
//

import Foundation
import UIKit

class DetailsCardViewModel {
    
    func isDebitOrCredit(isDebit: Bool, isCredit: Bool) -> String {
        if isDebit && isCredit {
            return "Débito e Crédito"
        } else if isDebit {
            return "Débito"
        } else if isCredit {
            return "Crédito"
        } else {
            return "Nem débito nem crédito"
        }
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        return UIImage(data: Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) ?? Data()) ?? UIImage()
    }
    
    func accessibilityLabel(label: UILabel) {
        label.isAccessibilityElement = true
        label.accessibilityHint = label.text
    }
}
