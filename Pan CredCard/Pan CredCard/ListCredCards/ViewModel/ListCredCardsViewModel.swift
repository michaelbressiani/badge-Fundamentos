//
//  ListCredCardsViewModel.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import UIKit

protocol CardsViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class ListCredCardsViewModel {
    
    private var service = CardsService()
    public var cards: ListCards?
    weak var delegate: CardsViewModelProtocol?
    public var cardEmpty: Card = Card(id: 0, name: "", alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    public var viewController: UIViewController
    
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func fetchCardsAlamofire() {
        service.getCardsAlamofire { result in
            switch result {
            case .success(let success):
                self.cards = success
                self.delegate?.successRequest()
            case .failure(_):
                self.delegate?.errorRequest()
            }
        }
    }
    
    public func numberOfRows() -> Int {
        return cards?.cards.count ?? 0
    }
    
    public func getCardList(indexPath: IndexPath) -> Card {
        return cards?.cards[indexPath.row] ?? cardEmpty
    }
    
    public func accessibilityCell(cell: UITableViewCell, indexPath: IndexPath) {
        cell.isAccessibilityElement = true
        cell.accessibilityHint = "Cartão: \(getCardList(indexPath: indexPath).name)"
    }
    
    public func convertBase64ToImage(base64String: String) -> UIImage {
        if let data = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return UIImage()
    }
    
    public func lastForDigits(cardNumber: String) -> String {
        return String(cardNumber.suffix(4))
    }
    
    public func navegationToDetailsCard(indexPath: IndexPath) {
        
        let dcString = String(describing: DetailsCardViewController.self)
        let vcString = UIStoryboard(name: dcString, bundle: nil).instantiateViewController(identifier: dcString) { coder -> DetailsCardViewController? in
            return DetailsCardViewController(coder: coder, card: self.getCardList(indexPath: indexPath) )
        }
        
        viewController.navigationController?.pushViewController(vcString, animated: true)
    }
}
