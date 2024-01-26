//
//  DetailsViewModel.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 22/01/24.
//

import UIKit

class DetailsCardViewModel {
    
    public func isDebitOrCredit(isDebit: Bool, isCredit: Bool) -> String {
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
    
    public func convertBase64ToImage(base64String: String) -> UIImage {
        return UIImage(data: Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) ?? Data()) ?? UIImage()
    }
    
    public func accessibilityLabel(label: UILabel) {
        label.isAccessibilityElement = true
        label.accessibilityHint = label.text
    }
}
