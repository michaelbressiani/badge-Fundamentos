//
//  ListCredCardsViewModel.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import Foundation

protocol CardsViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class CardsViewModel {
    
    private var service = CardsService()
    private var cardsList: ListCards?
    weak var delegate: CardsViewModelProtocol?
    
    func fetchCardsAlamofire() {
        service.getCardsAlamofire { result in
            switch result {
            case .success(let success):
                self.cardsList = success
                self.delegate?.successRequest()
            case .failure(_):
                self.delegate?.errorRequest()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return cardsList?.cardsList.count ?? 0
    }
    
    func getCardList(indexPath: IndexPath) -> Card {
        return cardsList?.cardsList[indexPath.row].values.first ??
                 Card(alias: "", credit: false, debit: false, number: "", codSec: "", image: "")
    }
    
}
