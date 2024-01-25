//
//  ListCredCardsViewModel.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import Foundation
import UIKit

protocol CardsViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class ListCredCardsViewModel {
    
    private var service = CardsService()
    private var cards: ListCards?
    weak var delegate: CardsViewModelProtocol?
    
    func fetchCardsAlamofire() {
        service.getCardsAlamofire { result in
            switch result {
            case .success(let success):
                self.cards = success
                print(success)
                self.delegate?.successRequest()
            case .failure(let failure):
                print(failure)
                self.delegate?.errorRequest()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return cards?.cards.count ?? 0
    }
    
    func getCardList(indexPath: IndexPath) -> Card {
        return cards?.cards[indexPath.row] ??
        Card(id: 0, name: "", alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    }
    
    func accessibilityCell(cell: UITableViewCell, indexPath: IndexPath) {
        cell.isAccessibilityElement = true
        cell.accessibilityHint = "Cartão: \(getCardList(indexPath: indexPath).name)"
    }
        
    func convertBase64ToImage(base64String: String) -> UIImage {
            return UIImage(data: Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) ?? Data()) ?? UIImage()
        }
}
