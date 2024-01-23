//
//  CardsService.swift
//  Pan CredCard
//
//  Created by Michael Bressiani on 20/01/24.
//

import Foundation
import Alamofire

class CardsService {
    
    var secureStorageManager: SecureStorageManager = SecureStorageManager()
    
    func getCardsAlamofire(completion: @escaping (Result<ListCards, Error>) -> Void) {
        let urlString = "https://run.mocky.io/v3/12dc4c9d-9ca7-40ea-9852-0409a7a80785"
        AF.request(urlString, method: .get).responseDecodable(of: ListCards.self) { response in
            switch response.result {
            case .success(let cardsList):
                completion(.success(cardsList))
                self.secureStorageManager.saveCardNumbersToKeychain(cardsList: cardsList.cardsList.flatMap { $0.compactMap { $0.value.number } })
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
